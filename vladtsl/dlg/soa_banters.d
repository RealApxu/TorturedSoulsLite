/////////////////////////////////////
// Kachiko Banters with Party - SoA
/////////////////////////////////////

//Aerie

CHAIN
IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiAerie1","GLOBAL",0)~ THEN TTKACHIB KachiAerie1
@0
DO ~SetGlobal("ttKachiAerie1","GLOBAL",1)~
== BAERIE @1
== TTKACHIB @2
== BAERIE @3
== TTKACHIB @4
== BAERIE @5
== TTKACHIB @6
== BAERIE @7
EXIT

// Anomen

CHAIN
IF ~InParty("Anomen")
See("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiAnomen1","GLOBAL",0)~ THEN TTKACHIB KachiAnomen1
@8
DO ~SetGlobal("ttKachiAnomen1","GLOBAL",1)~
== BANOMEN @9
== BYOSHIM @10
== BANOMEN @11
== BYOSHIM @12
== BANOMEN @13
== TTKACHIB @14
== BYOSHIM @15
== BANOMEN @16
== TTKACHIB @17
END
 IF ~Global("AnomenMatch","GLOBAL",1) !Global("AnomenRomanceActive","GLOBAL",0) !Global("AnomenRomanceActive","GLOBAL",3)~ THEN EXTERN BANOMEN TS591
 IF ~OR(3) !Global("AnomenMatch","GLOBAL",1) Global("AnomenRomanceActive","GLOBAL",0) Global("AnomenRomanceActive","GLOBAL",3)~ THEN EXIT

CHAIN BANOMEN TS591
@18
END
 ++ @19 EXTERN BANOMEN TS592

CHAIN BANOMEN TS592
@20
END
 ++ @21 EXTERN TTKACHIB 18

CHAIN TTKACHIB 18
@22
== BANOMEN @23
== BYOSHIM @24
EXIT

//No banters for Cernd :(

// Edwin

