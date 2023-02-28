////////////////////////////////////////
// SoA Other Talks and Interjections
////////////////////////////////////////

////////////////////////////////////////
// After Quest Spellhold Sequence
////////////////////////////////////////

// Irenicus Confrontation

// PPIRENI1.DLG

// Scripts

ALTER_TRANS PPIRENI1 // file name
BEGIN 32 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~InParty("Yoshimo")
!Dead("Yoshimo")~
END

ALTER_TRANS PPIRENI1 // file name
BEGIN 32 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~InParty("Yoshimo")
Dead("Yoshimo")~
END

ALTER_TRANS PPIRENI1 // file name
BEGIN 32 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!InParty("Yoshimo")~
END

ADD_TRANS_TRIGGER PPIRENI1 34
~OR(2)
!Global("Kachiko_Saved","GLOBAL",2)
Global("TT_Evil_Path","GLOBAL",3)~ DO 0

EXTEND_BOTTOM PPIRENI1 34
  IF ~Global("Kachiko_Saved","GLOBAL",2)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",20)
DisplayString(Myself,50707)
Spell(Myself,DO_NOTHING)
StartCutSceneMode()
StartCutScene("vp41g")~ EXIT
END

ADD_TRANS_TRIGGER PPIRENI1 45
~OR(2)
Global("Kachiko_Saved","GLOBAL",3)
Global("TT_Evil_Path","GLOBAL",3)~ DO 0

EXTEND_BOTTOM PPIRENI1 45
  IF ~Global("Kachiko_Saved","GLOBAL",2)~ THEN EXTERN ~YOSHJ~ TS209
END

// Dialogue

CHAIN YOSHJ VP_PPIRENI1.1
~N-No, Master Irenicus...~
== PPIRENI1 ~I don't understand what are you talking about?~
== YOSHJ ~I... I am not cursed anymore.~
== PPIRENI1 ~What did you say? Hmm... And how did you manage to avoid the geas?~
== YOSHJ ~There are circumstances that you are not aware of...~
== PPIRENI1 ~So, <CHARNAME>, you have been much more capable than I thought.~
END
 ++ ~I hate to impose, but could you tell me what's going on here?~ EXTERN PPIRENI1 VP_PPIRENI1.1.1
 ++ ~What is he talking about, Yoshimo?~ EXTERN YOSHJ VP_PPIRENI1.2
 ++ ~I don't know what's going on here, but I know I don't like it...~ EXTERN PPIRENI1 VP_PPIRENI1.1.1

CHAIN PPIRENI1 VP_PPIRENI1.1.1
~I knew you were strong, but I couldn't imagine that you are so powerful... I congratulate you, though I am really disappointed. Yoshimo was my best servant, but now he is betraying me without any obvious reason. We had a deal, and I paid him well... So, Yoshimo, you betrayed me to <CHARNAME>. I thought I had earned your soul...~
EXTERN YOSHJ VP_PPIRENI1.2

CHAIN YOSHJ VP_PPIRENI1.2
~Our deal is closed, Irenicus. The war is over, and my family is saved.~
== PPIRENI1 ~Are you serious? Do you think you've saved anybody? They are all dead... they were dead long time ago, even before I met you.~
== YOSHJ ~(*Tears appear in his eyes.*) W-What? Y-you k-knew that? You knew that... and you arranged our meeting to persuade me to sell my soul to you! You devil!~
== PPIRENI1 ~(*He laughs*) No, I would think not. But don't be so upset, Yoshimo. You couldn't help them, and believe me they got what they deserved. Remember that, and listen all of you to the words I have to say, since your time is short.~
= ~What is life? Life is a miserable reflection of death. My life, in this world, seems so very distant... the memories clouded like those of a child. And a child I was, then... probing the darkest magic, given glimpses of the truths yet to come. Yes, look at me. And what do you see? A monster? An abomination?~
= ~(*Again he laughs*) I was an elven mage of great power, perhaps the most powerful elven mage who has ever been. For 200 years I studied the magic of Necromancy... the arts of physical and spiritual healing, the resurrection of the souls of the dead... Perhaps it is just the way of humans, but what I had seen and learned was not enough.~
= ~My studies were of the souls of the dead. Once I had seen the darker side of Necromancy, I began to speak with those souls, to animate the soulless, to quench the lives of the living. The bodies I experimented upon were already dead! If I raised their souls to again quench them, who is to say I didn't have the right?~
= ~I craved knowledge, felt the shadow of my own mortality. And so I looked deeper, and the secrets of Black Necromancy were shown to me, and I reveled in the truths I had uncovered, and I shared them with my people.~
= ~They saw it differently than me, though... (*he laughs to himself*) They didn't know what to think, and how could they? These were new discoveries, there were no precedents... and they listened to Her over the voice of their own reason, over my voice.~
= ~She had never loved me, She lied to me, She betrayed me, She waited for an opportunity to defame me, and when it came She viciously attacked.~
= ~I'm no monster... I know that the line between good and evil is a gray one, and perhaps all of my actions weren't necessarily pure, but who are they to judge me? And banishment? Banishment for some questionable experiments?~
= ~They prepared to exile me, to throw me out of their number... but no! Her jealousy turned them against me, forced their hand. Her words became the evidence against me, and they sentenced me to the Void.~
= ~That place has no time as you know it. I've been there for years uncounted, and yet I've not aged at all... I feel as I did the moment they sent me there, or as when the Dark Elves first called to me.~
= ~Do you now see? Being there I can do everything I did in your world, but I am unfettered by the chains of mortality that time hangs upon us.~
= ~My reasons for returning aren't what you'd think. I have no aspirations for power or domination like you. I need you powerful living soul to come back and pay an old debt of mine. I need your power to plan my revenge.~
END
 ++ ~I have come to the conclusion that you are really insane. This asylum is the most suitable place for you where you may continue planning your revenge. I'll just take Imoen and be going...~ EXTERN PPIRENI1 VP_PPIRENI1.2.1
 ++ ~The time for talk is over. Let's finish this.~ EXTERN PPIRENI1 VP_PPIRENI1.2.2
 ++ ~Uh... I think that I'm still gonna kill you.~ EXTERN PPIRENI1 VP_PPIRENI1.2.3

