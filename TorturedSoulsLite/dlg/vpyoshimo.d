// Yoshimo Appends

// YOSHIMO.DLG

REPLACE_STATE_TRIGGER YOSHIMO 14

~Global("MetYoshimo","GLOBAL",1)
!InParty("vpkachi")
!See("vpkachi")~

REPLACE_STATE_TRIGGER YOSHIMO 21

~Global("DishonorYoshimo","GLOBAL",1)
!InParty("vpkachi")
!See("vpkachi")~

CHAIN IF WEIGHT #-1 ~AreaCheck("AR0313")
Global("VP_OnIsland","GLOBAL",0)
GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ THEN YOSHIMO TS8
@0
END
  IF ~~ THEN REPLY @1 EXTERN YOSHIMO TS9
  IF ~~ THEN REPLY @2 EXTERN YOSHIMO TS10

CHAIN YOSHIMO TS9
@3
END
  IF ~~ THEN REPLY @4 EXTERN YOSHIMO TS10
  IF ~~ THEN REPLY @5 EXTERN YOSHIMO 2

CHAIN YOSHIMO TS10
@6
END
  IF ~OR(2) Global("VP_Kachiko_Joined","GLOBAL",0) Global("VP_YoshFollowsKach","GLOBAL",1)~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN VPKACHI 23
  IF ~Global("VP_Kachiko_Joined","GLOBAL",1)~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN VPKACHIP 0


//YOSHJ.DLG

// Kachiko Dies

CHAIN IF WEIGHT #0 ~Global("VP_Kachiko_Dies","GLOBAL",3)
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN YOSHJ TS223
@100 DO ~SetGlobal("VP_Kachiko_Dies","GLOBAL",4)
StartCutSceneMode()
StartCutScene("TSCutK03")~ EXIT

// Dead Bodies

CHAIN IF WEIGHT #6 ~Global("Dead_Bodies","GLOBAL",1)~ THEN YOSHJ TS169
~Dead bodies? Here? Must be another group stranded on this piece of land. We must step carefully.~ DO ~SetGlobal("Dead_Bodies","GLOBAL",2)~
== VPKACHIJ ~Yoshimo, does not this... man looks a bit familiar to you? It is strange but he reminds me Otako Hashimoto.~ [KACHIQ03]
== YOSHJ ~Kachiko, I can see the resemblance, but that cannot be. Otako was wearing a pendant in a shape of a crescent moon... just like this one... Oh, no! I must be dreaming! Otako...~
END
 IF ~~ THEN REPLY ~What? What are you both talking about? The dead man is one of your family, Yoshimo? Are you sure we are not in Kara Tur?~ EXTERN YOSHJ TS171

CHAIN YOSHJ TS171
~I am afraid he is... he was my nephew, yes. But I have no idea how he came to this place and got killed; neither do I know where this place is...~
== VPKACHIJ ~My guess is that the spell might have worked and we are somehow moving towards solving our family feud. But why are we on an island, and not at home?~
END
  IF ~~ THEN REPLY ~The spell... Harpel must have done something that works for once. Let's go on, and we will have better chance to find some answers. Yoshimo, I am mourn your loss.~ EXTERN ~YOSHJ~ TS172

CHAIN YOSHJ TS172
~Thank you, <CHARNAME>.~
EXIT

// Kachiko Kidnapped

CHAIN IF WEIGHT #7 ~Global("Kachiko_Kidnapped","GLOBAL",1)~ THEN YOSHJ TS177
~No! Kachiko... No! I will kill them all! If they harm her in any way, I swear I will kill them all!~ DO ~SetGlobal("Kachiko_Kidnapped","GLOBAL",2) RealSetGlobalTimer("NKensais_Spawn","GLOBAL",10)~
EXIT

// Kachiko Found

CHAIN IF WEIGHT #8 ~Global("Kachiko_Saved","GLOBAL",1)~ THEN YOSHJ TS208
@110
EXIT

// Tree of Life

INTERJECT PLAYER1 33 VPYoshiToL0
== PLAYER1 IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN
@116
END
	IF ~~ THEN REPLY @117 EXTERN ~YOSHJ~ TS221
	IF ~~ THEN REPLY @118 EXTERN ~YOSHJ~ TS222
	IF ~~ THEN REPLY @119 EXTERN ~YOSHJ~ TS221

APPEND YOSHJ

IF ~~ THEN BEGIN TS221
  SAY @120
COPY_TRANS PLAYER1 33
END  

IF ~~ THEN BEGIN TS222
  SAY @121
COPY_TRANS PLAYER1 33
END
END

//Solar

EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("Yoshimo")~ THEN EXTERN YOSHJ VPYoshimoChoice
END