CHAIN
IF ~InParty("Edwin")
See("Edwin")
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiEdwin1","GLOBAL",0)~ THEN TTKACHIB KachiEdwin1
@25
DO ~SetGlobal("ttKachiEdwin1","GLOBAL",1)~
== BEDWIN @26
== TTKACHIB @27
== BEDWIN @28
== TTKACHIB @29
END
 IF ~InParty("Minsc") See("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN EXTERN BMINSC TS103
 IF ~OR(3) !InParty("Minsc") !See("Minsc") StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN REPLY @30 EXIT
 IF ~OR(3) !InParty("Minsc") !See("Minsc") StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN REPLY @31 EXTERN BEDWIN TS108
 IF ~OR(3) !InParty("Minsc") !See("Minsc") StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN REPLY @32 EXTERN BEDWIN TS109

CHAIN BMINSC TS103
@33
END
 ++ @30 EXIT
 ++ @31 EXTERN BEDWIN TS108
 ++ @32 EXTERN BEDWIN TS109

CHAIN BEDWIN TS108
@34
DO ~LeaveParty() EscapeArea()~
EXIT

CHAIN BEDWIN TS109
@35
DO ~LeaveParty() Enemy()~
EXIT

// Haer'Dalis

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
InParty("Yoshimo")
See("Yoshimo")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiHaerDalis1","GLOBAL",0)~ THEN TTKACHIB KachiEdwin1
@36
DO ~SetGlobal("ttKachiHaerDalis1","GLOBAL",1)~
== BHAERDA @37
== TTKACHIB @38
== BHAERDA @39
== BYOSHIM @40
== BHAERDA @41
== TTKACHIB @42
== BHAERDA @43
EXIT

// Imoen

CHAIN
IF ~InParty("Imoen")
See("Imoen")
!StateCheck("Imoen",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiImoen1","GLOBAL",0)~ THEN TTKACHIB KachiImoen1
@44
DO ~SetGlobal("ttKachiImoen1","GLOBAL",1)~
== BIMOEN2 @45
== TTKACHIB @46
== BIMOEN2 @47
== TTKACHIB @48
EXIT

// Jaheira

CHAIN
IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiJaheira1","GLOBAL",0)~ THEN TTKACHIB KachiImoen1
@49
DO ~SetGlobal("ttKachiJaheira1","GLOBAL",1)~
== BJAHEIR @50
== TTKACHIB @51
== BJAHEIR @52
== TTKACHIB @53
== BJAHEIR @54
== TTKACHIB @55
== BJAHEIR @56
== TTKACHIB @55
== BYOSHIM @57
== TTKACHIB @58
== BJAHEIR @59
EXIT

// Jan

CHAIN
IF ~InParty("Jan")
See("Jan")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
!Global("ttEndIsland","GLOBAL",0)
Global("ttKachiJan1","GLOBAL",0)~ THEN TTKACHIB KachiJan1
@60
DO ~SetGlobal("ttKachiJan1","GLOBAL",1)~
== BJAN @61
== TTKACHIB @62
== BJAN @63
== TTKACHIB @64
== BJAN @65
== TTKACHIB @66
== BJAN @67
== TTKACHIB @68
EXIT

// Keldorn

CHAIN
IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiKeldorn1","GLOBAL",0)~ THEN TTKACHIB KachiKeldorn1
@69
DO ~SetGlobal("ttKachiKeldorn1","GLOBAL",1)~
== BKELDOR @70
== TTKACHIB @71
== BKELDOR @72
== TTKACHIB @73
== BKELDOR @74
== TTKACHIB @75
== BKELDOR @76
== TTKACHIB @77
== BKELDOR @78
== TTKACHIB @79
EXIT

// Mazzy

CHAIN
IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiMazzy1","GLOBAL",0)~ THEN TTKACHIB KachiMazzy1
@80
DO ~SetGlobal("ttKachiMazzy1","GLOBAL",1)~
== BMAZZY @81
== TTKACHIB @82
== BMAZZY @83
== TTKACHIB @84
== BMAZZY @85
== BVALYGA IF ~InParty("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @86
== TTKACHIB @87
== BMAZZY @88
END
 IF ~OR(2) !InParty("Valygar") StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN EXIT
 IF ~InParty("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN EXTERN BMAZZY KachiMazzy1.1

CHAIN BMAZZY KachiMazzy1.1
@89
== BVALYGA @90
== TTKACHIB @91
== BVALYGA @92
== TTKACHIB @93
EXIT

// Minsc

CHAIN
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiMinsc1","GLOBAL",0)~ THEN TTKACHIB KachiMinsc1
@94
DO ~SetGlobal("ttKachiMinsc1","GLOBAL",1)~
== BMINSC @95
== TTKACHIB @96
== BMINSC @97
== TTKACHIB @98
== BMINSC @99
== TTKACHIB @100
== BMINSC @101
== TTKACHIB @102
EXIT

// Nalia

CHAIN
IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiNalia1","GLOBAL",0)~ THEN TTKACHIB KachiNalia1
@103
DO ~SetGlobal("ttKachiNalia1","GLOBAL",1)~
== BNALIA @104
== BYOSHIM @105
== BNALIA @106
== TTKACHIB @107
== BNALIA @108
EXIT

// Valygar

CHAIN
IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiValygar1","GLOBAL",0)~ THEN TTKACHIB KachiValygar1
@109
DO ~SetGlobal("ttKachiValygar1","GLOBAL",1)~
== BVALYGA @110
== TTKACHIB @111
== BVALYGA @112
== TTKACHIB @113
== BVALYGA @114
== TTKACHIB @115
== BVALYGA @116
EXIT

CHAIN
IF ~InParty("ttkachi")
See("ttkachi")
!StateCheck("ttkachi",CD_STATE_NOTVALID)
!StateCheck("Valygar",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiValygar3","GLOBAL",0)~ THEN BVALYGA KachiValygar2
@117
DO ~SetGlobal("ttKachiValygar2","GLOBAL",1)~
== TTKACHIB @118
== BVALYGA @119
== TTKACHIB @120
== BVALYGA @121
== TTKACHIB @122
== BVALYGA @123
== TTKACHIB @124
== BVALYGA @125
== TTKACHIB @126
== BVALYGA @127
EXIT

CHAIN
IF ~InParty("ttkachi")
See("ttkachi")
!StateCheck("ttkachi",CD_STATE_NOTVALID)
InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("Valygar",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiValygar3","GLOBAL",0)~ THEN BVALYGA KachiValygar3
@128
DO ~SetGlobal("ttKachiValygar3","GLOBAL",1)~
== TTKACHIB @129
== BVALYGA @130
== TTKACHIB @131
== BVALYGA @132
== TTKACHIB @133
== BVALYGA @134
== BYOSHIM @135
== BVALYGA @136
== BYOSHIM @137
== TTKACHIB @138
== BYOSHIM @139
== TTKACHIB @140
== BYOSHIM @141
== TTKACHIB @142
EXIT

// Viconia

CHAIN
IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiViconia1","GLOBAL",0)~ THEN TTKACHIB KachiViconia1
@143
DO ~SetGlobal("ttKachiViconia1","GLOBAL",1)~
== BVICONI @144
== TTKACHIB @145
== BVICONI @146
== TTKACHIB @147
== BVICONI @148
== TTKACHIB @149
== BVICONI @150
== TTKACHIB @151
EXIT

////////////////////////////////////
// Kachiko Lovetalks with Yoshimo
////////////////////////////////////

CHAIN
IF ~Global("ttKachikoRomance","GLOBAL",2)~ THEN TTKACHIB YoshiKachiLoveTalk1
@152
DO ~IncrementGlobal("ttKachikoRomance","GLOBAL",1) SetGlobalTimer("ttKachikoRomanceTimer","GLOBAL",ONE_DAY)~
== BYOSHIM @153
== TTKACHIB @154
== BYOSHIM @155
== TTKACHIB @156
== BYOSHIM @157
DO ~RestParty()~
EXIT

CHAIN
IF ~Global("ttKachikoRomance","GLOBAL",4)~ THEN TTKACHIB YoshiKachiLoveTalk2
@158
DO ~IncrementGlobal("ttKachikoRomance","GLOBAL",1) SetGlobalTimer("ttKachikoRomanceTimer","GLOBAL",ONE_DAY)~
== BYOSHIM @159
== TTKACHIB @160
== BYOSHIM @161
DO ~RestParty()~
EXIT

CHAIN
IF ~Global("ttKachikoRomance","GLOBAL",6)~ THEN TTKACHIB YoshiKachiLoveTalk3
@162
DO ~IncrementGlobal("ttKachikoRomance","GLOBAL",1) SetGlobalTimer("ttKachikoRomanceTimer","GLOBAL",ONE_DAY)~
== BYOSHIM @163
== TTKACHIB @164
== BYOSHIM @165
== TTKACHIB @166
== BYOSHIM @167
== TTKACHIB @168
== BYOSHIM @169
EXIT

CHAIN
IF ~Global("ttKachikoRomance","GLOBAL",8)~ THEN TTKACHIB YoshiKachiLoveTalk4
@170
DO ~IncrementGlobal("ttKachikoRomance","GLOBAL",1) SetGlobalTimer("ttKachikoRomanceTimer","GLOBAL",ONE_DAY)~
== BYOSHIM @171
== TTKACHIB @172
== BYOSHIM @173
== TTKACHIB @174
== BYOSHIM @175
== TTKACHIB @176
== BYOSHIM @177
EXIT

CHAIN
IF ~Global("ttKachikoRomance","GLOBAL",10)~ THEN TTKACHIB YoshiKachiLoveTalk5
@178
DO ~IncrementGlobal("ttKachikoRomance","GLOBAL",1) SetGlobalTimer("ttKachikoRomanceTimer","GLOBAL",ONE_DAY)~
== BYOSHIM @179
== TTKACHIB @180
== BYOSHIM @181
== TTKACHIB @182
== BYOSHIM @183
DO ~RestParty()~
EXIT

CHAIN
IF ~Global("ttYoshimoExcuse","GLOBAL",6)~ THEN TTKACHIB YoshiKachiLoveTalk6
@184
DO ~SetGlobal("ttYoshimoExcuse","GLOBAL",7)~
== BYOSHIM @185
== TTKACHIB @186
== BYOSHIM @187
== TTKACHIB @188
== BYOSHIM @189
== TTKACHIB @190
== BYOSHIM @191
EXIT