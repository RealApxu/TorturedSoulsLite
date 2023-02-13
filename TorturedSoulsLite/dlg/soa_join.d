/////////////////////////
// Kachiko Join Event
/////////////////////////

BEGIN VPKACHI // Kachiko Initial Dialogue File
BEGIN VPKACHIP // Kachiko Join-In Dialogue (after you kicked her out of the group)

///////////////////////////////////////////////////////////////
// Kachiko finds you in Athkatla after conditions are met
///////////////////////////////////////////////////////////////

CHAIN
IF WEIGHT #2 ~InParty("Yoshimo") Global("VP_Kachiko_Meet","GLOBAL",1)~ THEN VPKACHI 0
~Ah, here you are, bastard! You thought you could flee far enough? I promised to find you even in Nine Hells! I am Kachiko Nakanishi, prepare to die!~ [KACHI01]
DO ~SetGlobal("VP_Kachiko_Meet","GLOBAL",2)~
== YOSHJ ~Kachiko, stop threatening me! I am not alone, and I will not give up so easily.~
== VPKACHI ~Who are these people with you? Are they your new associates? Don't think you're so safe. I can deal with all of them if they try to stop me.~ [KACHI02]
END
 ++ ~Do you mind if I interrupt your polemic?~ EXTERN VPKACHI 2
 ++ ~Shut up, both of you. You, crazy one, are gonna die!~ EXTERN YOSHJ TS153
 ++ ~*Stay silent*~ EXTERN YOSHJ TS154

CHAIN VPKACHI 2
~No, but this is not really your concern.~
END
 ++ ~I am <CHARNAME>. Please, introduce yourself, and maybe we shall come to a peaceful solution.~ EXTERN VPKACHI 3
 ++ ~I grow tired of explaining to everyone that I only wish to leave this dungeon as soon as possible. Prepare to die, witch!~ EXTERN YOSHJ TS153

CHAIN VPKACHI 3
~There is no peaceful solution, but... Hmm... May be you really don't know anything about this snake. I am Kachiko Nakanishi. From Kozakura. Do you know much of your associate, Yoshimo?~
END
 ++ ~No. Please, tell more.~ EXTERN VPKACHI 4

CHAIN VPKACHI 4
~This... this... man, Yoshimo, standing behind you is accused of my brother's murder...~
== YOSHJ ~I didn't kill him, and you know that! Your family accused me just because I am Hashimoto. Yes, I saw your brother die. No, I did not kill him. I had no choice but to escape; otherwise your family would kill me...~
END
 ++ ~Yoshimo, what's this all about?~ EXTERN YOSHJ TS157

CHAIN YOSHJ TS157
~<CHARNAME>, it's a long bloodshed between clans in Kozakura. We call it Hojo War. God knows how it all started... Her eldest brother, Naoko, was my best friend since childhood. We hoped that one day we might strike peace... I do not know who has assassinated him. I saw just a shadow on the wall. I mourn his loss...~
END
 ++ ~Yoshimo, why didn't you tell me that before?~ EXTERN YOSHJ TS158

CHAIN YOSHJ TS158
~I thought you wouldn't believe me. Look at Kachiko chasing me from Kara-Tur to Amn. Why should she trust me, indeed? I am Hashimoto and that makes me guilty. Even if I kill myself I would not resurrect my friend and her brother, and I would not put an end to this ridiculous feud...~
== VPKACHI ~Yoshimo, you sound sincere... Hmm... If what you say is true, we must come back to Kara-Tur and try to convince my family that you're not the murderer. But if you lied...~
== YOSHJ ~Kachiko, it's too late... I cannot go back to Kara-Tur.~
== VPKACHI ~Why? I will ensure your safety.~
== YOSHJ ~*Grin* You know I can take care of myself... But I cannot come back, since I promised to help <CHARNAME> first.~
END
 ++ ~Yoshimo, you may go with Kachiko. I don't want to hold you. Your troubles are no less serious than those of mine.~ EXTERN YOSHJ TS161
 ++ ~Yes, you're right. You cannot leave the group right now.~ EXTERN VPKACHI 8
 ++ ~Get out of my sight, both of you.~ EXTERN VPKACHI 9

