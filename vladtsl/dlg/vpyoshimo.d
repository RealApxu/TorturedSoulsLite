// Yoshimo Appends

// YOSHIMO.DLG

REPLACE_STATE_TRIGGER YOSHIMO 14

~Global("MetYoshimo","GLOBAL",1)
!InParty("ttkachi")
!See("ttkachi")~

REPLACE_STATE_TRIGGER YOSHIMO 21

~Global("DishonorYoshimo","GLOBAL",1)
!InParty("ttkachi")
!See("ttkachi")~

CHAIN IF WEIGHT #-1 ~AreaCheck("AR0313")
Global("ttOnIsland","GLOBAL",0)
GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ THEN YOSHIMO TS8
~Heya, <CHARNAME>. How are you?~
END
  IF ~~ THEN REPLY ~I am well, thank you. Did you manage to find a ship?~ EXTERN YOSHIMO TS9
  IF ~~ THEN REPLY ~Actually things have been pretty rough. Yoshimo, do you have time to help me out?~ EXTERN YOSHIMO TS10

CHAIN YOSHIMO TS9
~No, not yet. Kachiko's ship has already left, and it may take few months till we find another one.~
END
  IF ~~ THEN REPLY ~Since you have nothing much to do, but wait, may be you can help me out?~ EXTERN YOSHIMO TS10
  IF ~~ THEN REPLY ~Oh, well, that's life. Have patience, my friend.~ EXTERN YOSHIMO 2

CHAIN YOSHIMO TS10
~Kachiko, what do you think?~
END
  IF ~OR(2) Global("ttKachiko_Joined","GLOBAL",0) Global("ttYoshFollowsKach","GLOBAL",1)~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN TTKACHI 23
  IF ~Global("ttKachiko_Joined","GLOBAL",1)~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN TTKACHIP 0


//YOSHJ.DLG

// Kachiko Dies

