{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17
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
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,141) ([0,74,64,384,10240,1,1,6,0,0,0,32768,18,16,96,18944,16384,32768,1,0,4,0,40960,4,4,24,0,0,0,0,74,64,384,0,0,0,0,1184,1024,6144,0,0,0,0,18944,16384,32768,1,0,512,0,0,4,0,0,256,0,0,0,74,64,384,0,0,0,0,14336,7,0,0,0,0,0,32768,3,128,0,0,0,0,0,0,0,0,0,128,0,0,0,256,0,0,0,4,0,0,4096,0,0,0,3840,0,0,520,0,0,0,0,0,0,2048,0,0,0,1,64,0,1024,0,1,0,61456,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,58368,7,0,0,16,0,0,16384,0,0,0,256,0,0,0,4,0,12,36864,31,0,0,0,0,128,0,0,0,2,0,0,0,0,0,0,0,0,0,0,448,0,0,14336,7,0,0,7392,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,0,63744,1,512,0,0,0,8,0,0,32768,3,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,112,0,0,8192,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseOur","Exp","E","EDIT_CON_LIST","EDIT_CON","LINK","OBJECT_VAR","OBJECT_SELECT_ALL","Math_Functions","CONDITIONAL","CONDITION","LIST","LIST_OPERATION","OPERATION","OBJECT_OPERATION","join","where","select","string","http","file","subject","predicate","object","\"==\"","or","subjects","predicates","objects","contains","\",\"","and","\"<\"","\">\"","\"<=\"","\">=\"","edit","\":\"","\"=\"","add","\"+\"","\"-\"","\"*\"","\"^\"","int","map","\"!=\"","true","false","INT","BOOL","STRING","URI","list","intersect","%eof"]
        bit_start = st * 58
        bit_end = (st + 1) * 58
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..57]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (18) = happyShift action_3
action_0 (20) = happyShift action_4
action_0 (23) = happyShift action_5
action_0 (39) = happyShift action_6
action_0 (56) = happyShift action_7
action_0 (57) = happyShift action_8
action_0 (4) = happyGoto action_9
action_0 (5) = happyGoto action_10
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (18) = happyShift action_3
action_1 (20) = happyShift action_4
action_1 (23) = happyShift action_5
action_1 (39) = happyShift action_6
action_1 (56) = happyShift action_7
action_1 (57) = happyShift action_8
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (18) = happyShift action_3
action_3 (20) = happyShift action_4
action_3 (23) = happyShift action_5
action_3 (39) = happyShift action_6
action_3 (56) = happyShift action_7
action_3 (57) = happyShift action_8
action_3 (5) = happyGoto action_16
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (18) = happyShift action_3
action_4 (20) = happyShift action_4
action_4 (23) = happyShift action_5
action_4 (39) = happyShift action_6
action_4 (56) = happyShift action_7
action_4 (57) = happyShift action_8
action_4 (4) = happyGoto action_15
action_4 (5) = happyGoto action_10
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (33) = happyShift action_14
action_5 _ = happyReduce_5

action_6 (18) = happyShift action_3
action_6 (20) = happyShift action_4
action_6 (23) = happyShift action_5
action_6 (39) = happyShift action_6
action_6 (56) = happyShift action_7
action_6 (57) = happyShift action_8
action_6 (5) = happyGoto action_13
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_8

action_8 (18) = happyShift action_3
action_8 (20) = happyShift action_4
action_8 (23) = happyShift action_5
action_8 (39) = happyShift action_6
action_8 (56) = happyShift action_7
action_8 (57) = happyShift action_8
action_8 (5) = happyGoto action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (58) = happyAccept
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (18) = happyShift action_3
action_10 (20) = happyShift action_4
action_10 (23) = happyShift action_5
action_10 (39) = happyShift action_6
action_10 (56) = happyShift action_7
action_10 (57) = happyShift action_8
action_10 (4) = happyGoto action_11
action_10 (5) = happyGoto action_10
action_10 _ = happyReduce_1

action_11 _ = happyReduce_2

action_12 (18) = happyShift action_3
action_12 (20) = happyShift action_4
action_12 (23) = happyShift action_5
action_12 (39) = happyShift action_6
action_12 (56) = happyShift action_7
action_12 (57) = happyShift action_8
action_12 (5) = happyGoto action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (40) = happyShift action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (23) = happyShift action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (19) = happyShift action_18
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (18) = happyShift action_3
action_16 (20) = happyShift action_4
action_16 (23) = happyShift action_5
action_16 (39) = happyShift action_6
action_16 (56) = happyShift action_7
action_16 (57) = happyShift action_8
action_16 (5) = happyGoto action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_4

