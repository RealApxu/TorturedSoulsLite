ALTER_TRANS PPSAEM // file name
BEGIN 13 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
 "TRIGGER" ~!InParty("vpkachi")~
END

ALTER_TRANS PPSAEM // file name
BEGIN 52 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
 "TRIGGER" ~!InParty("vpkachi") Global("Sime_Meet","GLOBAL",0)~
END

BEGIN VPNOMEAS



  IF ~~ THEN DO ~SetGlobal("Start_Island","GLOBAL",2)~ EXTERN ~KACHIJ~ sailoff3

EXTEND_TOP PPSAEM 13
 IF ~InParty("vpkachi")~ THEN EXTERN VPKACHIJ sailoff1
END

EXTEND_TOP PPSAEM 52
 IF ~InParty("vpkachi")~ THEN EXTERN VPKACHIJ sailoff1
END

APPEND VPKACHIJ

IF ~~ THEN BEGIN sailoff1
 SAY ~Wait a minute! The ship is ours to take anywhere, right? <CHARNAME>, can we go to Kara-Tur now?~
 ++ ~Nomeas, I have little knowledge of the sea travel. Can you tell me how long will it take us to get to Kara-Tur by sea?~ EXTERN PPSAEM TS7
END

IF ~~ THEN BEGIN sailoff3
 SAY ~Good luck to you, <CHARNAME>. Farewell.~
 IF ~~ THEN EXTERN PPSAEM TS9
END
END

APPEND PPSAEM

IF ~~ THEN BEGIN TS7
 SAY ~Half a year, may be a year... It is a long and dangerous route. Not many ships go that far away, and of those that do few return back.~
 ++ ~Yoshimo, Kachiko, I am sorry, but I have to haste to Imoen's rescue, her life is at stake! May be after we find Imoen I will go to Kara-Tur with you...~ EXTERN YOSHJ TS166
END

IF ~~ THEN BEGIN TS8
 SAY ~Ahem, if I may interrupt... I think I have a solution for your problem. Recently I run into a... mmh... an arch-mage of great renown, Harkle Harpel. For a minor service, he gave me this scroll. It's called the Harpel's Fog of Fate. If I cast it, my "Gallante" will carry you to the place you destined to be in mere hours, be it Kara-Tur or Spellhold.~
 IF ~True()~ THEN GOTO TS81
 IF ~InParty("Valygar")~ THEN EXTERN VALYGARJ TS122
 IF ~InParty("Anomen")~ THEN EXTERN ANOMENJ TS310
 IF ~InParty("Jaheira")~ THEN EXTERN JAHEIRAJ TS531
 IF ~InParty("Keldorn")~ THEN EXTERN KELDORJ TS252
END

IF ~~ THEN BEGIN TS81
 SAY ~Of course, I would not part with this scroll for less then 5,000 gold.~
 ++ ~We will pay you, Nomeas... if we are to survive this spell.~ GOTO TS0
 IF ~PartyGoldLT(5000) Global("ThiefGroup","GLOBAL",2)~ THEN REPLY ~Nomeas, it sounds good, but I have not got enough coin.~ EXTERN PPBODHI3 TS20 // ---> ... TS2 ... ---> ... TS5
 IF ~PartyGoldLT(5000) Global("ThiefGroup","GLOBAL",1)~ THEN REPLY ~Nomeas, it sounds good, but I have not got enough coin.~ EXTERN PPARAN2 TS10
 ++ ~On the second thought, this spell seems a way suspicious to trust it. We won't have any detours.~ EXTERN YOSHJ TS167
END