CHAIN YOSHJ VPYoshimoChoice
@122
END
COPY_TRANS FINSOL01 27

//YOSHP.DLG

REPLACE_STATE_TRIGGER YOSHP 0 ~Global("Kicked_Out","LOCALS",1)
Global("VP_OnIsland","GLOBAL",0)
!InParty("vpkachi")
!See("vpkachi")~

REPLACE_STATE_TRIGGER YOSHP 3 ~HappinessLT(Myself,-290)
!InParty("vpkachi")
Global("VP_OnIsland","GLOBAL",0)~

REPLACE_STATE_TRIGGER YOSHP 4 ~Global("Kicked_Out","LOCALS",0)
Global("VP_OnIsland","GLOBAL",0)
!InParty("vpkachi")~

REPLACE_ACTION_TEXT yoshp
~SetGlobal("KickedOut","LOCALS",1)[^!]*EscapeAreaMove("AR0406",1368,1922,0)~
~SetGlobal("Kicked_Out","LOCALS",1)
SetGlobal("VP_Yosh_WasInParty","GLOBAL",1)
EscapeAreaMove("AR0406",1368,1922,0)~

REPLACE_ACTION_TEXT yoshp
~SetGlobal("KickedOut","LOCALS",1)[^!]*JoinParty()~
~SetGlobal("Kicked_Out","LOCALS",1)
JoinParty()~

REPLACE_ACTION_TEXT yoshp
~SetGlobal("KickedOut","LOCALS",1)~
~SetGlobal("Kicked_Out","LOCALS",1)~

// Parting ways

CHAIN IF WEIGHT #7 ~Global("Kicked_Out","LOCALS",0)
Global("VP_OnIsland","GLOBAL",0)
InParty("vpkachi")~ THEN YOSHP TS7
@200
END
  IF ~~ THEN REPLY @201 EXTERN YOSHP TS12
  IF ~~ THEN REPLY @202 DO ~JoinParty()~ EXIT

CHAIN YOSHP TS12
@203
END
  IF ~!AreaCheck("AR0601")
!AreaCheck("AR0602")
!AreaCheck("AR0603")
!AreaCheck("AR0410")
!AreaCheck("AR0411")
!AreaCheck("AR0412")
!AreaCheck("AR0413")
!AreaCheck("AR0414")
!AreaCheck("AR1512")
!AreaCheck("AR1513")
!AreaCheck("AR1514")
!AreaCheck("AR1515")
!AreaCheck("AR1516")
!AreaCheck("AR1501")
!AreaCheck("AR1502")
!AreaCheck("AR1503")
!AreaCheck("AR1504")
!AreaCheck("AR1505")
!AreaCheck("AR1506")
!AreaCheck("AR1507")
!AreaCheck("AR1508")
!AreaCheck("AR1509")
!AreaCheck("AR1510")
!AreaCheck("AR1511")
!AreaCheck("AR2100")
!AreaCheck("AR2101")
!AreaCheck("AR2102")
!AreaCheck("AR2200")
!AreaCheck("AR2202")
!AreaCheck("AR2203")
!AreaCheck("AR2204")
!AreaCheck("AR2205")
!AreaCheck("AR2206")
!AreaCheck("AR2207")
!AreaCheck("AR2208")
!AreaCheck("AR2209")
!AreaCheck("AR2210")
!AreaCheck("AR2300")
!AreaCheck("AR2400")
!AreaCheck("AR2401")
!AreaCheck("AR2402")
!AreaCheck("AR2900")
!AreaCheck("AR2901")
!AreaCheck("AR2902")
!AreaCheck("AR2903")
!AreaCheck("AR2904")
!AreaCheck("AR2905")
!AreaCheck("AR2906")
!InWatchersKeep()
Global("VP_InHalruaa","GLOBAL",0)
Global("VP_OnIsland","GLOBAL",0)
GlobalLT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN REPLY @204 EXTERN YOSHP partway1
  IF ~!AreaCheck("AR0301")