CHAIN YOSHJ TS161
~I cannot come back to Kara-Tur right now. I... <CHARNAME>, I want to help you to discover what happened in this dungeon...~
EXTERN VPKACHI 8

CHAIN VPKACHI 8
~And I cannot come back to Kara-Tur without Yoshimo... dead or alive.~
== YOSHJ ~Kachiko, I promise to come back to Kara-Tur as soon as possible.~
== VPKACHI ~Don't lie to me. You won't escape again. I'll follow you, and I'll watch you. And once you close your deal with <CHARNAME>, you'll come with me.~
= ~<CHARNAME>, do you need another companion in your group? My grandfather trained me equally in the spiritual and martial arts. I am not very strong and cannot wear armour, but I am fast and deadly in combat. Perhaps, in the future I may improve my wizard skills, as it is within my ability.~
END
 ++ ~No, Kachiko, I have no room for you right now. Perhaps I will need your help later.~ EXTERN VPKACHI 11
 ++ ~Of course, I need a good fighter-mage.~ EXTERN YOSHJ TS165
 ++ ~Sorry, I don't need your help, and I won't allow you to follow us. Go back to Kara-Tur alone.~ EXTERN VPKACHI 12
 ++ ~I don't know you, I don't need your problems, and I won't allow you to follow us. I should have killed you right away.~ EXTERN YOSHJ TS153

CHAIN VPKACHI 11
~I have neither time, nor desire to wait for you in this dreadful barbaric city. But I won't leave without Yoshimo.~
== YOSHJ ~Kachiko, if you can't leave my side, how about I'll keep you company for a while? <CHARNAME>, if I may ask, can I follow her? It will take time to find a captain bold enough to sail to Kara-Tur. Perhaps, we will find such a person in Docks taverns. If you will need our help, you would find us there.~
END
 ++ ~Fine, you can wait for me with her. Perhaps I will found you later.~ EXTERN YOSHJ TS167
 ++ ~On the second thought, you can join us, Kachiko. I may need a help of a good fighter-mage.~ EXTERN YOSHJ TS165
 ++ ~If you can't leave Yoshimo, I don't want to hold you. You both may go.~ EXTERN YOSHJ TS161
 ++ ~I don't really care about your problems and I don't want to be followed. I should have killed you right away.~ EXTERN YOSHJ TS153

// Yoshimo waits with Kachiko
CHAIN YOSHJ TS167
~Thank you. So, Kachiko, we surely have a lot to catch up. I know a few nice places in town. Care to join me, good friend?~
== VPKACHI ~Watch yourself, "friend".~
== YOSHJ ~Ah, your tongue is sharp as always. Farewell for now, <CHARNAME>.~
DO ~SetGlobal("VP_YoshimoFollowsKachiko","GLOBAL",1)
SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0313",723,319,14)
ActionOverride("vpkachi",EscapeAreaMove("AR0313",784,333,8))~
EXIT

// Fight with Kachiko (neutral), Yoshimo escapes
CHAIN VPKACHI 12
~I won't come back without Yoshimo. If you want to stand between me and Yoshimo, I will crush you as well.~
== YOSHJ ~Kachiko, sorry, I can't go with you. But I won't draw my sword against you either. Sorry, <CHARNAME>, but I have to leave. I'll see you later.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("vpkachi",EscapeArea())
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
DestroyItem("NPSW02")
GivePartyAllEquipment()
LeaveParty()
EscapeArea()~
EXIT

// Fight with Kachiko (agressive), Yoshimo escapes
CHAIN YOSHJ TS153
~<CHARNAME>, what are you doing? She is my countrywoman, despite all our differences! I'm not going to participate in this slaughter! Sorry, <CHARNAME>, but I have to leave. I'll see you later.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogueFile()
LeaveParty()
EscapeAreaMove("AR0406",1368,1922,0)
SetGlobal("VP_YoshimoEscapes","GLOBAL",1)
ActionOverride("vpkachi",Enemy())~
EXIT