IF ~~ THEN BEGIN TS2
 SAY ~With pleasure. Well, then everything is settled. Here is the scroll.~
 IF ~Global("ThiefGroup","GLOBAL",2)~ THEN DO ~SetGlobal("Start_Island","GLOBAL",1) StartCutSceneMode() StartCutScene("vp41ci")~ EXIT // ---> to the Island with Bodhi
 IF ~Global("ThiefGroup","GLOBAL",1) InParty("vpsime")~ THEN DO ~SetGlobal("Start_Island","GLOBAL",1) StartCutSceneMode() StartCutScene("vp41disp")~ EXIT // ---> to the Island with Sime being in-party
 IF ~Global("ThiefGroup","GLOBAL",1) !InParty("vpsime") Global("Sime_Meet","GLOBAL",0)~ THEN DO ~SetGlobal("Start_Island","GLOBAL",1) StartCutSceneMode() StartCutScene("vp41disc")~ EXIT // ---> to the Island; in-game Sime is destroyed and re-created
 IF ~Global("ThiefGroup","GLOBAL",1) !InParty("vpsime") Global("Sime_Meet","GLOBAL",1)~ THEN DO ~SetGlobal("Start_Island","GLOBAL",1) StartCutSceneMode() StartCutScene("vp41dism")~ EXIT // ---> to the Island; Sime is joinable and moved to the Island
END

IF ~~ THEN BEGIN TS9
 SAY #9749
 IF ~Global("ThiefGroup","GLOBAL",2)~ THEN DO ~StartCutSceneMode() StartCutScene("vp41cn")~ EXIT // ---> to Brynnlaw with Bodhi
 IF ~Global("ThiefGroup","GLOBAL",1) InParty("vpsime")~ THEN DO ~StartCutSceneMode() StartCutScene("vp41dnsp")~ EXIT // ---> to Brynnlaw with Sime being in-party
 IF ~Global("ThiefGroup","GLOBAL",1) !InParty("vpsime") Global("Sime_Meet","GLOBAL",0)~ THEN DO ~StartCutSceneMode() StartCutScene("vp41dnsm")~ EXIT // ---> to Brynnlaw without Yoshimo/Kachiko; in-game Sime is destroyed and re-created
 IF ~Global("ThiefGroup","GLOBAL",1) !InParty("vpsime") Global("Sime_Meet","GLOBAL",1)~ THEN DO ~StartCutSceneMode() StartCutScene("vp41dnsc")~ EXIT // ---> to Brynnlaw without Yoshimo/Kachiko; Sime is joinable and moved to Brynnlaw 
END

IF ~~ THEN BEGIN TS0
 SAY ~That is why I would like to get my payment before I cast the spell.~
 IF ~Global("ThiefGroup","GLOBAL",2)~ THEN EXTERN PPBODHI3 TS21
 IF ~Global("ThiefGroup","GLOBAL",1)~ THEN EXTERN PPARAN2 TS11
END
END

// Guild Master Responses

CHAIN PPBODHI3 TS20
~My guild will pay you, Nomeas... if we are to survive this spell...~
== PPSAEM ~That is why I would like to get my payment before I cast the spell.~
END
IF ~~ THEN EXTERN PPBODHI3 TS21

CHAIN PPBODHI3 TS21
~Watch you tongue, Nomeas. We have already paid you enough!~
== PPSAEM ~You have paid me only for one way to Brynnlaw... Sorry to say, but business is business.~
== PPBODHI3 ~Okay, take this money, and try to do your best.~
== VPKACHIJ ~Oh, we will see Kara-Turian shores and prove that Yoshimo is innocent and restore peace between our families. I agree with you, <CHARNAME>, let the fate decide! Cast the spell captain Havarian!~
END
 IF ~~ THEN EXTERN PPSAEM TS2

CHAIN PPARAN2 TS10
~My guild will pay you, Nomeas... if we are to survive this spell...~
== PPSAEM ~That is why I would like to get my payment before I cast the spell.~
END
IF ~~ THEN EXTERN PPARAN2 TS11

CHAIN PPARAN2 TS11
~Watch you tongue, Nomeas. We have already paid you enough!~
== PPSAEM ~You have paid me only for one way to Brynnlaw... Sorry to say, but business is business.~
== PPARAN2 ~Okay, take this money, and try to do your best.~
== VPKACHIJ ~Oh, we will see Kara-Turian shores and prove that Yoshimo is innocent and restore peace between our families. I agree with you, <CHARNAME>, let the fate decide! Cast the spell captain Havarian!~
END
 IF ~~ THEN EXTERN PPSAEM TS2

