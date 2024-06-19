import Tokens
import Grammar
import System.Environment
import System.IO
import TurtleParser
import TurtleGrammar
import Data.List
import Data.Maybe
import Text.Read ( readMaybe )

main :: IO ()
main = do
            fileName <- getArgs
            fileContent <- readFile (head fileName)
            let parsed = parseOur(alexScanTokens fileContent)
            val <- evalE parsed
            let str = printTriples (sort (nub val))
            putStrLn str

evalE (Grammar.E exp) = evalExp exp
evalE (Grammar.Es expr next) = do
                                  l1 <- evalExp expr
                                  l2 <- evalE next
                                  let val = l1 ++ l2
                                  return val

evalExp (FILE f) = do
                      parse f
evalExp (JOIN e1 e2) = do
                          l1 <- evalExp e1
                          l2 <- evalExp e2
                          let result = l1 ++ l2
                          return result
evalExp (INTERSECT e1 e2) = do
                               l1 <- evalExp e1
                               l2 <- evalExp e2
                               let result = l1 `intersect` l2
                               return result
evalExp (SELECT (Grammar.E (FILES f1 f2)) listCon) = do
                                                        l1 <- parse f1
                                                        l2 <- parse f2
                                                        let val = evalListCon listCon l1 l2
                                                        return val
evalExp (SELECT exp con) = do
                              p <- evalE exp
                              let val = evalCon con p
                              return val
evalExp (EDIT exp eCon) = do
                             p <- evalExp exp
                             let val = editConList eCon p
                             return val
evalExp (ADD str) = do
                       let l = parseString str
                       return l

editConList (SINGLE_EDIT e) l = edit e l
editConList (MULTI_EDIT e next) l = editConList next (edit e l)

edit _ [] = []
edit (EditSubject l) ([Triple (Subject s) p o]:xs) = [Triple (Subject (linkToHTTP l)) p o] : edit (EditSubject l) xs
edit (EditPredicate l) ([Triple s (Predicate p) o]:xs) = [Triple s (Predicate (linkToHTTP l)) o] : edit (EditPredicate l) xs
edit (EditObject e) ([Triple s p o]:xs) = [Triple s p (getObject e)] : edit (EditObject e) xs
edit (MAP Plus i OBJECTS) ([Triple s p (Literal (Int n))]:xs) = [Triple s p (Literal (Int (n + i)))] : edit (MAP Plus i OBJECTS) xs
edit (MAP Minus i OBJECTS) ([Triple s p (Literal (Int n))]:xs) = [Triple s p (Literal (Int (n - i)))] : edit (MAP Minus i OBJECTS) xs
edit (MAP Multiply i OBJECTS) ([Triple s p (Literal (Int n))]:xs) = [Triple s p (Literal (Int (n * i)))] : edit (MAP Multiply i OBJECTS) xs
edit (MAP Power i OBJECTS) ([Triple s p (Literal (Int n))]:xs) = [Triple s p (Literal (Int (n ^ i)))] : edit (MAP Power i OBJECTS) xs
edit (MAP x y z) ([Triple s p o]:xs) = [Triple s p o] : edit (MAP x y z) xs --If the object is not int, continue

evalListCon (Condition (LISTCON l1 (CONTAINS SUBJECTS))) f1 f2 = getTriplesSubject f2 (getDupEl (getList l1 f1) (getList SUBJECTS f2))
evalListCon (Condition (LISTCON l1 (CONTAINS PREDICATES))) f1 f2 = getTriplesPredicate f2 (getDupEl (getList l1 f1) (getList PREDICATES f2))
evalListCon (Condition (LISTCON l1 (CONTAINS OBJECTS))) f1 f2 = getTriplesObjects f2 (getDupEl (getList l1 f1) (getList OBJECTS f2))
--Can add SUBJECTS etc as a parameter for the functions below, this way we merge 3 functions into 1 and evalListCon becomes 1 line
getTriplesSubject _ [] = []
getTriplesSubject l (x:xs) = parseEq (SUBJECT (EQUALS (stringToLink x))) l ++ getTriplesSubject l xs

