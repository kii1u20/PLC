{-# OPTIONS_GHC -w #-}
module TurtleGrammar where 
import TurtleTokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,78) ([28672,4,9088,0,0,32768,8,1024,0,512,0,2096,0,32,0,32768,35,0,0,6144,4,8,0,0,0,0,0,0,256,0,16,3984,0,2,49152,32,32768,0,2096,4096,0,0,0,1536,16384,0,0,0,8384,0,0,0,4,0,0,0,0,0,32,32768,0,0,0,0,0,2096,8192,0,3072,2,4,0,0,0,0,68,8192,31,0,0,0,0,128,0,0,3984,0,0,0,0,0,0,0,4096,0,256,0,512,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTurtle","Exp","E","SUBJECT","PREDICATE","PREDICATE_LIST","OBJECT","OBJECT_LIST","LITERAL","VALUE","base","prefix","\"<\"","\">\"","end","stringLiteral","string","num","true","false","\";\"","\",\"","\":\"","http","%eof"]
        bit_start = st * 27
        bit_end = (st + 1) * 27
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..26]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (13) = happyShift action_4
action_0 (14) = happyShift action_5
action_0 (15) = happyShift action_6
action_0 (19) = happyShift action_7
action_0 (4) = happyGoto action_8
action_0 (5) = happyGoto action_9
action_0 (6) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (13) = happyShift action_4
action_1 (14) = happyShift action_5
action_1 (15) = happyShift action_6
action_1 (19) = happyShift action_7
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (15) = happyShift action_20
action_3 (19) = happyShift action_21
action_3 (7) = happyGoto action_18
action_3 (8) = happyGoto action_19
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (15) = happyShift action_17
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (19) = happyShift action_16
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (19) = happyShift action_13
action_6 (20) = happyShift action_14
action_6 (26) = happyShift action_15
action_6 (12) = happyGoto action_12
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (25) = happyShift action_11
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (27) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (13) = happyShift action_4
action_9 (14) = happyShift action_5
action_9 (15) = happyShift action_6
action_9 (19) = happyShift action_7
action_9 (4) = happyGoto action_10
action_9 (5) = happyGoto action_9
action_9 (6) = happyGoto action_3
action_9 _ = happyReduce_1

action_10 _ = happyReduce_2

action_11 (19) = happyShift action_13
action_11 (20) = happyShift action_14
action_11 (26) = happyShift action_15
action_11 (12) = happyGoto action_37
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (16) = happyShift action_36
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_23

action_14 _ = happyReduce_24

action_15 _ = happyReduce_25

action_16 (25) = happyShift action_35
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (26) = happyShift action_34
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (15) = happyShift action_28
action_18 (18) = happyShift action_29
action_18 (19) = happyShift action_30
action_18 (20) = happyShift action_31
action_18 (21) = happyShift action_32
action_18 (22) = happyShift action_33
action_18 (9) = happyGoto action_25
action_18 (10) = happyGoto action_26
action_18 (11) = happyGoto action_27
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (17) = happyShift action_24
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (19) = happyShift action_13
action_20 (20) = happyShift action_14
action_20 (26) = happyShift action_15
action_20 (12) = happyGoto action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (25) = happyShift action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (19) = happyShift action_13
action_22 (20) = happyShift action_14
action_22 (26) = happyShift action_15
action_22 (12) = happyGoto action_47
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (16) = happyShift action_46
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_6

action_25 (17) = happyShift action_43
action_25 (23) = happyShift action_44
action_25 (24) = happyShift action_45
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (17) = happyShift action_42
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_15

action_28 (19) = happyShift action_13
action_28 (20) = happyShift action_14
action_28 (26) = happyShift action_15
action_28 (12) = happyGoto action_41
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_22

action_30 (25) = happyShift action_40
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_21

action_32 _ = happyReduce_19

action_33 _ = happyReduce_20

action_34 (16) = happyShift action_39
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (15) = happyShift action_38
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_8

