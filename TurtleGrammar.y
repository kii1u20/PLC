{ 
module TurtleGrammar where 
import TurtleTokens 
}

%name parseTurtle
%tokentype { Token } 
%error { parseError }
%token 
    base { TokenBase }
    prefix { TokenPrefix }
    "<" { TokenOpenURI }
    ">" { TokenCloseURI }
    end { TokenEnd }
    stringLiteral { TokenStringLiteral $$ }
    string { TokenString $$ }
    num { TokenNumber $$ }
    true { TokenTrue }
    false { TokenFalse }
    ";" { TokenPredList }
    "," { TokenObjectList }
    ":" { TokenColon }
    http { TokenHTTP $$ }

%nonassoc ";"
%nonassoc "."

%expect 1 --expect the 1 shift/reduce conflict from the PREDICATE_LIST

%% 
Exp : E { E $1}
    | E Exp { Es $1 $2 } --make it $2 $1 to make it left recursive (possibly and Exp E)

E : base "<" http ">" end { Base $3 }
  | prefix string ":" "<" VALUE ">" end { Prefix $2 $5 }
  | SUBJECT PREDICATE OBJECT end { Triple $1 $2 $3}
  | SUBJECT PREDICATE_LIST end { TriplePredList $1 $2 } --shift/reduce conflict, don't know wheter to do this or the before rule first(may not need fixing)
  | SUBJECT PREDICATE OBJECT_LIST end { TripleObjectList $1 $2 $3 }

SUBJECT : "<" VALUE ">" { Subject $2 }
        | string ":" VALUE { Subject (PrefixUse $1 $3) }

PREDICATE : "<" VALUE ">" { Predicate $2 }
          | string ":" VALUE { Predicate (PrefixUse $1 $3) }

PREDICATE_LIST : PREDICATE OBJECT { PredListEnd $1 $2 } --causes shift/reduce conflict(related to the comment in E)
               | PREDICATE OBJECT ";" PREDICATE_LIST { PredList $1 $2 $4 }

OBJECT : "<" VALUE ">" { Object $2 }
       | LITERAL { Literal $1 }
       | string ":" VALUE { Object (PrefixUse $1 $3) }

--TODO: Ask Julian whether a predicate list can contail object lists or they are completely separate!
OBJECT_LIST : OBJECT { ObjectListEnd $1 }
            | OBJECT "," OBJECT_LIST { ObjectList $1 $3 }

LITERAL : true { Bool True }
        | false { Bool False }
        | num { Int $1 }
        | stringLiteral { StringLiteral $1 }

VALUE : string {String $1 }
      | num { Num $1 }
      | http {HTTP $1 }

{ 
parseError :: [Token] -> a
parseError _ = error "Parse error"
 
data Exp = E Ex
         | Es Ex Exp --make it Exp Ex to make it left recursive
         deriving (Show, Eq, Ord)

data Ex = Base String 
        | Prefix String VALUE
        | Triple SUBJECT PREDICATE OBJECT
        | TriplePredList SUBJECT PREDICATE_LIST
        | TripleObjectList SUBJECT PREDICATE OBJECT_LIST
        deriving (Show, Eq, Ord)

data SUBJECT = Subject VALUE
             deriving (Show, Eq, Ord)

data PREDICATE = Predicate VALUE
               deriving (Show, Eq, Ord)

data PREDICATE_LIST = PredList PREDICATE OBJECT PREDICATE_LIST
                    | PredListEnd PREDICATE OBJECT
                    deriving (Show, Eq, Ord)

data OBJECT = Object VALUE
            | Literal LITERAL
            deriving (Show, Eq, Ord)

data OBJECT_LIST = ObjectList OBJECT OBJECT_LIST
                 | ObjectListEnd OBJECT
                 deriving (Show, Eq, Ord)

data LITERAL = Int Int
             | Bool Bool
             | StringLiteral String
             deriving (Show, Eq, Ord)

data VALUE = String String
            | Num Int
            | HTTP String
            | PrefixUse String VALUE --might be bad idea to have this here
            deriving (Show, Eq, Ord)

} 