CHAIN PPIRENI1 VP_PPIRENI1.2.1
~I'm very sorry, but I'm afraid that you'll be going nowhere.~
EXTERN PPIRENI1 VP_PPIRENI1.3

CHAIN PPIRENI1 VP_PPIRENI1.2.2
~Oh, I don't think so. Perhaps our conversation is coming to an end.~
EXTERN PPIRENI1 VP_PPIRENI1.3

CHAIN PPIRENI1 VP_PPIRENI1.2.3
~I suppose you won't be able to do that.~
EXTERN PPIRENI1 VP_PPIRENI1.3

CHAIN PPIRENI1 VP_PPIRENI1.3
~Now you will find you are powerless. I have taken precautions that you will not be damaged. Rage would be wasted.~
EXTERN PPIRENI1 34

// PPIRENI2.DLG

// Scripts

ALTER_TRANS PPIRENI2 // file name
BEGIN 19 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~OR(2)
Global("Kachiko_Saved","GLOBAL",3)
Global("TT_Evil_Path","GLOBAL",3)
OR(2)
!InParty("Yoshimo")
Dead("Yoshimo")~
END

ALTER_TRANS PPIRENI2 // file name
BEGIN 19 END // state number (can be more than one)
BEGIN 1 2 3 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~InParty("Yoshimo")
!Dead("Yoshimo")~
END

EXTEND_TOP PPIRENI2 19
	IF ~OR(2)
Global("Kachiko_Saved","GLOBAL",2)
Global("Kachiko_Saved","GLOBAL",0)
	OR(2)
!InParty("Yoshimo")
Dead("Yoshimo")~ THEN DO ~EraseJournalEntry(15751)
EraseJournalEntry(15752)
EraseJournalEntry(23407)
SetGlobal("AsylumPlot","GLOBAL",25)
StartCutSceneMode()
StartCutScene("cut41zh")~ SOLVED_JOURNAL #16535 EXIT
END

ALTER_TRANS PPIRENI2 // file name
BEGIN 20 22 END // state number (can be more than one)
BEGIN 3 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~See("Yoshimo")
!Dead("Yoshimo")
!InParty("Yoshimo")~
END

ADD_TRANS_TRIGGER PPIRENI2 27
~OR(4)
Global("Kachiko_Saved","GLOBAL",3)
Global("TT_Evil_Path","GLOBAL",3)
!InParty("Yoshimo")
Dead("Yoshimo")~ DO 0

EXTEND_BOTTOM PPIRENI2 27
	IF ~Global("Kachiko_Saved","GLOBAL",2)~ THEN DO ~EraseJournalEntry(7252)
EraseJournalEntry(7253)
EraseJournalEntry(22952)
EraseJournalEntry(23306)
SetGlobal("AsylumPlot","GLOBAL",40)
StartCutSceneMode()
StartCutScene("vp41j")~ SOLVED_JOURNAL #7255 EXIT
END

ALTER_TRANS PPIRENI2 // file name
BEGIN 45 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~InParty("Yoshimo")
!Dead("Yoshimo")~
END