getTriplesPredicate _ [] = []
getTriplesPredicate l (x:xs) = parseEq (PREDICATE (EQUALS (stringToLink x))) l ++ getTriplesPredicate l xs

getTriplesObjects _ [] = []
getTriplesObjects l (x:xs) = parseEq (OBJECT (O_EQUALS (stringToOVar x))) l ++ getTriplesObjects l xs

getDupEl [] _ = []
getDupEl (x:xs) ys = check ys ++ getDupEl xs ys
  where check [] = []
        check (z:zs) | x == z = x : check zs
                     | otherwise = check zs

getList _ [] = []
getList SUBJECTS ([Triple (Subject s) _ _]:xs) = valueToString s : getList SUBJECTS xs
getList PREDICATES ([Triple _ (Predicate p) _]:xs) = valueToString p : getList PREDICATES xs
getList OBJECTS ([Triple _ _ (Object o)]:xs) = valueToString o : getList OBJECTS xs
getList OBJECTS ([Triple _ _ (Literal(StringLiteral s))]:xs) = s : getList OBJECTS xs
getList OBJECTS ([Triple _ _ (Literal(Int i))]:xs) = show i : getList OBJECTS xs
getList OBJECTS ([Triple _ _ (Literal(Bool b))]:xs) = literalBoolToStr b : getList OBJECTS xs

evalCon (Condition (OBJECT (GreaterThan str))) p | null (parseMathObject p str (>)) = []
                                                 | otherwise = parseMathObject p str (>)
evalCon (Condition (OBJECT (LessThan str))) p | null (parseMathObject p str (<)) = []
                                              | otherwise = parseMathObject p str (<)
evalCon (Condition (OBJECT (LessThanOrEqual str))) p | null (parseMathObject p str (<=)) = []
                                                     | otherwise = parseMathObject p str (<=)
evalCon (Condition (OBJECT (GreaterThanOrEqual str))) p | null (parseMathObject p str (>=)) = []
                                                        | otherwise = parseMathObject p str (>=)
evalCon (Condition x) p | null (parseEq x p) = []
                        | otherwise = parseEq x p
evalCon (OR con next) p = evalCon con p ++ evalCon next p
evalCon (AND con next) p = evalCon next (evalCon con p)
--might need to allow empty lists so that only one condition of OR returning something is valid

parseEq _ [] = []
parseEq (SUBJECT (EQUALS l)) ([Triple (Subject s) p o]:xs) | s == linkToHTTP l = [Triple (Subject s) p o] : parseEq (SUBJECT (EQUALS l)) xs
                                                           | otherwise  = parseEq (SUBJECT (EQUALS l)) xs
parseEq (PREDICATE (EQUALS l)) ([Triple s (Predicate p) o]:xs) | p == linkToHTTP l = [Triple s (Predicate p) o] : parseEq (PREDICATE (EQUALS l)) xs
                                                               | otherwise = parseEq (PREDICATE (EQUALS l)) xs
parseEq (OBJECT (O_EQUALS (OBJECT_ALL a))) xs = parseObjAll a xs
parseEq (OBJECT (O_EQUALS v)) ([Triple s p o]:xs) | o == getObject v = [Triple s p o] : parseEq (OBJECT (O_EQUALS v)) xs
                                                  | otherwise = parseEq (OBJECT (O_EQUALS v)) xs
parseEq (SUBJECT (NOTEQUAL l)) ([Triple (Subject s) p o]:xs)  | s /= linkToHTTP l = [Triple (Subject s) p o] : parseEq (SUBJECT (NOTEQUAL l)) xs
                                                              | otherwise = parseEq (SUBJECT (NOTEQUAL l)) xs
parseEq (PREDICATE (NOTEQUAL l)) ([Triple s (Predicate p) o]:xs) | p /= linkToHTTP l = [Triple s (Predicate p) o] : parseEq (PREDICATE (NOTEQUAL l)) xs
                                                                 | otherwise = parseEq (PREDICATE (NOTEQUAL l)) xs