action_18 (24) = happyShift action_31
action_18 (25) = happyShift action_32
action_18 (26) = happyShift action_33
action_18 (29) = happyShift action_34
action_18 (30) = happyShift action_35
action_18 (31) = happyShift action_36
action_18 (12) = happyGoto action_28
action_18 (13) = happyGoto action_29
action_18 (14) = happyGoto action_30
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_6

action_20 (24) = happyShift action_24
action_20 (25) = happyShift action_25
action_20 (26) = happyShift action_26
action_20 (48) = happyShift action_27
action_20 (6) = happyGoto action_22
action_20 (7) = happyGoto action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_9

action_22 _ = happyReduce_7

action_23 (34) = happyShift action_60
action_23 _ = happyReduce_10

action_24 (41) = happyShift action_59
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (41) = happyShift action_58
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (41) = happyShift action_57
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (43) = happyShift action_53
action_27 (44) = happyShift action_54
action_27 (45) = happyShift action_55
action_27 (46) = happyShift action_56
action_27 (11) = happyGoto action_52
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (28) = happyShift action_50
action_28 (34) = happyShift action_51
action_28 _ = happyReduce_3

action_29 _ = happyReduce_31

action_30 (32) = happyShift action_49
action_30 (15) = happyGoto action_48
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (27) = happyShift action_45
action_31 (49) = happyShift action_46
action_31 (16) = happyGoto action_47
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (27) = happyShift action_45
action_32 (49) = happyShift action_46
action_32 (16) = happyGoto action_44
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (27) = happyShift action_38
action_33 (35) = happyShift action_39
action_33 (36) = happyShift action_40
action_33 (37) = happyShift action_41
action_33 (38) = happyShift action_42
action_33 (49) = happyShift action_43
action_33 (17) = happyGoto action_37
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_38

action_35 _ = happyReduce_39

action_36 _ = happyReduce_40

action_37 _ = happyReduce_36

action_38 (21) = happyShift action_68
action_38 (22) = happyShift action_63
action_38 (47) = happyShift action_69
action_38 (50) = happyShift action_70
action_38 (51) = happyShift action_71
action_38 (52) = happyShift action_72
action_38 (53) = happyShift action_73
action_38 (54) = happyShift action_74
action_38 (55) = happyShift action_75
action_38 (8) = happyGoto action_65
action_38 (9) = happyGoto action_87
action_38 (10) = happyGoto action_67
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (47) = happyShift action_86
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (47) = happyShift action_85
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (47) = happyShift action_84
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (47) = happyShift action_83
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (21) = happyShift action_68
action_43 (22) = happyShift action_63
action_43 (47) = happyShift action_69
action_43 (50) = happyShift action_70
action_43 (51) = happyShift action_71
action_43 (52) = happyShift action_72
action_43 (53) = happyShift action_73
action_43 (54) = happyShift action_74
action_43 (55) = happyShift action_75
action_43 (8) = happyGoto action_65
action_43 (9) = happyGoto action_82
action_43 (10) = happyGoto action_67
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_35

action_45 (22) = happyShift action_63
action_45 (8) = happyGoto action_81
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (22) = happyShift action_63
action_46 (8) = happyGoto action_80
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_34

action_48 _ = happyReduce_37

action_49 (29) = happyShift action_34
action_49 (30) = happyShift action_35
action_49 (31) = happyShift action_36
action_49 (14) = happyGoto action_79
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (24) = happyShift action_31
action_50 (25) = happyShift action_32
action_50 (26) = happyShift action_33
action_50 (29) = happyShift action_34
action_50 (30) = happyShift action_35
action_50 (31) = happyShift action_36
action_50 (12) = happyGoto action_78
action_50 (13) = happyGoto action_29
action_50 (14) = happyGoto action_30
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (24) = happyShift action_31
action_51 (25) = happyShift action_32
action_51 (26) = happyShift action_33
action_51 (29) = happyShift action_34
action_51 (30) = happyShift action_35
action_51 (31) = happyShift action_36
action_51 (12) = happyGoto action_77
action_51 (13) = happyGoto action_29
action_51 (14) = happyGoto action_30
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (47) = happyShift action_76
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_27