ALTER_TRANS PPIRENI2 // file name
BEGIN 45 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~InParty("Yoshimo")
Dead("Yoshimo")~
END

ALTER_TRANS PPIRENI2 // file name
BEGIN 45 END // state number (can be more than one)
BEGIN 2 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!InParty("Yoshimo")~
END

ADD_TRANS_TRIGGER PPIRENI2 47
~Global("Kachiko_Saved","GLOBAL",2)~ DO 0

ALTER_TRANS PPIRENI2 // file name
BEGIN 47 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("AsylumPlot","GLOBAL",20)
DisplayString(Myself,50707)
Spell(Myself,DO_NOTHING)
StartCutSceneMode()
StartCutScene("vp41g")~
END

EXTEND_BOTTOM PPIRENI2 47
  IF ~OR(2)
!Global("Kachiko_Saved","GLOBAL",2)
Global("TT_Evil_Path","GLOBAL",3)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",20)
DisplayString(Myself,50707)
Spell(Myself,DO_NOTHING)
StartCutSceneMode()
StartCutScene("Cut41g")~ EXIT
END

ADD_TRANS_TRIGGER PPIRENI2 66
~OR(2)
Global("Kachiko_Saved","GLOBAL",3)
Global("TT_Evil_Path","GLOBAL",3)~ DO 0

EXTEND_BOTTOM PPIRENI2 66
  IF ~Global("Kachiko_Saved","GLOBAL",2)~ THEN EXTERN ~YOSHJ~ TS209
END

// Dialogue

CHAIN YOSHJ VP_PPIRENI2.1
~N-No, Master Irenicus...~
== PPIRENI2 ~I don't understand what are you talking about?~
== YOSHJ ~I... I am not cursed anymore.~
== PPIRENI2 ~What did you say? Hmm... And how did you manage to avoid the geas?~
== YOSHJ ~There are circumstances that you are not aware of...~
== PPIRENI2 ~So, <CHARNAME>, you have been much more capable than I thought.~
END
 ++ ~I hate to impose, but could you tell me what's going on here?~ EXTERN PPIRENI2 VP_PPIRENI2.1.1
 ++ ~What is he talking about, Yoshimo?~ EXTERN YOSHJ VP_PPIRENI2.2
 ++ ~I don't know what's going on here, but I know I don't like it...~ EXTERN PPIRENI2 VP_PPIRENI2.1.1

CHAIN PPIRENI2 VP_PPIRENI2.1.1
~I knew you were strong, but I couldn't imagine that you are so powerful... I congratulate you, though I am really disappointed. Yoshimo was my best servant, but now he is betraying me without any obvious reason. We had a deal, and I paid him well... So, Yoshimo, you betrayed me to <CHARNAME>. I thought I had earned your soul...~
EXTERN YOSHJ VP_PPIRENI2.2

CHAIN YOSHJ VP_PPIRENI2.2
~Our deal is closed, Irenicus. The war is over, and my family is saved.~
== PPIRENI2 ~Are you serious? Do you think you've saved anybody? They are all dead... they were dead long time ago, even before I met you.~
== YOSHJ ~(*Tears appear in his eyes.*) W-What? Y-you k-knew that? You knew that... and you arranged our meeting to persuade me to sell my soul to you! You devil!~
== PPIRENI2 ~(*He laughs*) No, I would think not. But don't be so upset, Yoshimo. You couldn't help them, and believe me they got what they deserved. Remember that, and listen all of you to the words I have to say, since your time is short.~
= ~What is life? Life is a miserable reflection of death. My life, in this world, seems so very distant... the memories clouded like those of a child. And a child I was, then... probing the darkest magic, given glimpses of the truths yet to come. Yes, look at me. And what do you see? A monster? An abomination?~
= ~(*Again he laughs*) I was an elven mage of great power, perhaps the most powerful elven mage who has ever been. For 200 years I studied the magic of Necromancy... the arts of physical and spiritual healing, the resurrection of the souls of the dead... Perhaps it is just the way of humans, but what I had seen and learned was not enough.~
= ~My studies were of the souls of the dead. Once I had seen the darker side of Necromancy, I began to speak with those souls, to animate the soulless, to quench the lives of the living. The bodies I experimented upon were already dead! If I raised their souls to again quench them, who is to say I didn't have the right?~
= ~I craved knowledge, felt the shadow of my own mortality. And so I looked deeper, and the secrets of Black Necromancy were shown to me, and I reveled in the truths I had uncovered, and I shared them with my people.~
= ~They saw it differently than me, though... (*he laughs to himself*) They didn't know what to think, and how could they? These were new discoveries, there were no precedents... and they listened to Her over the voice of their own reason, over my voice.~
= ~She had never loved me, She lied to me, She betrayed me, She waited for an opportunity to defame me, and when it came She viciously attacked.~
= ~I'm no monster... I know that the line between good and evil is a gray one, and perhaps all of my actions weren't necessarily pure, but who are they to judge me? And banishment? Banishment for some questionable experiments?~
= ~They prepared to exile me, to throw me out of their number... but no! Her jealousy turned them against me, forced their hand. Her words became the evidence against me, and they sentenced me to the Void.~
= ~That place has no time as you know it. I've been there for years uncounted, and yet I've not aged at all... I feel as I did the moment they sent me there, or as when the Dark Elves first called to me.~
= ~Do you now see? Being there I can do everything I did in your world, but I am unfettered by the chains of mortality that time hangs upon us.~
= ~My reasons for returning aren't what you'd think. I have no aspirations for power or domination like you. I need you powerful living soul to come back and pay an old debt of mine. I need your power to plan my revenge.~
END
 ++ ~I have come to the conclusion that you are really insane. This asylum is the most suitable place for you where you may continue planning your revenge. I'll just take Imoen and be going...~ EXTERN PPIRENI2 VP_PPIRENI2.2.1
 ++ ~The time for talk is over. Let's finish this.~ EXTERN PPIRENI2 VP_PPIRENI2.2.2
 ++ ~Uh... I think that I'm still gonna kill you.~ EXTERN PPIRENI2 VP_PPIRENI2.2.3