// Fight with Kachiko (early), Yoshimo escapes
CHAIN YOSHJ TS154
~Kachiko, calm down and listen to me...~
== VPKACHI ~I won't listen to your lies.~
== YOSHJ ~Kachiko, I won't draw my sword against you. Sorry, <CHARNAME>, but I have to leave. I'll see you later.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogueFile()
LeaveParty()
EscapeAreaMove("AR0406",1368,1922,0)
SetGlobal("VP_YoshimoEscapes","GLOBAL",1)
ActionOverride("vpkachi",Enemy())~
EXIT

// Yoshimo leaves the game with Kachiko
CHAIN VPKACHI 9
~Farewell.~
== YOSHJ ~<CHARNAME>, I am really sorry, but I shall go with Kachiko. Perhaps both you and I still have a chance. Believe me, it's the best choice I have ever made in my life.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogueFile()
LeaveParty()
EscapeAreaMove("AR0406",1368,1922,0)
SetGlobal("VP_YoshimoEscapes","GLOBAL",1)
ActionOverride("vpkachi",Enemy())~
EXIT

// Kachiko joins the group
CHAIN YOSHJ TS165
~Welcome on board, my friend.~
== VPKACHI ~Watch your tongue, "friend".~
DO ~SetGlobalTimer("VP_KachikoRomance","GLOBAL",ONE_DAY)
SetGlobal("VP_Kachiko_Joined","GLOBAL",1)
JoinParty()~
EXIT

////////////////////////////////////////////////////////
// Kachiko sent off with Yoshimo, joining dialogue
////////////////////////////////////////////////////////

// Talk with Kachiko
CHAIN
IF WEIGHT #0 ~Global("VP_YoshimoFollowsKachiko","GLOBAL",1)~ THEN VPKACHI 25
~It is good to see you again. I had hoped you would return. We still have not managed to get a ship. Do you need another party member or two?~
END
 ++ ~Yes.~ EXTERN VPKACHI 26
 ++ ~No.~ EXTERN VPKACHI 27

CHAIN VPKACHI 26
~Good. Not another word, then.~ DO ~SetGlobal("Kicked_Out","LOCALS",0)~
== YOSHP ~Oh, well that's okay, then.~
DO ~SetGlobal("VP_YoshimoFollowsKachiko","GLOBAL",2)
SetGlobal("Kicked_Out","LOCALS",0)
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
 ++ ~I am well, thank you. Did you manage to find a ship?~ EXTERN YOSHP TS9
 ++ ~Actually things have been pretty rough. Yoshimo, do you have time to help me out?~ EXTERN YOSHP TS10

CHAIN YOSHP TS9
~No, not yet. Kachiko's ship has already left, and it may take few months till we find another one.~
END
 ++ ~Since you have nothing much to do, but wait, may be you can help me out?~ EXTERN YOSHP TS10
 ++ ~Oh, well, that's life. Have patience, my friend.~ EXTERN YOSHP 2

CHAIN YOSHP TS10
~Kachiko, what do you think?~ DO ~SetGlobal("Kicked_Out","LOCALS",0)~
== VPKACHI ~I think it is a good idea! Better than staying in this barbaric tavern and listening to drunkard sailors!~
DO ~SetGlobal("VP_YoshimoFollowsKachiko","GLOBAL",2)
SetGlobal("Kicked_Out","LOCALS",0)
ActionOverride("Yoshimo",JoinParty())
JoinParty()~
EXIT

//////////////////////////////
// Other join-in dialogues
//////////////////////////////

// Kachiko Dropout Dialogue (Default)
CHAIN
IF WEIGHT #5 ~Global("Kicked_Out","LOCALS",0)~ THEN VPKACHIP 2
~Shall we continue on, or has this ended our travels?~
END
 IF ~InParty("Yoshimo") !Dead("Yoshimo")~ THEN ~Perhaps we should go separate ways.~ EXTERN VPKACHIP 3
 IF ~OR(2) !InParty("Yoshimo") Dead("Yoshimo")~ THEN ~Perhaps we should go separate ways.~ EXTERN VPKACHIP 4
 ++ ~We go on as before. Let's go.~ DO ~JoinParty()~ EXIT