action_54 _ = happyReduce_28

action_55 _ = happyReduce_29

action_56 _ = happyReduce_30

action_57 (21) = happyShift action_68
action_57 (22) = happyShift action_63
action_57 (47) = happyShift action_69
action_57 (50) = happyShift action_70
action_57 (51) = happyShift action_71
action_57 (52) = happyShift action_72
action_57 (53) = happyShift action_73
action_57 (54) = happyShift action_74
action_57 (55) = happyShift action_75
action_57 (8) = happyGoto action_65
action_57 (9) = happyGoto action_66
action_57 (10) = happyGoto action_67
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (22) = happyShift action_63
action_58 (8) = happyGoto action_64
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (22) = happyShift action_63
action_59 (8) = happyGoto action_62
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (24) = happyShift action_24
action_60 (25) = happyShift action_25
action_60 (26) = happyShift action_26
action_60 (48) = happyShift action_27
action_60 (6) = happyGoto action_61
action_60 (7) = happyGoto action_23
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_11

action_62 _ = happyReduce_12

action_63 _ = happyReduce_16

action_64 _ = happyReduce_13

action_65 _ = happyReduce_21

action_66 _ = happyReduce_14

action_67 _ = happyReduce_22

action_68 _ = happyReduce_17

action_69 _ = happyReduce_18

action_70 _ = happyReduce_19

action_71 _ = happyReduce_20

action_72 _ = happyReduce_23

action_73 _ = happyReduce_24

action_74 _ = happyReduce_25

action_75 _ = happyReduce_26

action_76 (29) = happyShift action_34
action_76 (30) = happyShift action_35
action_76 (31) = happyShift action_36
action_76 (14) = happyGoto action_88
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (28) = happyShift action_50
action_77 _ = happyReduce_33

action_78 (28) = happyShift action_50
action_78 _ = happyReduce_32

action_79 _ = happyReduce_41

action_80 _ = happyReduce_43

action_81 _ = happyReduce_42

action_82 _ = happyReduce_45

action_83 _ = happyReduce_49

action_84 _ = happyReduce_48

action_85 _ = happyReduce_46

action_86 _ = happyReduce_47

action_87 _ = happyReduce_44