CHAIN PPIRENI2 VP_PPIRENI2.2.1
~I'm very sorry, but I'm afraid that you'll be going nowhere.~
EXTERN PPIRENI2 VP_PPIRENI2.3

CHAIN PPIRENI2 VP_PPIRENI2.2.2
~Oh, I don't think so. Perhaps our conversation is coming to an end.~
EXTERN PPIRENI2 VP_PPIRENI2.3

CHAIN PPIRENI2 VP_PPIRENI2.2.3
~I suppose you won't be able to do that.~
EXTERN PPIRENI2 VP_PPIRENI2.3

CHAIN PPIRENI2 VP_PPIRENI2.3
~Now you will find you are powerless. I have taken precautions that you will not be damaged. Rage would be wasted.~
EXTERN PPIRENI2 47

// Talk near Imoen

CHAIN
IF ~Global("VP_YoshimoExcuse","GLOBAL",1)~ THEN VPKACHI TSL_Imoen_Join1
~<CHARNAME>, I think we should talk about what happened. Yoshimo had dishonorable intentions and it is your right to demand his death.~ [KACHIL06] DO ~SetGlobal("VP_YoshimoExcuse","GLOBAL",2)~
END
 ++ ~What do you mean Kachiko? That sounds a bit extreme.~ EXTERN VPKACHIJ N33
 ++ ~Kachiko, my custom is more forgiving than the code of a samurai. I have seen Yoshimo stand against Irenicus and refuse to surrender me. I trust him.~ EXTERN VPKACHIJ N34
 ++ ~Glad you reminded me of the traitor. I do not wish him in my party. He may do what he wants with his life, but he may not stay.~ EXTERN YOSHJ TS218

CHAIN VPKACHIJ N33
~My <PRO_LADYLORD>, Yoshimo pledged his service to you, yet he was serving Irenicus at the same time. His intention was to deceive you. Yoshimo is not a samurai and he does not follow a strict code of honor, but his upbringing was that of a noble. His actions towards you call for ritual suicide.~
END
 ++ ~I respect your customs, but he has a noble heart, and he's faithful ally. He stood against Irenicus and refused to surrender me. I trust him.~ EXTERN VPKACHIJ N34
 ++ ~Uh, well... He may do what he wants with his life, but he may not stay.~ EXTERN YOSHJ TS218

CHAIN VPKACHIJ N34
~So you do not see his actions as betrayal, then <CHARNAME>?~
END
 ++ ~No Kachiko, the way I see it, Yoshimo was loyal to me in deed if not always in his thoughts. I am quite comfortable with him staying in the party.~ EXTERN VPKACHIJ N35

CHAIN VPKACHIJ N35
~You have a different way of thinking <CHARNAME>, but I am... I am glad you do. Yoshimo and I will prove our loyalty to you in battle.~ [KACHIL16]
== IMOEN2 ~That's good, Kachiko.~
EXIT

