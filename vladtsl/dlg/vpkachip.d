BEGIN TTKACHIP

// Parting Ways

CHAIN IF WEIGHT #5 ~Global("Kicked_Out","LOCALS",0)~ THEN TTKACHIP 2
@0
END
 IF ~InParty("Yoshimo") !Dead("Yoshimo")~ THEN REPLY @1 EXTERN TTKACHIP 3
 IF ~OR(2) !InParty("Yoshimo") Dead("Yoshimo")~ THEN REPLY @1 EXTERN TTKACHIP 4
 IF ~~ THEN REPLY @2 DO ~JoinParty()~ EXIT

CHAIN TTKACHIP 3
@3
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
GlobalLT("Chapter","GLOBAL",%bg2_chapter_7%)
Global("ttOnIsland","GLOBAL",0)
Global("ttInHalruaa","GLOBAL",0)~ THEN REPLY @4 DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXTERN YOSHJ TS216
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
!InWatchersKeep()
Global("ttOnIsland","GLOBAL",0)~ THEN REPLY @5 DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXTERN YOSHJ TS217
 IF ~Global("ttOnIsland","GLOBAL",0)
Global("ttInHalruaa","GLOBAL",0)~ THEN REPLY @6 DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXTERN YOSHJ TS215
 IF ~Global("ttOnIsland","GLOBAL",1)~ THEN REPLY @7 DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXTERN YOSHJ TS214
 IF ~~ THEN REPLY @8 DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXTERN YOSHJ TS214

CHAIN TTKACHIP 4
@9 DO ~EscapeArea()~
EXIT

CHAIN YOSHJ TS214
@10 DO ~SetGlobal("ttKachikoYoshimo","GLOBAL",3)
SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("Kachiko",EscapeAreaMove("TT0102",165,727,8))
LeaveParty()
EscapeAreaMove("TT0102",225,683,8)~ EXIT

CHAIN YOSHJ TS215
@11 DO ~SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("Kachiko",EscapeAreaMove("AR0406",1368,1922,0))
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0406",1381,1959,1)~ EXIT

CHAIN YOSHJ TS216
@12 DO ~SetGlobal("Kicked_Out","LOCALS",1)
ActionOverride("Kachiko",EscapeAreaMove("AR0313",723,319,14))
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0313",784,333,8)~ EXIT

CHAIN YOSHJ TS217
@13 DO ~ChangeAIScript("",DEFAULT)
SetLeavePartyDialogueFile()
SetGlobal("Kicked_Out","LOCALS",1)
LeaveParty()~ EXIT

// Yoshimo Search Kickout

CHAIN IF WEIGHT #2 ~Global("Kicked_Out","LOCALS",0)
!InParty("Yoshimo")
Global("ttYoshimoIsFound","GLOBAL",0)
GlobalGT("ttYoshimoSearch","GLOBAL",0)
GlobalLT("ttYoshimoSearch","GLOBAL",4)
Global("ttOnIsland","GLOBAL",0)
Global("ttKachikoInTavern","GLOBAL",0)~ THEN TTKACHIP 5
@14 DO ~SetGlobal("ttKachikoInTavern","GLOBAL",1)
EscapeAreaMove("AR0313",784,333,8)~ EXIT


// Kachiko Pickup Before Spellhold

CHAIN IF WEIGHT #3 ~Global("Kicked_Out","LOCALS",1)
Global("ttOnIsland","GLOBAL",0)
GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ THEN TTKACHIP 6
@15
END
 IF ~~ THEN REPLY @16 EXTERN TTKACHIP 7
 IF ~~ THEN REPLY @17 EXTERN TTKACHIP 8

