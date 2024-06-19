{ 
module Grammar where 
import Tokens 
}

%name parseOur
%tokentype { Token } 
%error { parseError }
%token 
    join { TokenJoin _ }
    where { TokenWhere _ }
    select { TokenSelect _ }
    string { TokenString _ $$ }
    http { TokenHTTP _ $$ }
    file { TokenFile _ $$ }
    subject { TokenSubject _ }
    predicate { TokenPredicate _ }
    object { TokenObject _ }
    "==" { TokenEquals _ }
    or { TokenOr _ }
    subjects { TokenSubjects _ }
    predicates { TokenPredicates _ }
    objects { TokenObjects _ }
    contains { TokenContains _ }
    "," { TokenComma _ }
    and { TokenAnd _ }
    "<" { TokenLessThan _ }
    ">" { TokenGreaterThan _ }
    "<=" { TokenLessThanOrEqual _ }
    ">=" { TokenGreaterThanOrEqual _ }
    edit { TokenEdit _ }
    ":" { TokenColon _ }
    "=" { TokenSet _ }
    add { TokenAdd _ }
    "+" { TokenPlus _ }
    "-" { TokenMinus _ }
    "*" { TokenMultiply _ }
    "^" { TokenPower _ }
    int { TokenInt _ $$ }
    map { TokenMap _ }
    "!=" { TokenNotEqual _ }
    true { TokenTrue _ }
    false { TokenFalse _ }
    INT { TokenSelectInt _ }
    BOOL { TokenSelectBool _ }
    STRING { TokenSelectString _ }
    URI { TokenSelectURI _ }
    list { TokenList _ $$ }
    intersect { TokenIntersect _ }

%left and
%right or
%% 
Exp : E { E $1 }
    | E Exp { Es $1 $2 }

E : select Exp where CONDITIONAL { SELECT $2 $4 } 
  | join E E { JOIN $2 $3 }
  | file { FILE $1 }
  | file "," file { FILES $1 $3}
  | edit E ":" EDIT_CON_LIST { EDIT $2 $4 }
  | list { ADD $1 }
  | intersect E E { INTERSECT $2 $3 }

EDIT_CON_LIST : EDIT_CON { SINGLE_EDIT $1 }
              | EDIT_CON and EDIT_CON_LIST { MULTI_EDIT $1 $3 } 

EDIT_CON : subject "=" LINK { EditSubject $3 }
         | predicate "=" LINK { EditPredicate $3 }
         | object "=" OBJECT_VAR { EditObject $3 } --make it so it can also take an int
         | map Math_Functions int LIST { MAP $2 $3 $4 }

LINK : http { Link $1 }

OBJECT_VAR : string { OBJECT_STRING $1 }
           | int { OBJECT_INT $1 }
           | true { OBJECT_TRUE }
           | false { OBJECT_FALSE }
           | LINK { OBJECT_HTTP $1 }
           | OBJECT_SELECT_ALL { OBJECT_ALL $1 }

OBJECT_SELECT_ALL : INT { OBJECT_ALL_INT }
                  | BOOL { OBJECT_ALL_BOOL }
                  | STRING { OBJECT_ALL_STRING }
                  | URI { OBJECT_ALL_URI }

Math_Functions : "+" { Plus }
               | "-" { Minus }
               | "*" { Multiply }
               | "^" { Power }

CONDITIONAL : CONDITION { Condition $1 }
     | CONDITIONAL or CONDITIONAL { OR $1 $3 }
     | CONDITIONAL and CONDITIONAL { AND $1 $3 }

CONDITION : subject OPERATION { SUBJECT $2 }
          | predicate OPERATION { PREDICATE $2 }
          | object OBJECT_OPERATION { OBJECT $2 }
          | LIST LIST_OPERATION { LISTCON $1 $2 }

LIST : subjects { SUBJECTS }
     | predicates { PREDICATES }
     | objects { OBJECTS }

LIST_OPERATION : contains LIST { CONTAINS $2 }