CHAIN YOSHJ TS218
~Your wish is my command. I shall leave the group. I cannot say how much I am sorry for allowing Irenicus to capture me in the moment of my weakness. Fare thee well <CHARNAME>.~ DO ~SetGlobal("Kicked_Out","LOCALS",1)~
== VPKACHIJ ~Yoshimo, wait. I am leaving with you. Alone you will only get into more troubles. Sorry <CHARNAME>, but I told you from the very start that I would follow whenever he goes... and I shall do so now.~ [KACHIL26]
== IMOEN2 ~Bye, Kachiko.~
DO ~ActionOverride("Yoshimo",LeaveParty())
ActionOverride("Yoshimo",EscapeArea())
ActionOverride("vpkachi",LeaveParty())
ActionOverride("vpkachi",EscapeArea())~
EXIT

// Hsiang Attack

BEGIN VPHSIANG

CHAIN
IF ~Global("VP_YoshimoExcuse","GLOBAL",3)~ THEN VPHSIANG 0
~Yoshimo, I came for you... for your black heart... for your soul.~
== YOSHJ ~You have no rights! The deal is closed.~
== VPHSIANG ~I have a contract for your soul. You cannot live your miserable life with this burden anymore.~
== YOSHJ ~You won't get anything from me! I won't give up!~
== VPHSIANG ~I have no choice but to force you to give me your heart and your soul.~
DO ~SetGlobal("VP_YoshimoExcuse","GLOBAL",4) Enemy()~
EXIT

////////////////////////
// Tree of Life
////////////////////////

// Kachiko
INTERJECT PLAYER1 33 VPKachiToL0
== PLAYER1 IF ~InParty("vpkachi") InMyArea("vpkachi") !StateCheck("vpkachi",CD_STATE_NOTVALID)~ THEN
~Kachiko. A warrior from a distant land, she insisted to join you to be close to Yoshimo whom she hated. She stayed with you through thick and thin to be close to Yoshimo she loved...~
END
 ++ ~Kachiko... You had fought valiantly by my side, but if you wish to go back to your life now, I would understand...~ EXTERN VPKACHIJ VPKachiToL1
 ++ ~Irenicus is a terrible creature, Kachiko. Please, let me know that you are prepared to face such a challenge.~ EXTERN VPKACHIJ VPKachiToL2
 ++ ~Behind these doors is death... May be it awaits Irenicus, may be it awaits all of us... You have seen death closer than I. Would you go through this door?~ EXTERN VPKACHIJ VPKachiToL3
 
CHAIN VPKACHIJ VPKachiToL1
~Avenging the suffering of my family is a part of my life, <CHARNAME>. My blade is thirsty for his blood. For Nakanishi's honor! For Hashimoto's honor! No more talk! I am going!~
COPY_TRANS PLAYER1 33

CHAIN VPKACHIJ VPKachiToL2
~Try to stop me! You would have to tie me up to prevent me from fighting Irenicus. For Nakanishi's honor! For Hashimoto's honor!~
COPY_TRANS PLAYER1 33

CHAIN VPKACHIJ VPKachiToL3
~I have seen it, yes. I am not afraid to die if I know that Irenicus goes down with me. For Nakanishi's honor! For Hashimoto's honor!~
COPY_TRANS PLAYER1 33

// Yoshimo
INTERJECT PLAYER1 33 VPYoshiToL0
== PLAYER1 IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN
~Yoshimo... the man whom you helped to rescue his family from a bitter vendetta and to find his true love. Yet he is also a man who was once hired by Irenicus to facilitate your demise.~
END
 ++ ~Yoshimo... Your life just started anew. If you do not want to face Irenicus again, you do not have to.~ EXTERN YOSHJ TS221
 ++ ~Listen, Yoshimo. I trust you and everything, but I need to hear that you are on my side in the upcoming battle.~ EXTERN YOSHJ TS222
 ++ ~Irenicus is a mighty foe, Yoshimo. I do not know if all of us shall survive this battle. I would understand if you do not want to come with me.~ EXTERN YOSHJ TS221

CHAIN YOSHJ TS221
~Irenicus is my sworn enemy. I am eager to fight him.~
COPY_TRANS PLAYER1 33

CHAIN YOSHJ TS222
~I side with the one, whose wise council brought Kachiko back to life and granted my family eternal peace. Do not fear, <CHARNAME> my blade will not backstab you.~
COPY_TRANS PLAYER1 33

////////////
// Hell
////////////

// Kachiko
I_C_T PLAYER1 25 VPKachiHell 
== VPKACHIJ IF ~InParty("vpkachi") InMyArea("vpkachi") !StateCheck("vpkachi",CD_STATE_NOTVALID)~ ~Are we dead? I only wished I could tell Yoshimo a proper farewell.~
END