{-# OPTIONS_GHC -Wno-incomplete-patterns #-} --remove!
module TurtleParser where
import TurtleTokens
import TurtleGrammar
import System.Environment
import System.IO
import Data.List
import Text.Read (readMaybe)
import Data.Maybe

parse :: FilePath -> IO [[Ex]]
parse filename = do
                    fileContent <- readFile filename
                    let val = parseTurtle(alexScanTokens fileContent)
                    -- print val -- debug only
                    let expanded = expandTurtle val val
                    return expanded
                    
parseString string = expandTurtle (parseTurtle (alexScanTokens string)) (parseTurtle (alexScanTokens string))

--if prefix is defined last(e.g. the last line is not triple) this function crashes
expandTurtle :: Exp -> Exp -> [[Ex]]
expandTurtle og (E x) = parseEx og x
expandTurtle og (Es (Base s) next) = expandTurtle og next
expandTurtle og (Es (Prefix s v) next) = expandTurtle og next
expandTurtle og (Es x next) = parseEx og x ++ expandTurtle og next


parseEx og (Triple s p o) = [[Triple (parseSubject og s) (parsePredicate og p) (parseObject og o)]]
parseEx og (TriplePredList s predList) = expandPredList og s predList
parseEx og (TripleObjectList s p objList) = expandObjectList og s p objList
parseEx _ _ = [] --if a base declaration or prefix declaration is the last line of a file

expandPredList og s (PredList p o next) = [Triple (parseSubject og s) (parsePredicate og p) (parseObject og o)] : expandPredList og s next
expandPredList og s (PredListEnd p o) = [[Triple (parseSubject og s) (parsePredicate og p) (parseObject og o)]]

expandObjectList og s p (ObjectList o next) = [Triple (parseSubject og s) (parsePredicate og p) (parseObject og o)] : expandObjectList og s p next
expandObjectList og s p (ObjectListEnd o) = [[Triple (parseSubject og s) (parsePredicate og p) (parseObject og o)]]

getBase :: Exp -> String
getBase (E (Base s)) = s
getBase (Es (Base s) next) = s
getBase (Es _ next) = getBase next
getBase _ = error "No @base declaration in this file"

--Check if prefixes can be defined in terms of other prefixes (e.g. @prefix foo:bar or just general prefix use)
getPrefix :: Exp -> Exp -> String -> VALUE
getPrefix og (E (Prefix s (HTTP l))) name | s == name = HTTP l
getPrefix og (E (Prefix s (String str))) name | s == name = HTTP (getBase og ++ str)
getPrefix og (E (Prefix s (Num n))) name | s == name = HTTP (getBase og ++ show n)
getPrefix og (Es (Prefix s (HTTP l)) next) name | s == name = HTTP l
                                         | otherwise = getPrefix og next name
getPrefix og (Es (Prefix s (String str)) next) name | s == name = HTTP (getBase og ++ str)
                                                    | otherwise = getPrefix og next name
getPrefix og (Es (Prefix s (Num n)) next) name | s == name = HTTP (getBase og ++ show n)
                                                    | otherwise = getPrefix og next name                                                    
getPrefix og (Es _ next) name = getPrefix og next name

-- prefix use might not be needed as string
valueToString :: VALUE -> String
valueToString (String s) = s
valueToString (Num i) = show i
valueToString (HTTP s) = s

stringToHTTP :: String -> VALUE
stringToHTTP s | "http://" `isInfixOf` s = HTTP s
               | otherwise = error "The value is not a valid HTTP value!"

stringToObject :: String -> OBJECT
stringToObject s | "http://" `isInfixOf` s = Object (HTTP s)
                 | s == "true" = Literal (Bool True)
                 | s == "false" = Literal (Bool False)
                 | isJust (readMaybe s :: Maybe Int) = Literal (Int (read s))
                 | otherwise = Literal (StringLiteral s)


parseSubject og (Subject (String s)) = Subject (HTTP (getBase og ++ s))
parseSubject og (Subject (Num n)) = Subject (HTTP (getBase og ++ show n))
parseSubject og (Subject (HTTP l)) = Subject (HTTP l)
parseSubject og (Subject (PrefixUse n s)) = Subject (HTTP (valueToString (getPrefix og og n) ++ valueToString s))

parsePredicate og (Predicate (String s)) = Predicate (HTTP (getBase og ++ s))
parsePredicate og (Predicate (Num n)) = Predicate (HTTP (getBase og ++ show n))
parsePredicate og (Predicate (HTTP l)) = Predicate (HTTP l)
parsePredicate og (Predicate (PrefixUse n s)) = Predicate (HTTP (valueToString (getPrefix og og n) ++ valueToString s))

--TODO: Need to add literals handling
parseObject og (Object (String s)) = Object (HTTP (getBase og ++ s))
parseObject og (Object (Num n)) = Object (HTTP (getBase og ++ show n))
parseObject og (Object (HTTP l)) = Object (HTTP l)
parseObject og (Object (PrefixUse n s)) = Object (HTTP (valueToString (getPrefix og og n) ++ valueToString s))
parseObject og obj = obj --Handle literal values