CHAIN IF WEIGHT #0 ~Global("ttKachikoDies","GLOBAL",3)
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN YOSHJ TS223
~<CHARNAME>, it's my fault. I couldn't save Kachiko... And she was my only reason to live in this damned world... No, I have no rights to continue this miserable existance... I am very sorry, <CHARNAME>... (*Suddenly, the blick of Yoshimo's katana, and...*) ~ DO ~SetGlobal("ttKachikoDies","GLOBAL",4)
StartCutSceneMode()
StartCutScene("ttcutk03")~ EXIT

// Dead Bodies

CHAIN IF WEIGHT #6 ~Global("ttDeadBodies","GLOBAL",1)~ THEN YOSHJ TS169
~Dead bodies? Here? Must be another group stranded on this piece of land. We must step carefully.~ DO ~SetGlobal("ttDeadBodies","GLOBAL",2)~
== TTKACHIJ ~Yoshimo, does not this... man looks a bit familiar to you? It is strange but he reminds me Otako Hashimoto.~ [KACHIQ03]
== YOSHJ ~Kachiko, I can see the resemblance, but that cannot be. Otako was wearing a pendant in a shape of a crescent moon... just like this one... Oh, no! I must be dreaming! Otako...~
END
 IF ~~ THEN REPLY ~What? What are you both talking about? The dead man is one of your family, Yoshimo? Are you sure we are not in Kara Tur?~ EXTERN YOSHJ TS171

CHAIN YOSHJ TS171
~I am afraid he is... he was my nephew, yes. But I have no idea how he came to this place and got killed; neither do I know where this place is...~
== TTKACHIJ ~My guess is that the spell might have worked and we are somehow moving towards solving our family feud. But why are we on an island, and not at home?~
END
  IF ~~ THEN REPLY ~The spell... Harpel must have done something that works for once. Let's go on, and we will have better chance to find some answers. Yoshimo, I am mourn your loss.~ EXTERN YOSHJ TS172

CHAIN YOSHJ TS172
~Thank you, <CHARNAME>.~
EXIT

// Kachiko Kidnapped

CHAIN IF WEIGHT #7 ~Global("ttKachikoKidnapped","GLOBAL",1)~ THEN YOSHJ TS177
~No! Kachiko... No! I will kill them all! If they harm her in any way, I swear I will kill them all!~ DO ~SetGlobal("ttKachikoKidnapped","GLOBAL",2) RealSetGlobalTimer("ttNKensaiSpawn","GLOBAL",10)~
EXIT

// Kachiko Found

CHAIN IF WEIGHT #8 ~Global("ttKachikoSaved","GLOBAL",1)~ THEN YOSHJ TS208
@110
EXIT

// Tree of Life

INTERJECT PLAYER1 33 VPYoshiToL0
== PLAYER1 IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN
~Yoshimo... the man whom you helped to rescue his family from a bitter vendetta and to find his true love. Yet he is also a man who was once hired by Irenicus to facilitate your demise.~
END
	IF ~~ THEN REPLY ~Yoshimo... Your life just started anew. If you do not want to face Irenicus again, you do not have to. ~ EXTERN YOSHJ TS221
	IF ~~ THEN REPLY ~Listen, Yoshimo. I trust you and everything, but I need to hear that you are on my side in the upcoming battle.~ EXTERN YOSHJ TS222
	IF ~~ THEN REPLY ~Irenicus is a mighty foe, Yoshimo. I do not know if all of us shall survive this battle. I would understand if you do not want to come with me.~ EXTERN YOSHJ TS221

APPEND YOSHJ

IF ~~ THEN BEGIN TS221
  SAY ~Irenicus is my sworn enemy. I am eager to fight him.~
COPY_TRANS PLAYER1 33
END  

IF ~~ THEN BEGIN TS222
  SAY ~I side with the one, whose wise council brought Kachiko back to life and granted my family eternal peace. Do not fear, <CHARNAME> my blade will not backstab you.~
COPY_TRANS PLAYER1 33
END
END

//Solar

EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("Yoshimo")~ THEN EXTERN YOSHJ VPYoshimoChoice
END

CHAIN YOSHJ VPYoshimoChoice
~Say the word you think is proper. But be you god or be you mortal, always remember that Yoshimo is your friend.~
END
COPY_TRANS FINSOL01 27

//YOSHP.DLG

REPLACE_STATE_TRIGGER YOSHP 0 ~Global("Kicked_Out","LOCALS",1)
Global("ttOnIsland","GLOBAL",0)
!InParty("ttkachi")
!See("ttkachi")~

REPLACE_STATE_TRIGGER YOSHP 3 ~HappinessLT(Myself,-290)
!InParty("ttkachi")
Global("ttOnIsland","GLOBAL",0)~

REPLACE_STATE_TRIGGER YOSHP 4 ~Global("Kicked_Out","LOCALS",0)
Global("ttOnIsland","GLOBAL",0)
!InParty("ttkachi")~

REPLACE_ACTION_TEXT yoshp
~SetGlobal("KickedOut","LOCALS",1)[^!]*EscapeAreaMove("AR0406",1368,1922,0)~
~SetGlobal("Kicked_Out","LOCALS",1)
SetGlobal("ttYosh_WasInParty","GLOBAL",1)
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
Global("ttOnIsland","GLOBAL",0)
InParty("ttkachi")~ THEN YOSHP TS7
~I do not wish to end our pairing before our tasks are done, but perhaps a rest is in order. Are you sure you want to go seperate paths?~ [YOSHIM65]
END
  IF ~~ THEN REPLY ~We don't need your services right now. Sorry Yoshimo.~ EXTERN YOSHP TS12
  IF ~~ THEN REPLY ~No, I don't want you to leave just yet, Yoshimo.~ DO ~JoinParty()~ EXIT

CHAIN YOSHP TS12
~Where do you want to meet if we are to adventure again together?~
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
Global("ttInHalruaa","GLOBAL",0)
Global("ttOnIsland","GLOBAL",0)
GlobalLT("Chapter","GLOBAL",%bg2_chapter_7%)~ THEN REPLY ~Go to the Copper Coronet. If we need to find you, we'll meet you there.~ EXTERN YOSHP partway1
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
!InWatchersKeep()~ THEN REPLY ~Wait here. If we need your services we'll be back.~ EXTERN YOSHP partway2
  IF ~Global("ttInHalruaa","GLOBAL",0)
Global("ttOnIsland","GLOBAL",0)~ THEN REPLY ~Perhaps at a major inn or tavern? Somewhere we are sure to go.~ EXTERN YOSHP partway1

// Before Spellhold Joining

CHAIN IF WEIGHT #6 ~Global("Kicked_Out","LOCALS",1)
!InParty("ttkachi")
See("ttkachi")
Global("ttOnIsland","GLOBAL",0)
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
  IF ~Global("ttKachiko_Joined","GLOBAL",0) OR(2) AreaCheck("AR0313") AreaCheck("AR0406")~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN TTKACHI 23
  IF ~Global("ttKachiko_Joined","GLOBAL",0) !AreaCheck("AR0313") !AreaCheck("AR0406")~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN TTKACHI 24
  IF ~Global("ttKachiko_Joined","GLOBAL",1) OR(2) AreaCheck("AR0313") AreaCheck("AR0406")~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN TTKACHIP 0
  IF ~Global("ttKachiko_Joined","GLOBAL",1) !AreaCheck("AR0313") !AreaCheck("AR0406")~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)~ EXTERN TTKACHIP 1

