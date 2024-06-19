{ 
module Tokens where 
import Data.List
}

%wrapper "posn" 
$digit =  0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
    $white+       ; 
    "--".*        ; 
    "JOIN" { \p s -> TokenJoin p }
    "WHERE" { \p s -> TokenWhere p }
    "SELECT" { \p s -> TokenSelect p }
    [$alpha $digit]+ ".ttl" { \p s -> TokenFile p s}
    "[" [$alpha $digit \. \/ \# \< \> $white \@ \: \" \+ \-]* "]" { \p s -> TokenList p (removeParen s) }
    "SUBJECT" { \p s -> TokenSubject p }
    "PREDICATE" { \p s -> TokenPredicate p }
    "OBJECT" { \p s -> TokenObject p }
    "OR" { \p s -> TokenOr p }
    "==" { \p s -> TokenEquals p }
    "SUBJECTS" { \p s -> TokenSubjects p }
    "PREDICATES" { \p s -> TokenPredicates p }
    "OBJECTS" { \p s -> TokenObjects p }
    "CONTAINS" { \p s -> TokenContains p }
    "," { \p s -> TokenComma p }
    "AND" { \p s -> TokenAnd p }
    ">" { \p s -> TokenGreaterThan p }
    "<" { \p s -> TokenLessThan p }
    ">=" { \p s -> TokenGreaterThanOrEqual p }
    "<=" { \p s -> TokenLessThanOrEqual p }
    "EDIT" { \p s -> TokenEdit p }
    ":" { \p s -> TokenColon p }
    "=" { \p s -> TokenSet p }
    "ADD" { \p s -> TokenAdd p }
    [\-]* $digit+ { \p s -> TokenInt p (read s)}
    "+" { \p s -> TokenPlus p }
    "-" { \p s -> TokenMinus p }
    "*" { \p s -> TokenMultiply p }
    "^" { \p s -> TokenPower p }
    "MAP" { \p s -> TokenMap p }
    "!=" { \p s -> TokenNotEqual p }
    "true" { \p s -> TokenTrue p }
    "false" { \p s -> TokenFalse p }
    "http://" [$alpha $digit \. \/ \#]+ { \p s -> TokenHTTP p s}
    "INT" { \p s ->TokenSelectInt p }
    "BOOL" { \p s -> TokenSelectBool p }
    "STRING" { \p s -> TokenSelectString p }
    "URI" { \p s -> TokenSelectURI p }
    "INTERSECT" { \p s -> TokenIntersect p }
    \" $alpha+ \" { \p s -> TokenString p (removeQuotes s) }

{ 
-- Each action has type :: String -> Token 
-- The token type: 

convertToNumber n = [x | x <- n, x /= '+']
removeQuotes str = [x | x <- str, x /= '\"']
removeParen str = [x | x <- str, x /= '[', x /= ']'] 

data Token  =
    TokenJoin AlexPosn |
    TokenWhere AlexPosn |
    TokenString AlexPosn String |
    TokenSelect AlexPosn |
    TokenList AlexPosn String |
    TokenPredicate AlexPosn |
    TokenSubject AlexPosn |
    TokenObject AlexPosn |
    TokenEquals AlexPosn |
    TokenOr AlexPosn |
    TokenSubjects AlexPosn |
    TokenPredicates AlexPosn |
    TokenObjects AlexPosn |
    TokenContains AlexPosn |
    TokenComma AlexPosn |
    TokenAnd AlexPosn |
    TokenLessThan AlexPosn |
    TokenGreaterThan AlexPosn |
    TokenGreaterThanOrEqual AlexPosn  | 
    TokenLessThanOrEqual AlexPosn |
    TokenEdit AlexPosn |
    TokenColon AlexPosn |
    TokenSet AlexPosn |
    TokenAdd AlexPosn |
    TokenPlus AlexPosn |
    TokenMinus AlexPosn |
    TokenMultiply AlexPosn |
    TokenPower AlexPosn |
    TokenMap AlexPosn |
    TokenInt AlexPosn Int |
    TokenNotEqual AlexPosn |
    TokenTrue AlexPosn |
    TokenFalse AlexPosn |
    TokenHTTP AlexPosn String |
    TokenSelectInt AlexPosn |
    TokenSelectBool AlexPosn |
    TokenSelectString AlexPosn |
    TokenSelectURI AlexPosn |
    TokenIntersect AlexPosn | 
    TokenFile AlexPosn String

    deriving (Eq,Show) 

}