CHAIN TTKACHIP 7
@18 DO ~ActionOverride("Yoshimo",SetGlobal("Kicked_Out","LOCALS",0))
ActionOverride("Yoshimo",JoinParty()
SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT

CHAIN TTKACHIP 8
@9
EXIT

// Ressurection

CHAIN IF WEIGHT #1 ~Global("ttKachikoReborn","GLOBAL",1)~ THEN TTKACHIP 9
~Who... who calls for me?~ [KACHIQ09] DO ~SetGlobal("ttKachikoReborn","GLOBAL",2)~
== YOSHJ ~Kachiko... oh, Kachiko. She is so pale and cold... ~
END
 IF ~!Global("ttEvilPath","GLOBAL",2) !Dead("ttnajoki")~ THEN EXTERN TTKACHIP 10
 IF ~OR(2) Global("ttEvilPath","GLOBAL",2) Dead("ttnajoki")~ THEN EXTERN TTKACHIP 14

CHAIN TTKACHIP 10
~It 's so dreadfully dark in here, I cannot see...~
== YOSHJ ~It's me, Kachiko, Yoshimo...~
== TTKACHIP ~Yoshimo... I dreamt that I was walking a long trail between the mountains towards the exit from the valley bathed in a bright light... and I was walking and walking and it was so far... I grew tired and then I heard a voice, calling... I was not sure it was you, but I hoped it was.~ [KACHIQ10]
== YOSHJ ~Of course, Kachiko it was me, whom else? How can I let you to run away so far and alone?~
== TTKACHIP ~Where am I? It looks like... It looks like a coffin. Oh, mine! It is a tomb, is not it? My tomb. Now I remember. Yoshimo, you saved me! Despite everything, you have come for me.~
== YOSHJ ~Kachiko, from the moment I saw you there in Athkatla, I knew that I would not allow any evil to come to you. I love you, Kachiko, and nothing could stop me. I would go to Nine Hells after you if I have to. With you around I feel like I have never been... I... I can be a better person...~ DO ~ChangeAlignment(Myself,CHAOTIC_GOOD)
AddXPObject(Myself,80000)
ActionOverride("Kachiko",ChangeAlignment(Myself,CHAOTIC_GOOD))
ActionOverride("Kachiko",AddXPObject(Myself,80000))~
== TTKACHIP ~Yoshimo, I love you too... Let's get out of this cold, terrible place...~ DO ~JoinParty()~
EXIT

CHAIN TTKACHIP 14
~Yoshimo? What is the meaning of that? How dare you to disturb my rest? How dare you to come here, blood of my family on your hands? You are a fool and a pathetic liar, Yoshimo!~ [KACHIQ11]
== YOSHJ ~I never lied to you...~
== TTKACHIP ~All Hashimoto are liars! I was so blind and you almost fooled me, just like you fooled Naoko! I can see it all so clearly now... Masaki was right about you... you know, it was him, who discovered Naoko's treachery and punished it. ~
== YOSHJ ~Masaki killed Naoko?~
== TTKACHIP ~Yes, and he alerted the wizard who had helped us to get away from Kara-Tur to this blessed Island about your whereabouts. So even if you flee you'd have to face Joneleth, the great mage, who champions Nakanishi's case.~
== YOSHJ ~As well as Hashimoto's it seems. My father told me that a mage named Joneleth made an offer of help to him also.~
== TTKACHIP ~Liar! I will not listen to you any longer! Masaki! Father! Brothers! Let's kill them all! For Nakanishi's honor!~ DO ~SetGlobal("ttKachikoSaved","GLOBAL",3)
StartCutScene("ttcutBad")~
EXIT

// Kachiko Pickup After Spellhold

CHAIN IF WEIGHT #4 ~Global("Kicked_Out","LOCALS",1)
!InParty("Yoshimo")
See("Yoshimo")
GlobalGT("Chapter","GLOBAL",%bg2_chapter_3%)~ THEN TTKACHIP 18
~It is good to see you again. Was there something that you wished?~
END
 IF ~~ THEN REPLY ~Maybe you can join my party?~ EXTERN TTKACHIP 7
 IF ~~ THEN REPLY ~No.~ EXTERN TTKACHIP 8

//Yoshimo Dies

CHAIN IF WEIGHT #0 ~Global("ttYoshimo_Dies","GLOBAL",1)
!Global("ttKachikoReborn","GLOBAL",1)~ THEN TTKACHIP 19
~Sorry, <CHARNAME>, I cannot stay with you any longer. Without Yoshimo, I have nothing to do in your party. I must go back to Kozakura. Good luck to you.~ DO ~EscapeArea()~
EXIT

// Kachiko Pickup no Yoshimo

CHAIN IF WEIGHT #-1 ~Global("ttKachikoInTavern","GLOBAL",1)
!InParty(Myself)
!InParty("Yoshimo")
!See("Yoshimo")~ THEN TTKACHIP N20
@35
END
 IF ~~ THEN REPLY @36 EXTERN TTKACHIP N21
 IF ~~ THEN REPLY @17 EXTERN TTKACHIP 8

CHAIN TTKACHIP N21
@18 DO ~SetGlobal("ttKachikoInTavern","GLOBAL",0)
SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