action_88 _ = happyReduce_15

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

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (SELECT happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (JOIN happy_var_2 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 (HappyTerminal (TokenFile _ happy_var_1))
	 =  HappyAbsSyn5
		 (FILE happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyTerminal (TokenFile _ happy_var_3))
	_
	(HappyTerminal (TokenFile _ happy_var_1))
	 =  HappyAbsSyn5
		 (FILES happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 5 happyReduction_7
happyReduction_7 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (EDIT happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  5 happyReduction_8
happyReduction_8 (HappyTerminal (TokenList _ happy_var_1))
	 =  HappyAbsSyn5
		 (ADD happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (INTERSECT happy_var_2 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (SINGLE_EDIT happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (MULTI_EDIT happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_3)
	_
	_
	 =  HappyAbsSyn7
		 (EditSubject happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_3)
	_
	_
	 =  HappyAbsSyn7
		 (EditPredicate happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_3)
	_
	_
	 =  HappyAbsSyn7
		 (EditObject happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 4 7 happyReduction_15
happyReduction_15 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	(HappyTerminal (TokenInt _ happy_var_3)) `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (MAP happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 (HappyTerminal (TokenHTTP _ happy_var_1))
	 =  HappyAbsSyn8
		 (Link happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn9
		 (OBJECT_STRING happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn9
		 (OBJECT_INT happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  9 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn9
		 (OBJECT_TRUE
	)

happyReduce_20 = happySpecReduce_1  9 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn9
		 (OBJECT_FALSE
	)

happyReduce_21 = happySpecReduce_1  9 happyReduction_21
happyReduction_21 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (OBJECT_HTTP happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  9 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (OBJECT_ALL happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  10 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn10
		 (OBJECT_ALL_INT
	)

happyReduce_24 = happySpecReduce_1  10 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn10
		 (OBJECT_ALL_BOOL
	)

happyReduce_25 = happySpecReduce_1  10 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn10
		 (OBJECT_ALL_STRING
	)

happyReduce_26 = happySpecReduce_1  10 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn10
		 (OBJECT_ALL_URI
	)

happyReduce_27 = happySpecReduce_1  11 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn11
		 (Plus
	)

happyReduce_28 = happySpecReduce_1  11 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn11
		 (Minus
	)

happyReduce_29 = happySpecReduce_1  11 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn11
		 (Multiply
	)

happyReduce_30 = happySpecReduce_1  11 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn11
		 (Power
	)

happyReduce_31 = happySpecReduce_1  12 happyReduction_31
happyReduction_31 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (Condition happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  12 happyReduction_32
happyReduction_32 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (OR happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  12 happyReduction_33
happyReduction_33 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (AND happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  13 happyReduction_34
happyReduction_34 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (SUBJECT happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  13 happyReduction_35
happyReduction_35 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (PREDICATE happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  13 happyReduction_36
happyReduction_36 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (OBJECT happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_2  13 happyReduction_37
happyReduction_37 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (LISTCON happy_var_1 happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  14 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn14
		 (SUBJECTS
	)

happyReduce_39 = happySpecReduce_1  14 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn14
		 (PREDICATES
	)

happyReduce_40 = happySpecReduce_1  14 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn14
		 (OBJECTS
	)

happyReduce_41 = happySpecReduce_2  15 happyReduction_41
happyReduction_41 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (CONTAINS happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_2  16 happyReduction_42
happyReduction_42 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (EQUALS happy_var_2
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_2  16 happyReduction_43
happyReduction_43 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (NOTEQUAL happy_var_2
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_2  17 happyReduction_44
happyReduction_44 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (O_EQUALS happy_var_2
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_2  17 happyReduction_45
happyReduction_45 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (O_NOTEQUAL happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_2  17 happyReduction_46
happyReduction_46 (HappyTerminal (TokenInt _ happy_var_2))
	_
	 =  HappyAbsSyn17
		 (GreaterThan happy_var_2
	)
happyReduction_46 _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_2  17 happyReduction_47
happyReduction_47 (HappyTerminal (TokenInt _ happy_var_2))
	_
	 =  HappyAbsSyn17
		 (LessThan happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  17 happyReduction_48
happyReduction_48 (HappyTerminal (TokenInt _ happy_var_2))
	_
	 =  HappyAbsSyn17
		 (LessThanOrEqual happy_var_2
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_2  17 happyReduction_49
happyReduction_49 (HappyTerminal (TokenInt _ happy_var_2))
	_
	 =  HappyAbsSyn17
		 (GreaterThanOrEqual happy_var_2
	)
happyReduction_49 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 58 58 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenJoin _ -> cont 18;
	TokenWhere _ -> cont 19;
	TokenSelect _ -> cont 20;
	TokenString _ happy_dollar_dollar -> cont 21;
	TokenHTTP _ happy_dollar_dollar -> cont 22;
	TokenFile _ happy_dollar_dollar -> cont 23;
	TokenSubject _ -> cont 24;
	TokenPredicate _ -> cont 25;
	TokenObject _ -> cont 26;
	TokenEquals _ -> cont 27;
	TokenOr _ -> cont 28;
	TokenSubjects _ -> cont 29;
	TokenPredicates _ -> cont 30;
	TokenObjects _ -> cont 31;
	TokenContains _ -> cont 32;
	TokenComma _ -> cont 33;
	TokenAnd _ -> cont 34;
	TokenLessThan _ -> cont 35;
	TokenGreaterThan _ -> cont 36;
	TokenLessThanOrEqual _ -> cont 37;
	TokenGreaterThanOrEqual _ -> cont 38;
	TokenEdit _ -> cont 39;
	TokenColon _ -> cont 40;
	TokenSet _ -> cont 41;
	TokenAdd _ -> cont 42;
	TokenPlus _ -> cont 43;
	TokenMinus _ -> cont 44;
	TokenMultiply _ -> cont 45;
	TokenPower _ -> cont 46;
	TokenInt _ happy_dollar_dollar -> cont 47;
	TokenMap _ -> cont 48;
	TokenNotEqual _ -> cont 49;
	TokenTrue _ -> cont 50;
	TokenFalse _ -> cont 51;
	TokenSelectInt _ -> cont 52;
	TokenSelectBool _ -> cont 53;
	TokenSelectString _ -> cont 54;
	TokenSelectURI _ -> cont 55;
	TokenList _ happy_dollar_dollar -> cont 56;
	TokenIntersect _ -> cont 57;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 58 tk tks = happyError' (tks, explist)
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
parseOur tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