//Island Kickout

CHAIN IF WEIGHT #5 ~Global("Kicked_Out","LOCALS",0) Global("ttOnIsland","GLOBAL",1)~ THEN YOSHP TS11
~<CHARNAME>, are you serious? You want to leave me when I really need your help?~
END
  IF ~!InParty("ttkachi")~ THEN REPLY ~Yes, Yoshimo. I am tired of all these complications with your crazy families. Look for somebody else to help you. I need to save Imoen.~ EXTERN YOSHP TS21
  IF ~InParty("ttkachi")~ THEN REPLY ~Yes, Yoshimo. I am tired of all these complications with your crazy families. Look for somebody else to help you. I need to save Imoen.~ EXTERN YOSHP partway1
  IF ~~ THEN REPLY ~Sorry, Yoshimo. I've just pressed the wrong button.~ EXTERN YOSHP TS22

CHAIN YOSHP partway1
~Oh, well that's okay, then.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~
== TTKACHIJ ~Yoshimo, wait. I am leaving with you. Alone you will only get into more troubles. Sorry <CHARNAME>, but I told you from the very start that I would follow whenever he goes... and I shall do so now.~ [KACHIL26] DO ~SetGlobal("Kicked_Out","LOCALS",1)
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
~Then return when you can. I will wait if you are sure to return.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~
== TTKACHIJ ~Yoshimo, I am staying with you. Alone you will only get into more troubles. Sorry <CHARNAME>, but I told you from the very start that I wouldn't allow him to escape... and I shan't do so now.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()~
EXIT

CHAIN YOSHP TS21
~Oh, well... I suppose we'll meet soon anyway.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)
EscapeAreaMove("TT0307",243,876,10)~
EXIT

CHAIN YOSHP TS22
~Oh, well that's okay, then.~ DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~
EXIT

// Kachiko Kidnapped Join

CHAIN IF WEIGHT #4 ~Global("Kicked_Out","LOCALS",1)
Global("ttOnIsland","GLOBAL",1)
!InParty("ttkachi")~ THEN YOSHP TS23
~<CHARNAME>, how are you? I see you didn't leave the island yet. So, could I beg your assisstance once again? Kachiko is dying... Please, join me to save her.~
END
  IF ~~ THEN REPLY ~Of course.~ EXTERN YOSHP TS24
  IF ~~ THEN REPLY ~No, not just yet.~ EXTERN YOSHP 2
 
CHAIN YOSHP TS24
~Thank you.~ DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