parseEq (OBJECT (O_NOTEQUAL (OBJECT_ALL a))) xs = [x | x <- xs, x `notElem` parseObjAll a xs]                                    
parseEq (OBJECT (O_NOTEQUAL v)) ([Triple s p o]:xs)  | o /= getObject v = [Triple s p o] : parseEq (OBJECT (O_NOTEQUAL v)) xs
                                                     | otherwise = parseEq (OBJECT (O_NOTEQUAL v)) xs
parseEq _ _ = []

parseObjAll _ [] = []
parseObjAll OBJECT_ALL_INT ([Triple s p (Literal (Int i))]:xs) = [Triple s p (Literal (Int i))] : parseObjAll OBJECT_ALL_INT xs
parseObjAll OBJECT_ALL_INT (t:xs) = parseObjAll OBJECT_ALL_INT xs
parseObjAll OBJECT_ALL_BOOL  ([Triple s p (Literal (Bool b))]:xs) = [Triple s p (Literal (Bool b))] : parseObjAll OBJECT_ALL_BOOL xs
parseObjAll OBJECT_ALL_BOOL (t:xs) = parseObjAll OBJECT_ALL_BOOL xs
parseObjAll OBJECT_ALL_STRING ([Triple s p (Literal (StringLiteral str))]:xs) = [Triple s p (Literal (StringLiteral str))] : parseObjAll OBJECT_ALL_STRING xs
parseObjAll OBJECT_ALL_STRING (t:xs) = parseObjAll OBJECT_ALL_STRING xs
parseObjAll OBJECT_ALL_URI ([Triple s p (Object (HTTP l))]:xs) = [Triple s p (Object (HTTP l))] : parseObjAll OBJECT_ALL_URI xs
parseObjAll OBJECT_ALL_URI (t:xs) = parseObjAll OBJECT_ALL_URI xs

parseMathObject :: [[Ex]] -> Int -> (Int -> Int -> Bool) -> [[Ex]]
parseMathObject [] _ _ = []
parseMathObject (x:xs) n op = match x
    where match [Triple _ _ (Literal (Int i))] | i `op` n = x : parseMathObject xs n op
                                               | otherwise = parseMathObject xs n op
          match _ = parseMathObject xs n op

literalBoolToStr b | b = "true"
                   | otherwise = "false"

getObject (OBJECT_STRING s) = Literal (StringLiteral s)
getObject (OBJECT_HTTP l) = Object (linkToHTTP l)
getObject (OBJECT_INT i) = Literal (Int i)
getObject OBJECT_TRUE = Literal (Bool True)
getObject OBJECT_FALSE = Literal (Bool False)

linkToHTTP (Link l) = HTTP l

stringToLink str | "http://" `isInfixOf` str = Link str
                 | otherwise = error "The string is not a valid link" --may remove, don't know if needed

stringToOVar str | "http://" `isInfixOf` str = OBJECT_HTTP (Link str)
                 | str == "true" = OBJECT_TRUE
                 | str == "false" = OBJECT_FALSE
                 | isJust (readMaybe str :: Maybe Int) = OBJECT_INT (read str)
                 | otherwise  = OBJECT_STRING str

printTriples = concatMap (printTriple . head)

printTriple (Triple (Subject x) (Predicate y) (Object (HTTP z))) = "<" ++ valueToString x ++ ">" ++ "<" ++ valueToString y ++ ">" ++  "<" ++ z ++ ">" ++ " ." ++ "\n"
printTriple (Triple (Subject x) (Predicate y) (Literal (Bool b))) = "<" ++ valueToString x ++ ">" ++ "<" ++ valueToString y ++ ">" ++  " " ++ literalBoolToStr b ++ " ." ++ "\n"
printTriple (Triple (Subject x) (Predicate y) (Literal (Int i))) = "<" ++ valueToString x ++ ">" ++ "<" ++ valueToString y ++ ">" ++  " " ++ show i ++ " ." ++ "\n"
printTriple (Triple (Subject x) (Predicate y) (Literal (StringLiteral s))) = "<" ++ valueToString x ++ ">" ++ "<" ++ valueToString y ++ ">" ++  " " ++ show s ++ " ." ++ "\n"

--debug purposes only
test f = do
            fileContent <- readFile f
            let parsed = parseOur(alexScanTokens fileContent)
            return parsed