APPEND YOSHJ

IF ~~ THEN BEGIN TS166
 SAY ~No! This is impossible! Eh, no, I'd rather part our ways right now.~
 IF ~~ THEN EXTERN PPSAEM TS8
END

IF ~~ THEN BEGIN TS167
 SAY ~I understand. I wish you good luck in your dealings with Irenicus and rescuing Imoen. Farewell and do not think ill of us.~
 IF ~~ THEN DO ~SetGlobal("Start_Island","GLOBAL",2)~ EXTERN VPKACHIJ sailoff3
END
END

APPEND KELDORJ

IF ~~ THEN BEGIN TS252
 SAY ~<CHARNAME>, Harkle Harpel is no arch-mage, he belongs to a family of lunatics! For what I know of Harpels we might be turned into frogs or some such if you allow Nomeas to cast the spell! Be careful!~
 ++ ~Well, what's life if not one big gamble! Cast your spell, Nomeas, and if it fails I will see good old Harkle turned into a frog himself. But if it works, my friends prepare to storm Spellhold this afternoon!~ DO ~SetGlobal("VP_Pay_to_Nomeas","GLOBAL",1)~ EXTERN PPSAEM TS81
 ++ ~That's exactly what I heard about Harpells. Imoen is too dear to me to trust that this spell is an exception from their customary failures. We won't have any detours.~ EXTERN YOSHJ TS167
END
END

APPEND JAHEIRAJ

IF ~~ THEN BEGIN TS531
 SAY ~<CHARNAME>, Harkle Harpel is no arch-mage, he belongs to a family of lunatics! For what I know of Harpels we might be turned into frogs or some such if you allow Nomeas to cast the spell! Be careful!~
 ++ ~Well, what's life if not one big gamble! Cast your spell, Nomeas, and if it fails I will see good old Harkle turned into a frog himself. But if it works, my friends prepare to storm Spellhold this afternoon!~ DO ~SetGlobal("VP_Pay_to_Nomeas","GLOBAL",1)~ EXTERN PPSAEM TS81
 ++ ~That's exactly what I heard about Harpells. Imoen is too dear to me to trust that this spell is an exception from their customary failures. We won't have any detours.~ EXTERN YOSHJ TS167
END
END

APPEND ANOMENJ

IF ~~ THEN BEGIN TS310
 SAY ~<CHARNAME>, Harkle Harpel is no arch-mage, he belongs to a family of lunatics! For what I know of Harpels we might be turned into frogs or some such if you allow Nomeas to cast the spell! Be careful!~
 ++ ~Well, what's life if not one big gamble! Cast your spell, Nomeas, and if it fails I will see good old Harkle turned into a frog himself. But if it works, my friends prepare to storm Spellhold this afternoon!~ DO ~SetGlobal("VP_Pay_to_Nomeas","GLOBAL",1)~ EXTERN PPSAEM TS81
 ++ ~That's exactly what I heard about Harpells. Imoen is too dear to me to trust that this spell is an exception from their customary failures. We won't have any detours.~ EXTERN YOSHJ TS167
END
END

APPEND VALYGARJ

IF ~~ THEN BEGIN TS122
 SAY ~<CHARNAME>, Harkle Harpel is no arch-mage, he belongs to a family of lunatics! For what I know of Harpels we might be turned into frogs or some such if you allow Nomeas to cast the spell! Be careful!~
 ++ ~Well, what's life if not one big gamble! Cast your spell, Nomeas, and if it fails I will see good old Harkle turned into a frog himself. But if it works, my friends prepare to storm Spellhold this afternoon!~ DO ~SetGlobal("VP_Pay_to_Nomeas","GLOBAL",1)~ EXTERN PPSAEM TS81
 ++ ~That's exactly what I heard about Harpells. Imoen is too dear to me to trust that this spell is an exception from their customary failures. We won't have any detours.~ EXTERN YOSHJ TS167
END
END