!AreaCheck("AR0302")
!AreaCheck("AR0303")
!AreaCheck("AR0304")
!AreaCheck("AR0305")
!AreaCheck("AR0306")
!AreaCheck("AR0307")
!AreaCheck("AR0509")
!AreaCheck("AR0510")
!AreaCheck("AR0511")
!AreaCheck("AR1102")
!AreaCheck("AR1107")
!AreaCheck("AR0801")
!AreaCheck("AR0803")
!AreaCheck("AR1300")
!AreaCheck("AR1301")
!AreaCheck("AR1302")
!AreaCheck("AR1303")
!AreaCheck("AR0601")
!AreaCheck("AR0602")
!AreaCheck("AR0603")
!AreaCheck("AR0604")
!AreaCheck("AR0605")
!AreaCheck("AR0606")
!AreaCheck("AR1512")
!AreaCheck("AR1513")
!AreaCheck("AR1514")
!AreaCheck("AR1515")
!AreaCheck("AR1516")
!AreaCheck("AR1501")
!AreaCheck("AR1502")
!AreaCheck("AR1503")
!AreaCheck("AR1504")
!AreaCheck("AR1505")
!AreaCheck("AR1506")
!AreaCheck("AR1507")
!AreaCheck("AR1508")
!AreaCheck("AR1509")
!AreaCheck("AR1510")
!AreaCheck("AR1511")
!InWatchersKeep()~ THEN REPLY @205 EXTERN YOSHP partway2
  IF ~Global("VP_InHalruaa","GLOBAL",0)
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY @206 EXTERN YOSHP partway1

// Before Spellhold Joining

CHAIN IF WEIGHT #6 ~Global("Kicked_Out","LOCALS",1)
!InParty("vpkachi")
See("vpkachi")
Global("VP_OnIsland","GLOBAL",0)
GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ THEN YOSHP TS8
~Heya, <CHARNAME>. How are you?~
END
  IF ~AreaCheck("AR0313")~ THEN REPLY ~I am well, thank you. Did you manage to find a ship?~ EXTERN YOSHP TS9
  IF ~~ THEN REPLY ~Actually things have been pretty rough. Yoshimo, do you have time to help me out?~ EXTERN YOSHP TS10

CHAIN YOSHP TS9
~No, not yet. Kachiko's ship has already left, and it may take few months till we find another one.~
END
  IF ~~ THEN REPLY ~Since you have nothing much to do, but wait, may be you can help me out?~ EXTERN YOSHP TS10
  IF ~~ THEN REPLY ~Oh, well, that's life. Have patience, my friend.~ EXTERN YOSHP 2

CHAIN YOSHP TS10
~Kachiko, what do you think?~
END
  IF ~Global("VP_Kachiko_Joined","GLOBAL",0) OR(2) AreaCheck("AR0313") AreaCheck("AR0406")~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN VPKACHI 23
  IF ~Global("VP_Kachiko_Joined","GLOBAL",0) !AreaCheck("AR0313") !AreaCheck("AR0406")~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN VPKACHI 24
  IF ~Global("VP_Kachiko_Joined","GLOBAL",1) OR(2) AreaCheck("AR0313") AreaCheck("AR0406")~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN VPKACHIP 0
  IF ~Global("VP_Kachiko_Joined","GLOBAL",1) !AreaCheck("AR0313") !AreaCheck("AR0406")~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN VPKACHIP 1

//Island Kickout

CHAIN IF WEIGHT #5 ~Global("Kicked_Out","LOCALS",0) Global("VP_OnIsland","GLOBAL",1)~ THEN YOSHP TS11
@214
END
  IF ~!InParty("vpkachi")~ THEN REPLY @215 EXTERN YOSHP TS21
  IF ~InParty("vpkachi")~ THEN REPLY @215 EXTERN YOSHP partway1
  IF ~~ THEN REPLY @216 EXTERN YOSHP TS22

CHAIN YOSHP partway1
@217 DO ~SetGlobal("Kicked_Out","LOCALS",1)~
== VPKACHIJ @218 DO ~SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("Yoshimo",ChangeAIScript("",DEFAULT))
ActionOverride("Yoshimo",SetLeavePartyDialogFile())
ActionOverride("Yoshimo",LeaveParty())
ActionOverride("Yoshimo",EscapeAreaMove("AR0406",1368,1922,0))
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0406",1381,1959,1)~
EXIT

CHAIN YOSHP partway2
@219 DO ~SetGlobal("Kicked_Out","LOCALS",1)~
== VPKACHIJ @220 DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()~
EXIT

CHAIN YOSHP TS21
@221 DO ~SetGlobal("Kicked_Out","LOCALS",1)
EscapeAreaMove("TT0307",243,876,10)~
EXIT

CHAIN YOSHP TS22
@217 DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~
EXIT

// Kachiko Kidnapped Join

CHAIN IF WEIGHT #4 ~Global("Kicked_Out","LOCALS",1)
Global("VP_OnIsland","GLOBAL",1)
!InParty("vpkachi")~ THEN YOSHP TS23
@222
END
  IF ~~ THEN REPLY @223 EXTERN YOSHP TS24
  IF ~~ THEN REPLY @224 EXTERN YOSHP 2
 
CHAIN YOSHP TS24
@225 DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