action_37 _ = happyReduce_9

action_38 (19) = happyShift action_13
action_38 (20) = happyShift action_14
action_38 (26) = happyShift action_15
action_38 (12) = happyGoto action_55
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (17) = happyShift action_54
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (19) = happyShift action_13
action_40 (20) = happyShift action_14
action_40 (26) = happyShift action_15
action_40 (12) = happyGoto action_53
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (16) = happyShift action_52
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_7

action_43 _ = happyReduce_5

action_44 (15) = happyShift action_20
action_44 (19) = happyShift action_21
action_44 (7) = happyGoto action_50
action_44 (8) = happyGoto action_51
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (15) = happyShift action_28
action_45 (18) = happyShift action_29
action_45 (19) = happyShift action_30
action_45 (20) = happyShift action_31
action_45 (21) = happyShift action_32
action_45 (22) = happyShift action_33
action_45 (9) = happyGoto action_48
action_45 (10) = happyGoto action_49
action_45 (11) = happyGoto action_27
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_10

action_47 _ = happyReduce_11

action_48 (24) = happyShift action_45
action_48 _ = happyReduce_17

action_49 _ = happyReduce_18

action_50 (15) = happyShift action_28
action_50 (18) = happyShift action_29
action_50 (19) = happyShift action_30
action_50 (20) = happyShift action_31
action_50 (21) = happyShift action_32
action_50 (22) = happyShift action_33
action_50 (9) = happyGoto action_57
action_50 (11) = happyGoto action_27
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_13

action_52 _ = happyReduce_14

action_53 _ = happyReduce_16

action_54 _ = happyReduce_3

action_55 (16) = happyShift action_56
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (17) = happyShift action_58
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (23) = happyShift action_44
action_57 _ = happyReduce_12

action_58 _ = happyReduce_4

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (E happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Es happy_var_1 happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 5 5 happyReduction_3
happyReduction_3 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenHTTP happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Base happy_var_3
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 7 5 happyReduction_4
happyReduction_4 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Prefix happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Triple happy_var_1 happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (TriplePredList happy_var_1 happy_var_2
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 5 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TripleObjectList happy_var_1 happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Subject happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn6
		 (Subject (PrefixUse happy_var_1 happy_var_3)
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Predicate happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn7
		 (Predicate (PrefixUse happy_var_1 happy_var_3)
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  8 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 (PredListEnd happy_var_1 happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 8 happyReduction_13
happyReduction_13 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (PredList happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  9 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Object happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (Literal happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  9 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn9
		 (Object (PrefixUse happy_var_1 happy_var_3)
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (ObjectListEnd happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (ObjectList happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn11
		 (Bool True
	)

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn11
		 (Bool False
	)

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyTerminal (TokenNumber happy_var_1))
	 =  HappyAbsSyn11
		 (Int happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyTerminal (TokenStringLiteral happy_var_1))
	 =  HappyAbsSyn11
		 (StringLiteral happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn12
		 (String happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 (HappyTerminal (TokenNumber happy_var_1))
	 =  HappyAbsSyn12
		 (Num happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 (HappyTerminal (TokenHTTP happy_var_1))
	 =  HappyAbsSyn12
		 (HTTP happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 27 27 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenBase -> cont 13;
	TokenPrefix -> cont 14;
	TokenOpenURI -> cont 15;
	TokenCloseURI -> cont 16;
	TokenEnd -> cont 17;
	TokenStringLiteral happy_dollar_dollar -> cont 18;
	TokenString happy_dollar_dollar -> cont 19;
	TokenNumber happy_dollar_dollar -> cont 20;
	TokenTrue -> cont 21;
	TokenFalse -> cont 22;
	TokenPredList -> cont 23;
	TokenObjectList -> cont 24;
	TokenColon -> cont 25;
	TokenHTTP happy_dollar_dollar -> cont 26;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 27 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseTurtle tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