CHAIN VPKACHIP 3
~Where should we meet if you were to change your mind?~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~
END
 ++ ~Meet us at the Sea Bounty Tavern.~ EXTERN YOSHJ TS216
 ++ ~I don't know. If you can, try and wait at a major tavern or inn.~ EXTERN YOSHJ TS215
 ++ ~Just wait right here and we'll come back for you later.~ EXTERN YOSHJ TS217
 ++ ~Find your own way. We won't meet again.~ EXTERN YOSHJ TS214

CHAIN YOSHJ TS214
~Sorry, <CHARNAME>. I cannot leave her alone. We must continue our mission.~
DO ~SetGlobal("VP_Kachiko_Yoshimo","GLOBAL",3)
SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("vpkachi",EscapeAreaMove("TT0102",165,727,8))
LeaveParty()
EscapeAreaMove("TT0102",225,683,8)~
EXIT

CHAIN YOSHJ TS215
~Sorry, <CHARNAME>. I cannot leave Kachiko alone. I must take a care of her. Farewell.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("vpkachi",EscapeAreaMove("AR0406",1368,1922,0))
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0406",1381,1959,1)~
EXIT

CHAIN YOSHJ TS216
~<CHARNAME>, I am sorry, but I shall go with Kachiko.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("vpkachi",EscapeAreaMove("AR0313",723,319,14))
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0313",784,333,8)~
EXIT

CHAIN YOSHJ TS217
~<CHARNAME>, I am sorry, but I shall stay with Kachiko.~
DO ~ChangeAIScript("",DEFAULT)
SetLeavePartyDialogueFile()
SetGlobal("Kicked_Out","LOCALS",1)
LeaveParty()~
EXIT

CHAIN VPKACHIP 4
~If that is what you wish. I don't think we will meet again.~
DO ~EscapeArea()~
EXIT

// Kachiko Dropout Dialogue (On Island - Surface)
CHAIN
IF WEIGHT #5 ~Global("Kicked_Out","LOCALS",0) Global("VP_OnIsland","GLOBAL",1)~ THEN VPKACHIP 2
~Are you sure about that? We won't do much on this island if we split up.~
END
 ++ ~Please, come back to the ship, and stay around there.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXTERN YOSHJ TS2141
 ++ ~We go on as before. Let's go.~ DO ~JoinParty()~ EXIT

CHAIN YOSHJ TS2141
~Sorry, <CHARNAME>. I cannot leave her alone. We must continue our mission.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("vpkachi",EscapeAreaMove("TT0100",165,727,8))
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("TT0100",225,683,8)~
EXIT

// Kachiko Dropout Dialogue (On Island - Dungeon)
CHAIN
IF WEIGHT #5 ~Global("Kicked_Out","LOCALS",0) Global("VP_OnIsland","GLOBAL",1)~ THEN VPKACHIP 2
~Are you sure about that? We won't do much on this island if we split up.~
END
 ++ ~Please, come back to the ship, and stay around there.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXTERN YOSHJ TS214
 ++ ~We go on as before. Let's go.~ DO ~JoinParty()~ EXIT

// Yoshimo with Kachiko Dropout Dialogue (Default)
CHAIN
IF WEIGHT #7 ~Global("Kicked_Out","LOCALS",0)
Global("VP_OnIsland","GLOBAL",0)
InParty("Kachiko")~ THEN YOSHP TS7
~I do not wish to end our pairing before our tasks are done, but perhaps a rest is in order. Are you sure you want to go seperate paths?~ [YOSHIM65]
END
 ++ ~We don't need your services right now. Sorry Yoshimo.~ EXTERN YOSHP TS12
 ++ ~No, I don't want you to leave just yet, Yoshimo.~ DO ~JoinParty()~ EXIT