OPERATION : "==" LINK { EQUALS $2 }
          | "!=" LINK { NOTEQUAL $2 }

OBJECT_OPERATION : "==" OBJECT_VAR { O_EQUALS $2 } 
                 | "!=" OBJECT_VAR { O_NOTEQUAL $2 }
                 | ">" int { GreaterThan $2 }
                 | "<" int { LessThan $2 }
                 | "<=" int { LessThanOrEqual $2 }
                 | ">=" int { GreaterThanOrEqual $2 }
{ 
parseError :: [Token] -> a
parseError x = error ("Grammar error at: " ++ tokenPosn (head x) ++ ". This is not allowed in the syntax!")
 
data Expression = E Expr
                | Es Expr Expression 
                deriving Show

data Expr = SELECT Expression CONDITIONAL
          | JOIN Expr Expr
          | FILE String
          | FILES String String
          | EDIT Expr EDIT_CON_LIST
          | ADD String
          | INTERSECT Expr Expr
          deriving Show

data Math_Functions = Plus
                    | Minus
                    | Multiply
                    | Power
                    deriving Show

data EDIT_CON_LIST = SINGLE_EDIT EDIT_CON
                   | MULTI_EDIT EDIT_CON EDIT_CON_LIST
                   deriving Show

data EDIT_CON = EditSubject LINK
              | EditPredicate LINK
              | EditObject OBJECT_VAR
              | MAP Math_Functions Int LIST
              deriving Show

data OBJECT_VAR = OBJECT_STRING String
                | OBJECT_INT Int
                | OBJECT_TRUE
                | OBJECT_FALSE
                | OBJECT_HTTP LINK
                | OBJECT_ALL OBJECT_SELECT_ALL
                deriving Show

data OBJECT_SELECT_ALL = OBJECT_ALL_INT
                       | OBJECT_ALL_BOOL
                       | OBJECT_ALL_STRING
                       | OBJECT_ALL_URI
                       deriving Show

data LINK = Link String
          deriving Show

data CONDITIONAL = Condition CONDITION
          | OR CONDITIONAL CONDITIONAL
          | AND CONDITIONAL CONDITIONAL
          deriving Show

data CONDITION = SUBJECT OPERATION
               | PREDICATE OPERATION
               | OBJECT OBJECT_OPERATION
               | LISTCON LIST LIST_OPERATION
               deriving Show

data LIST = SUBJECTS
          | PREDICATES
          | OBJECTS
          deriving Show

data LIST_OPERATION = CONTAINS LIST
                    deriving Show

data OPERATION = EQUALS LINK
               | NOTEQUAL LINK
               deriving Show

data OBJECT_OPERATION = O_EQUALS OBJECT_VAR
                      | O_NOTEQUAL OBJECT_VAR
                      | GreaterThan Int
                      | LessThan Int
                      | LessThanOrEqual Int
                      | GreaterThanOrEqual Int
                      deriving Show

tokenPosn :: Token -> String
tokenPosn (TokenJoin (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenWhere (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenString (AlexPn x y z) s) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenSelect (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenList (AlexPn x y z) s) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenPredicate (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenSubject (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenObject (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenEquals (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenOr (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenSubjects (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenPredicates (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenObjects (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenContains (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenComma (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenAnd (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenLessThan (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenGreaterThan (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenGreaterThanOrEqual (AlexPn x y z) ) = "line " ++ show y ++ ", char " ++ show z 
tokenPosn (TokenLessThanOrEqual (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenEdit (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenColon (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenSet (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenAdd (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenPlus (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenMinus (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenMultiply (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenPower (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenMap (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenInt (AlexPn x y z) i) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenNotEqual (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenTrue (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenFalse (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenHTTP (AlexPn x y z) s) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenSelectInt (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenSelectBool (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenSelectString (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenSelectURI (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z
tokenPosn (TokenIntersect (AlexPn x y z)) = "line " ++ show y ++ ", char " ++ show z 
tokenPosn (TokenFile (AlexPn x y z) s) = "line " ++ show y ++ ", char " ++ show z                       
} 