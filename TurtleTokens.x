{ 
module TurtleTokens where 
import Data.List
}

%wrapper "basic" 
$digit =  0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
    $white+       ; 
    "--".*        ; 
    "@base" { \s -> TokenBase }
    "@prefix" { \s -> TokenPrefix }
    "<" { \s -> TokenOpenURI }
    ">" { \s -> TokenCloseURI }
    "." { \s -> TokenEnd }
    [\+ \-]* $digit+ { \s -> TokenNumber (read $ convertToNumber s) }
    true { \s -> TokenTrue }
    false { \s -> TokenFalse }
    ";" { \s -> TokenPredList }
    "," { \s -> TokenObjectList }
    ":" { \s -> TokenColon }
    "http://" [$alpha $digit \. \/ \#]+ { \s -> TokenHTTP s }
    [$alpha $digit \. \/ \#]+ { \s -> TokenString s }
    \" $alpha+ \" { \s -> TokenStringLiteral (removeQuotes s) }

    -- $digit+  {\s -> TokenInt (read s) }
    -- $alpha [$alpha $digit \_ \’]*   { \s -> TokenVar s } 
{ 
-- Each action has type :: String -> Token 
-- The token type: 

convertToNumber n = [x | x <- n, x /= '+']
removeQuotes str = [x | x <- str, x /= '\"']

data Token  =
    TokenBase           | 
    TokenPrefix         |
    TokenEnd            | 
    TokenOpenURI        |
    TokenCloseURI       |
    TokenHTTP   String  | 
    TokenString String  |
    TokenStringLiteral String |
    TokenTrue           |
    TokenFalse          |
    TokenPredList       | 
    TokenObjectList     | 
    TokenColon          |
    TokenNumber Int

    deriving (Eq,Show) 

}
