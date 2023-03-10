///////////////////////////////////
// Kachiko Join Dialogues in ToB
///////////////////////////////////

BEGIN VPKACH25 // Kachiko Initial Dialogue File
BEGIN VPKACH2P // Kachiko Join-In Dialogue (after you kicked her out of the group)
BEGIN VPKACH2J // Kachiko Talks
BEGIN VPKACH2B // Kachiko Banters

BEGIN VPYOSH25 // Yoshimo ToB Initial Dialogue File
BEGIN VPYOSH2P // Yoshimo ToB Join-In Dialogue
BEGIN VPYOSH2J // Yoshimo ToB Talks
BEGIN VPYOSH2B // Yoshimo ToB Banters

// Kachiko Leave
CHAIN
IF WEIGHT #5 ~Global("Kicked_Out","LOCALS",0)~ THEN VPKACH2P 2
~Shall we continue on, or has this ended our travels?~
END
 IF ~InParty("Yoshimo") !Dead("Yoshimo")~ THEN ~Perhaps we should go separate ways.~ EXTERN VPKACH2P 3
 IF ~OR(2) !InParty("Yoshimo") Dead("Yoshimo")~ THEN ~Perhaps we should go separate ways.~ EXTERN VPKACH2P 4
 ++ ~We go on as before. Let's go.~ DO ~JoinParty()~ EXIT

CHAIN VPKACH2P 3
~Where should we meet if you were to change your mind?~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~
END
 ++ ~I will send you to the Pocket Plane. Wait for me there.~ EXTERN VPYOSH2J TS215
 ++ ~Just wait right here and we'll come back for you later.~ EXTERN VPYOSH2J TS217
 ++ ~Find your own way. We won't meet again.~ EXTERN VPYOSH2J TS214

CHAIN VPYOSH2J TS214
~Sorry, <CHARNAME>. I cannot leave her alone. Goodbye.~
DO ~SetGlobal("VP_Kachiko_Yoshimo","GLOBAL",3)
SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("vpkachi",EscapeArea())
LeaveParty()
EscapeArea()~
EXIT

CHAIN VPYOSH2J TS215
~Sorry, <CHARNAME>. I cannot leave Kachiko alone. I must take a care of her. Farewell.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("vpkachi",EscapeAreaMove("AR4500",1368,1922,0))
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR4500",1381,1959,1)~
EXIT

CHAIN VPYOSH2J TS217
~<CHARNAME>, I am sorry, but I shall stay with Kachiko.~
DO ~ChangeAIScript("",DEFAULT)
SetLeavePartyDialogueFile()
SetGlobal("Kicked_Out","LOCALS",1)
LeaveParty()~
EXIT

CHAIN VPKACH2P 4
~If that is what you wish. I don't think we will meet again.~
DO ~EscapeArea()~
EXIT

// Yoshimo Leave
CHAIN
IF WEIGHT #7 ~Global("Kicked_Out","LOCALS",0)
Global("VP_OnIsland","GLOBAL",0)
InParty("Kachiko")~ THEN VPYOSH2P TS7
~I do not wish to end our pairing before our tasks are done, but perhaps a rest is in order. Are you sure you want to go seperate paths?~ [YOSHIM65]
END
 ++ ~We don't need your services right now. Sorry Yoshimo.~ EXTERN VPYOSH2P TS12
 ++ ~No, I don't want you to leave just yet, Yoshimo.~ DO ~JoinParty()~ EXIT

CHAIN VPYOSH2P TS12
~Where do you want to meet if we are to adventure again together?~
END
 ++ ~You can wait in Pocket Plane. I will come back for you later.~ EXTERN VPYOSH2P partway1
 ++ ~Wait here. If we need your services we'll be back.~ EXTERN VPYOSH2P partway2

CHAIN VPYOSH2P partway1
~Oh, well that's okay, then.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXTERN VPKACH2J partway1
== VPKACH2J ~Yoshimo, wait. I am leaving with you. Alone you will only get into more troubles. Sorry <CHARNAME>, but I told you from the very start that I would follow whenever he goes... and I shall do so now.~ [KACHIL26]
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
ActionOverride("Yoshimo",EscapeAreaMove("AR4500",1368,1922,0))
EscapeAreaMove("AR4500",1381,1959,1)~
EXIT

CHAIN VPYOSH2P partway2
~Then return when you can. I will wait if you are sure to return.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~
== VPKACH2J ~Yoshimo, I am staying with you. Alone you will only get into more troubles. Sorry, <CHARNAME>.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()~
EXIT

// Join-in Kachiko
CHAIN
IF WEIGHT #0 ~Global("VP_YoshimoFollowsKachiko","GLOBAL",1)~ THEN VPKACHI 25
~It is good to see you again. I had hoped you would return. Do you need another party member or two?~
END
 ++ ~Yes.~ EXTERN VPKACHI 26
 ++ ~No.~ EXTERN VPKACHI 27

CHAIN VPKACHI 26
~Good. Not another word, then.~
== YOSHP ~Oh, well that's okay, then.~
DO ~SetGlobal("Kicked_Out","LOCALS",0)
ActionOverride("vpkachi",JoinParty())
JoinParty()~
EXIT

CHAIN VPKACHI 27
~If that is what you wish.~
EXIT

// Talk with Yoshimo
CHAIN
IF WEIGHT #6 ~Global("Kicked_Out","LOCALS",1)
!InParty("vpkachi")
See("vpkachi")
Global("VP_YoshimoFollowsKachiko","GLOBAL",1)~ THEN YOSHP TS8
~Heya, <CHARNAME>. How are you?~
END
 ++ ~Actually things have been pretty rough. Yoshimo, do you have time to help me out?~ EXTERN YOSHP TS10
 ++ ~I am well, thank you. Take care.~ EXTERN YOSHP TS9

CHAIN YOSHP TS10
~Kachiko, what do you think?~ DO ~SetGlobal("Kicked_Out","LOCALS",0)~
== VPKACHI ~I think it is a good idea! Better than staying in this place!~
DO ~ActionOverride("Yoshimo",JoinParty())
JoinParty()~
EXIT

CHAIN YOSHP TS9
~Oh, okay.~
EXIT