CHAIN YOSHP TS12
~Where do you want to meet if we are to adventure again together?~
END
 ++ ~Go to the Sea Bounty Tavern. If we need to find you, we'll meet you there.~ EXTERN YOSHP partway1
 ++ ~Wait here. If we need your services we'll be back.~ EXTERN YOSHP partway2
 IF ~Global("VP_InHalruaa","GLOBAL",0) Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY ~Perhaps at a major inn or tavern? Somewhere we are sure to go.~ EXTERN YOSHP partway1

CHAIN YOSHP partway1
~Oh, well that's okay, then.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXTERN VPKACHIJ partway1
== VPKACHIJ ~Yoshimo, wait. I am leaving with you. Alone you will only get into more troubles. Sorry <CHARNAME>, but I told you from the very start that I would follow whenever he goes... and I shall do so now.~ [KACHIL26]
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
ActionOverride("Yoshimo",EscapeAreaMove("AR0406",1368,1922,0))
EscapeAreaMove("AR0406",1381,1959,1)~
EXIT

CHAIN YOSHP partway2
~Then return when you can. I will wait if you are sure to return.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~
== VPKACHIJ ~Yoshimo, I am staying with you. Alone you will only get into more troubles. Sorry <CHARNAME>, but I told you from the very start that I wouldn't allow him to escape... and I shan't do so now.~
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()~
EXIT

// Yoshimo Dropout Dialogue (On Island - Surface)
CHAIN
IF WEIGHT #5 ~Global("Kicked_Out","LOCALS",0)
Global("VP_OnIsland","GLOBAL",1)~ THEN YOSHP TS11
~<CHARNAME>, do you want to explore the island alone? I can't say I approve your desicion.~
END
 IF ~InParty("Kachiko")~ THEN ~Yes, Yoshimo. Please, wait for me near the ship. I will come back soon.~ EXTERN YOSHP TS1111
 IF ~!InParty("Kachiko")~ THEN ~Yes, Yoshimo. Please, wait for me near the ship. I will come back soon.~ EXTERN YOSHP TS1112
 ++ ~Sorry, Yoshimo. I've just pressed the wrong button.~ EXTERN YOSHP TS22

// Yoshimo Dropout Dialogue (On Island - Dungeon)
CHAIN
IF WEIGHT #5 ~Global("Kicked_Out","LOCALS",0)
Global("VP_OnIsland","GLOBAL",1)~ THEN YOSHP TS11
~<CHARNAME>, are you serious? You want to leave me when I really need your help?~
END
 IF ~!InParty("Kachiko")~ THEN REPLY ~Yes, Yoshimo. I am tired of all these complications with your crazy families. Look for somebody else to help you. I need to save Imoen.~ GOTO TS21
 IF ~InParty("Kachiko")~ THEN REPLY ~Yes, Yoshimo. I am tired of all these complications with your crazy families. Look for somebody else to help you. I need to save Imoen.~ GOTO partway1
 ++ ~Sorry, Yoshimo. I've just pressed the wrong button.~ GOTO TS22

IF ~~ THEN BEGIN TS21
 SAY ~Oh, well... I suppose we'll meet soon anyway.~
 IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
EscapeAreaMove("TT0307",243,876,10)~ EXIT
END

IF ~~ THEN BEGIN TS22
 SAY ~Oh, well that's okay, then.~
 IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

// Yoshimo Island Join-in
CHAIN
IF WEIGHT #4 ~Global("Kicked_Out","LOCALS",1)
Global("VP_OnIsland","GLOBAL",1)
!InParty("Kachiko")~ THEN YOSHP TS23
~<CHARNAME>, how are you? I see you didn't leave the island yet. So, could I beg your assisstance once again? Kachiko is dying... Please, join me to save her.~
END
 ++ ~Of course.~ EXTERN YOSHP TS24
 ++ ~No, not just yet.~ EXTERN YOSHP 2
 
CHAIN YOSHP TS24
~Thank you.~
DO ~SetGlobal("Kicked_Out","LOCALS",0) JoinParty()~
EXIT

CHAIN YOSHP TS25
~Oh, well that's okay, then.~
DO ~SetGlobal("Kicked_Out","LOCALS",0)
ActionOverride("Kachiko",JoinParty())
JoinParty()~
EXIT