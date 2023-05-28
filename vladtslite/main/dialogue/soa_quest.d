//////////////////////////////
// Tortured Souls Main Quest
//////////////////////////////

BEGIN TTMESS // Quest Starter - Messenger
BEGIN TTNOMEAS // Captain Nomeas
BEGIN TTEMIS // Priestess Emis
BEGIN TTOTAKO // Otako - from Yoshimo family
BEGIN TTHASUNO // Hasuno - Merchant in Hashimoto House
BEGIN TTLULU
BEGIN TTNANNY
BEGIN TTOGI
BEGIN TTSASAKI
BEGIN TTMASAKI
BEGIN TTALOME
BEGIN TTNAJOKI
BEGIN TTCHDRAG
BEGIN TTKIOTSI
BEGIN TTNKLEAD
BEGIN TTHITOMI
BEGIN TTNSONS

//////////////////////////////
// Getting to Island
//////////////////////////////

CHAIN
IF ~Global("ttKachikoQuest","GLOBAL",1)~ THEN TTMESS 0
~Well, you seem like people I was asked to found. Are you Yoshimo and Kachiko?~
== TTKACHIJ ~Yes, it is us. What do you need?~
== TTMESS ~There goes a word that you need to go to Kara-Tur. I was paid to ~
= ~Look for captain Nomeas in Vulgar Monkey Tavern. He has a proposition for you.~
EXIT
// Remind to PC

// Talk with captain and sailoff

CHAIN
IF ~Global("ttTalkedToNomeas","GLOBAL",0)~ THEN TTNOMEAS ttSailoff1
~*HELLO STRING*~
DO ~SetGlobal("ttTalkedToNomeas","GLOBAL",1)~
END
 ++ ~Nomeas, I have little knowledge of the sea travel. Can you tell me how long will it take us to get to Kara-Tur by sea?~ EXTERN PPSAEM ttSailoff2

CHAIN TTNOMEAS ttSailoff2
~Half a year, may be a year... It is a long and dangerous route. Not many ships go that far away, and of those that do few return back.~
END
 ++ ~Yoshimo, Kachiko, I am sorry, but I have to haste to Imoen's rescue, her life is at stake! May be after we find Imoen I will go to Kara-Tur with you...~ EXTERN YOSHJ TS166

CHAIN YOSHJ TS166
~No! This is impossible! Eh, no, I'd rather part our ways right now.~
== TTNOMEAS ~Ahem, if I may interrupt... I think I have a solution for your problem. Recently I run into a... mmh... an arch-mage of great renown, Harkle Harpel. For a minor service, he gave me this scroll. It's called the Harpel's Fog of Fate. If I cast it, my ship will carry you to the place you destined to be in mere hours, even to Kara-Tur.~
END
 IF ~True()~ THEN EXTERN TTNOMEAS TS81
 IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN EXTERN VALYGARJ TS122
 IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN EXTERN ANOMENJ TS310
 IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN EXTERN JAHEIRAJ TS531
 IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN EXTERN KELDORJ TS252

CHAIN KELDORJ TS252
~<CHARNAME>, Harkle Harpel is no arch-mage, he belongs to a family of lunatics! For what I know of Harpels we might be turned into frogs or some such if you allow Nomeas to cast the spell! Be careful!~
END
 ++ ~Well, what's life if not one big gamble! Cast your spell, Nomeas, and if it fails I will see good old Harkle turned into a frog himself. But if it works, my friends prepare to storm Spellhold this afternoon!~ DO ~SetGlobal("ttPay_to_Nomeas","GLOBAL",1)~ EXTERN PPSAEM TS81
 ++ ~That's exactly what I heard about Harpells. Imoen is too dear to me to trust that this spell is an exception from their customary failures. We won't have any detours.~ EXTERN YOSHJ TS167

CHAIN JAHEIRAJ TS252
~<CHARNAME>, Harkle Harpel is no arch-mage, he belongs to a family of lunatics! For what I know of Harpels we might be turned into frogs or some such if you allow Nomeas to cast the spell! Be careful!~
END
 ++ ~Well, what's life if not one big gamble! Cast your spell, Nomeas, and if it fails I will see good old Harkle turned into a frog himself. But if it works, my friends prepare to storm Spellhold this afternoon!~ DO ~SetGlobal("ttPay_to_Nomeas","GLOBAL",1)~ EXTERN PPSAEM TS81
 ++ ~That's exactly what I heard about Harpells. Imoen is too dear to me to trust that this spell is an exception from their customary failures. We won't have any detours.~ EXTERN YOSHJ TS167

CHAIN ANOMENJ TS252
~<CHARNAME>, Harkle Harpel is no arch-mage, he belongs to a family of lunatics! For what I know of Harpels we might be turned into frogs or some such if you allow Nomeas to cast the spell! Be careful!~
END
 ++ ~Well, what's life if not one big gamble! Cast your spell, Nomeas, and if it fails I will see good old Harkle turned into a frog himself. But if it works, my friends prepare to storm Spellhold this afternoon!~ DO ~SetGlobal("ttPay_to_Nomeas","GLOBAL",1)~ EXTERN PPSAEM TS81
 ++ ~That's exactly what I heard about Harpells. Imoen is too dear to me to trust that this spell is an exception from their customary failures. We won't have any detours.~ EXTERN YOSHJ TS167

CHAIN VALYGARJ TS252
~<CHARNAME>, Harkle Harpel is no arch-mage, he belongs to a family of lunatics! For what I know of Harpels we might be turned into frogs or some such if you allow Nomeas to cast the spell! Be careful!~
END
 ++ ~Well, what's life if not one big gamble! Cast your spell, Nomeas, and if it fails I will see good old Harkle turned into a frog himself. But if it works, my friends prepare to storm Spellhold this afternoon!~ DO ~SetGlobal("ttPay_to_Nomeas","GLOBAL",1)~ EXTERN PPSAEM TS81
 ++ ~That's exactly what I heard about Harpells. Imoen is too dear to me to trust that this spell is an exception from their customary failures. We won't have any detours.~ EXTERN YOSHJ TS167

CHAIN TTNOMEAS TS81
~Of course, I would not part with this scroll for less then 5,000 gold.~
END
 IF ~PartyGoldGT(4999)~ THEN REPLY ~Okay, take this money, and try to do your best.~ EXTERN TTKACHIJ sailoff2
 ++ ~We will pay you... if we are to survive this spell.~ EXTERN TTNOMEAS TS0
 IF ~PartyGoldLT(5000)~ THEN REPLY ~It sounds good, but I don't have enough coin.~ EXTERN TTNOMEAS KR3
 ++ ~On the second thought, this spell seems a way suspicious to trust it. We won't have any detours.~ EXTERN YOSHJ TS167

CHAIN TTNOMEAS TS0
~That is why I would like to get my payment before I cast the spell. Sorry to say, but business is business.~
END
 IF ~PartyGoldLT(5000)~ THEN REPLY ~But I don't have enough coin.~ EXTERN TTNOMEAS KR3
 IF ~PartyGoldGT(4999)~ THEN REPLY ~Okay, take this money, and try to do your best.~ EXTERN TTKACHIJ sailoff2
 ++ ~I think you are bluffing. Imoen is too dear to me to trust this suspicious spell. We won't have any detours.~ EXTERN YOSHJ TS167


CHAIN TTNOMEAS KR3
~I am sure you have spent as much in the past and will again. Surely there be work in the city for you. Or perhaps some of your expensive goods to sell?~
= ~I'll wait for you here.~
EXIT

CHAIN
IF ~Global("ttTalkedToNomeas","GLOBAL",1)~ THEN TTNOMEAS KR5
~Hey, <CHARNAME>. It's nice to see you again. Have you gathered the required fee for me?~
END
 IF ~PartyGoldLT(5000)~ THEN REPLY ~But I don't have enough coin.~ EXTERN TTNOMEAS KR3
 IF ~PartyGoldGT(4999)~ THEN REPLY ~Okay, take this money, and try to do your best.~ EXTERN TTNOMEAS sailoff2
 ++ ~I think you are bluffing. Imoen is too dear to me to trust this suspicious spell. We won't have any detours.~ EXTERN YOSHJ TS167

CHAIN TTNOMEAS sailoff2
~With pleasure. Well, then everything is settled. Here is the scroll.~
== TTKACHIJ ~Oh, we will see Kara-Turian shores and prove that Yoshimo is innocent and restore peace between our families. I agree with you, <CHARNAME>, let the fate decide! Cast the spell, captain!~
== TTNOMEAS ~Then we are fully staffed and ready to sail. Never a fear nor worry should cross your thoughts this eve, m'<PRO_LADYLORD>. I have traveled this sea a good many times, and I foresee no troubles.~
= ~Although, I am sure, nothing untoward will happen during our crossing, best that we get underway as soon as possible. Please follow me to the docks where my ship is waiting for us.~
DO ~StartCutSceneMode()
StartCutScene("Cut41isb")~
EXIT

CHAIN YOSHJ TS167
~I understand. I wish you good luck in your dealings with Irenicus and rescuing Imoen. Farewell and do not think ill of us.~
== TTKACHIJ ~Good luck to you, <CHARNAME>. Farewell.~
DO ~~
EXIT

///////////////////////////
// Quest Main Content
///////////////////////////

// Arrival to TS Island
CHAIN
IF WEIGHT #7 ~Global("Start_Island","GLOBAL",1) Global("ttNomeasMistake","GLOBAL",0)~ THEN TTNOMEAS TS3
~Ahem... dear <SIRMAAM> we had arrived it seems...~ DO ~SetGlobal("ttNomeasMistake","GLOBAL",1)~
END
 ++ ~Where?~ EXTERN TTNOMEAS TS4

CHAIN TTNOMEAS TS4
~Uhm, that's not our destination, I am positive... Maybe it is some part of Kara-Tur. You have couple locals among your ranks they would know better than I.~
== YOSHJ ~No, I had spent several years sailing around Kara-Tur. This place reminds nothing of what I have seen and with a bay like that it would be a lively port be it in Kara-Tur. The spell went astray, I suppose... I am very sorry, <CHARNAME>.~
END
 ++ ~So we are stuck in a middle of nowhere. Damn you, Harkle Harpel and the whole mad family of yours! But we have to deal with our plight here now. I heard you are resourceful, Nomeas. Any suggestions?~ EXTERN TTNOMEAS TS5

CHAIN TTNOMEAS TS5
~We'd have to wait for the night to fall, to be able to tell our position from the stars. Meanwhile, the crew will inspect the ship and repair what we can. The journey ahead of us might be long and harsh.~
END
 ++ ~Then I suggest we go ashore and see if we can find some provisions or any clues to where we are.~ DO ~SetGlobal("ttIslandWar","GLOBAL",1)~ EXIT

CHAIN
IF WEIGHT #8 ~GlobalLT("ttKachikoSaved","GLOBAL",2) GlobalGT("ttIslandWar","GLOBAL",0)~ THEN TTNOMEAS TS6
~We need to cut more timber to repair the ship. Please, come back later.~
EXIT

// Dead Bodies
CHAIN
IF WEIGHT #6 ~Global("ttDeadBodies","GLOBAL",1)~ THEN YOSHJ TS169
~Dead bodies? Here? Must be another group stranded on this piece of land. We must step carefully.~ DO ~SetGlobal("ttDeadBodies","GLOBAL",2)~
== TTKACHIJ ~Yoshimo, does not this... man looks a bit familiar to you? It is strange but he reminds me Otako Hashimoto.~ [KACHIQ03]
== YOSHJ ~Kachiko, I can see the resemblance, but that cannot be. Otako was wearing a pendant in a shape of a crescent moon... just like this one... Oh, no! I must be dreaming! Otako...~
END
 ++ ~What? What are you both talking about? The dead man is one of your family, Yoshimo? Are you sure we are not in Kara Tur?~ EXTERN YOSHJ TS171

CHAIN YOSHJ TS171
~I am afraid he is... he was my nephew, yes. But I have no idea how he came to this place and got killed; neither do I know where this place is...~
== TTKACHIJ ~My guess is that the spell might have worked and we are somehow moving towards solving our family feud. But why are we on an island, and not at home?~
END
 ++ ~The spell... Harpel must have done something that works for once. Let's go on, and we will have better chance to find some answers. Yoshimo, I am mourn your loss.~ EXTERN YOSHJ TS172

CHAIN YOSHJ TS172
~Thank you, <CHARNAME>.~
EXIT

// Dead Bodies 2
CHAIN
IF ~Global("ttDeadBodies","GLOBAL",3)~ THEN TTKACHIJ N19
~There are more bodies out there. Do you see them? I cannot look, I am afraid to find my kin among them.~
DO ~SetGlobal("ttDeadBodies","GLOBAL",4)~
EXIT

// Talk with Otako
CHAIN
IF ~NumberOfTimesTalkedTo(0)~ THEN TTOTAKO 0
~Yoshimo-san. My great pleasure is to see you again. Uncle often said you will return to help your family and so you did.~
== YOSHJ ~Otako?! I am pleased to see you... if a bit surprised. I saw a corpse on the road, which was so very much like you, that I thought you were dead... What kind of a sick joke was that?~
== TTOTAKO ~Your father will explain the things happening around here to you better than I can. Hashimoto's stronghold is just to the east and south from here. Hurry there Yoshimo, for we need help. And you can kill the Nakanishi wench, you have captured. There is no law above us any more but the honor of Hashimoto.~
== YOSHJ ~Stand back! Kachiko is under my protection while I live! I will not allow her to be hurt by anyone as MY honor dictates me.~
== TTOTAKO ~As you wish, Yoshimo-san. But you should remember that "one must aim not to disappoint his father." Have you forgotten the teachings of our ancestors in the strange lands?~
== YOSHJ ~And you should remember that "one should aim not to hurt a reasoning being." Our ancestors were wise people and did not approve of mindless killing. I see it's indeed a time for me to talk to my father.~
== TTOTAKO ~Ha-ha-ha...(*laughs madly*)~ DO ~EscapeArea()~
== TTKACHIJ ~Yoshimo, I appreciate what you have said. Even if you said it because you were afraid that I'd kill you both if you ever tried anything funny.~ [KACHIQ04]
== YOSHJ ~Cherry blossom, I am neither afraid of you, nor do I wish to fight you. If that offends you, sorry, but I can do little to help it. <CHARNAME>, would you come with me to my family stronghold? I can feel that madness has overcome my family and they do need help...~
END
 ++ ~I'd rather go on a nature hike and observe the flora and fauna of this island. However, I can see that you are eager for a reunion, so we'll follow you.~ EXIT
 ++ ~Onward! We must investigate what's happening!~ EXIT
 ++ ~Sure, but let's explore the area first. May be we can find someone from Kachiko's family also? ~ EXIT

//////////////////////////////
// Inside Hashimoto House
//////////////////////////////

// Talk with Aino
CHAIN
IF ~NumberOfTimesTalkedTo(0) GlobalLT("ttKachikoSaved","GLOBAL",2)~ THEN TTAINO 0
~My son! Welcome. I have been waiting for you to come.~
== YOSHJ ~Father, forgive me if I am not respectful, but would you be able to explain me what is happening? Why are you on this desolate Island? Why there are so many dead bodies around?~
== TTAINO ~I will...I do not understand it well myself, Yoshimo, but I'll tell you what I know. After you fled, the hatred between Nakanishi and Hashimoto became unbearable... Nakanishi tried to accuse you of Naoko's death in order to have the emperor's wizards find you and execute you... We used all our influence to prevent it. Then they sent an assassin after you... Kachiko.~
== TTKACHIJ ~I am no assassin! And no one sent me!~ [KACHIQ08]
== TTAINO ~What else can I call you? You wanted to kill my son... Then Nakanishi and Hashimoto started picking on each other, playing dirty tricks... Practical jokes, no more at first... Then foul play... Then few serious fights... People in Kozakura started avoiding both families, as they still remember how many lives had been lost during Hojo War... We became almost outlaws.~
= ~One day a wizard came to see me. Joneleth by name. He said that he could help me to revenge Hashimotos' disgrace. I am sure he said the same to Nakanishi. His words were carefully chosen to pluck at my hatred. He raised it to a huge proportion and soon I could not control it. In my madness, I surrendered my soul to the wizard.~
= ~Next day we were all on this Island, full of hatred, full of deadly passion. Many were killed this first day. Many. But the next day they walked among us again. Thereafter, it repeats day after day... It seems to me we cannot advance time...~
== YOSHJ ~That's terrible, father. Is there a way to escape from this island?~
== TTAINO ~Yes... I believe there is a way. I believe if each Nakanishi is killed during one day, we, Hashimoto can escape the curse. And there will be a new day... free of Nakanishi. I have a wardstone, a magical wardstone that can lead us away from the Island... But only if we can advance time... This wardstone will be yours if you do it for me.~
== YOSHJ ~I do not know... It's confused. Hmm... What do you think, <CHARNAME>?~
END
 ++ ~I think I am having yet another nightmare. Nevertheless, if we have to kill all of the Nakanishi to get the wardstone, then we shall.~ EXTERN TTKACHIJ N29
 ++ ~Do you know of any other way, Aino? I have no desire to kill scores of innocent people.~ EXTERN TTAINO 6
 ++ ~I say we kill this scheming bastard, take the wardstone and get outta here.~ EXTERN YOSHJ TS181

CHAIN TTAINO 6
~I do not know. But try to talk to Najoki, Kachiko's mother. She is a priestess and a mage of great power, she might know of something...~
END
 ++ ~No, talking is boring. If we have to kill all of the Nakanishi to get the wardstone, then we shall.~ EXTERN TTKACHIJ N29
 ++ ~I say we kill YOU, take the wardstone and get outta here. ~ EXTERN YOSHJ TS181
 ++ ~We shall talk to Najoki then.~ EXIT

CHAIN TTKACHIJ N29
~I am Nakanishi. Will you kill me as well?~
END
 ++ ~Do you know of any other way, Aino? I have no desire to kill scores of innocent people.~ EXTERN TTAINO 6
 ++ ~No, Kachiko, you are right. I say we kill this scheming bastard instead, take the wardstone and get outta here.~ EXTERN YOSHJ TS181
 ++ ~Sorry, Kachiko, I see no other choice. I really need this wardstone!~ EXTERN YOSHJ TS181

CHAIN YOSHJ TS181
~That I cannot allow.~
== TTKACHIJ ~Neither would I. Yoshimo, I love you, and if we are destined to die, then we will die together!~ DO ~SetGlobal("ttKachikoHostile","GLOBAL",1)~
== YOSHJ ~I love you my brave Kachiko! How could I ever trust a foreigner?~
== TTAINO ~Well spoken, daughter! Attack the foreigners!~
DO ~SetGlobal("ttMyHomeAttacked","GLOBAL",1)
SetGlobal("ttHashimotoAttacked","LOCALS",1)
SetGlobal("ttEvilPath","GLOBAL",1)
Enemy()~
EXIT
 
CHAIN
IF ~NumTimesTalkedToGT(0) GlobalLT("ttKachikoSaved","GLOBAL",2)~ THEN TTAINO 8
~Please hurry... we don't have much time.~
EXIT

// Hasuno - Priest/Merchant
CHAIN
IF ~Name("Yoshimo",LastTalkedToBy)~ THEN TTHASUNO 0
~Yoshimo-san, do you require my healing potions?~
END
 ++ ~Yes, show me your wares.~ DO ~StartStore("tthasuno",LastTalkedToBy)~
 ++ ~No, thank you.~ EXIT

CHAIN
IF ~!Name("Yoshimo",LastTalkedToBy)~ THEN TTHASUNO 1
~Good day to you. Do you require my healing potions?~
END
 ++ ~Yes, show me your wares.~ DO ~StartStore("tthasuno",LastTalkedToBy)~
 ++ ~No, thank you.~ EXIT


// Lulu - Child
CHAIN
IF ~Name("Yoshimo",LastTalkedToBy)~ THEN TTLULU 0
~Yoshimo-san, I'm happy you've returned home.~
EXIT

CHAIN
IF ~!Name("Yoshimo",LastTalkedToBy)~ THEN TTLULU 1
~Greetings to you. I am Lulu. I am always pleased to meet one of my brother's associates.~
EXIT


// Nanny
CHAIN
IF ~NumberOfTimesTalkedTo(0)
See("Yoshimo")~ THEN TTNANNY 0
~Yoshimo-san, I am glad to see you're healthy and in a good state.~
== YOSHJ ~Nanny, how are you?~
== TTNANNY ~Thank you, Yoshimo-san. You know I have been worried about you, and now I feel much better when you are at home with your family. No need to tell you where is your room, I am sure. Your friends may rest there as well.~
EXIT

CHAIN
IF ~NumberOfTimesTalkedTo(0)
OR(2)
!InPartySlot(LastTalkedToBy,0)
!Name("Yoshimo",LastTalkedToBy)~ THEN TTNANNY 3
~Greetings to you. Have a nice day.~
EXIT

CHAIN 
IF ~!NumberOfTimesTalkedTo(0)~ THEN TTNANNY 2
~I hope everything is alright. Have a nice day.~
EXIT

// Ogi - Child
CHAIN
IF ~Name("Yoshimo",LastTalkedToBy)~ THEN TTOGI 0
~Yoshimo-san, I want to be an adventurer like you.~
EXIT

CHAIN
IF ~OR(2)
!InPartySlot(LastTalkedToBy,0)
!Name("Yoshimo",LastTalkedToBy)~ THEN TTOGI 1
~Greetings to you. I am Ogi. When I grow up big, I'll be a famous kensai.~
EXIT

// Sasaki - Sister
CHAIN
IF ~Name("Yoshimo",LastTalkedToBy)~ THEN TTSASAKI 0
~Yoshimo-san, I am glad to see you.~
EXIT

CHAIN
IF ~!Name("Yoshimo",LastTalkedToBy)~ THEN TTSASAKI 1
~Greetings to you. I am Sasaki. I am always pleased to meet one of my brother's associates.~
EXIT

///////////////////////////
// Outside of Compound
///////////////////////////

// Masaki Near the Nakanishi Dungeon
CHAIN
IF ~Global("ttMasakiMeet","GLOBAL",0)~ THEN TTMASAKI 0
~Kachiko! You have returned and brought the fugitive Yoshimo back. Well done, the spirit of true kensai and true Nakanishi is in you, girl. I am happy to be the first to greet you upon your return.~ DO ~SetGlobal("ttMasakiMeet","GLOBAL",1)~
== TTKACHIJ ~I am surprised by your welcome, my cousin, after all those lies you told my parents to prevent me from going after Yoshimo.~ [KACHIQ05]
== TTMASAKI ~I had been young and foolish and did not want beautiful Kachiko to wonder far away from those who love her. But your deed honors our family. I would see that you have the privilege of executing the murderer.~
== TTKACHIJ ~Hold, Masaki, you are too hasty. Yoshimo is no murderer and we were going home so the proof of his innocence may be found. But now I meet you on this desolate Island, talking to me as if we are at home...~
== TTMASAKI ~We are at home, my dearest Kachiko, and the better home it is. No silly law is above us here and you do not have to go through the pains of trial and shifty advocates to accuse Yoshimo. Nor can he run. We, Nakanishi ourselves will exact punishment on him for killing our beloved brother, Naoko.~
== TTKACHIJ ~I mourn Naoko. Yet your words scare me. What is this place? How did Hashimoto and Nakanishi come to be here? Answer me!~
== TTMASAKI ~All in good time. First, let us get rid of this Hashimoto scum...~
== TTKACHIJ ~Yoshimo is innocent and I will fight you if I must to protect justice, which you so eagerly discard! You are disgrace to Nakanishi's honor!~ [KACHIQ06]
== TTMASAKI ~No, my dear - I defend Nakanishi's honor. It is you who disgrace your family, consorting with the enemy in the time of dire need. Us, Nakanishi shall stand together against evil Hashimoto clan. Did you forget your duty completely in the foreign parts? Kill him and leave the side of these outlandish mercenaries. No earlier than that will the gates of our house be open for you.~
== TTMASAKI ~Does Masaki Hayashi speak for Nakanishi family now?~
== TTKACHIJ ~That I do, my sweet cousin. You shall bend to my will or we shall treat you as a Hashimoto's consort. You are Nakanishi no more.~
== TTMASAKI ~I doubt that you find it in your black heart to tell my mother that Kachiko is praying to see her and plead her case...~
= ~Fool girl! You have been seen entering and leaving Hashimoto's compound. Do you dare to deny it?~
== TTKACHIJ ~I go where I please. I refuse to see people as enemies because they are named Hashimoto.~ [KACHIQ07]
== TTMASAKI ~I see. These foreigners have brainwashed you. But we are going to return you to your proper place in the family.~
DO ~SetGlobal("ttKachikoKidnapped","GLOBAL",1)
StartCutSceneMode()
StartCutScene("ttcutk01")~
EXIT

// Kachiko Kidnapped
CHAIN
IF WEIGHT #7 ~Global("ttKachikoKidnapped","GLOBAL",1)~ THEN YOSHJ TS177
~No! Kachiko... No! I will kill them all! If they harm her in any way, I swear I will kill them all!~
DO ~SetGlobal("ttKachikoKidnapped","GLOBAL",2)
RealSetGlobalTimer("ttNKensaiSpawn","GLOBAL",10)~
EXIT

// Talk with Alome
CHAIN
IF ~NumberOfTimesTalkedTo(0) See("Yoshimo")~ THEN TTALOME 0
~Yoshimo, Yoshimo!~
== YOSHJ ~Leave me be, child! Did not they tell you that Hashimoto eat little girls like you?~
== TTALOME ~No... Do you?~
== YOSHJ ~Brave little one... No, I do not. I just need to talk with your uncle Hayashi and I am angry that I cannot find him. Do you know where he is?~
== TTALOME ~They all went to play hide and seek in the caves. They did not take you too? They always say I am too small, but you look big enough. Why won't they let you play?~
== YOSHJ ~Do you know where these caves are?~
== TTALOME ~I do not know where the caves are... But my mummy she'd know. She sent me to go ask you to come see her if you want to save Kachiko from bad fate. Who is Kachiko?~
== YOSHJ ~A very nice girl, just like you...~
== TTALOME ~If she is nice, how can bad fate get her? Mummy says that bad fate grabs only bad people.~
== YOSHJ ~Kachiko is near very bad people now. The bad fate might accidentally miss and grab her. And you do not want that to happen, do you?~
== TTALOME ~I guess, no. Mummy asked me to give you this rope, and said that you must be very quiet....~
DO ~GiveItemCreate("ttrope",Player1,0,0,0) EscapeArea()~
EXIT

//////////////////////////////////
// Inside the Nakanishi Dungeon
//////////////////////////////////

// Talk with Najoki
CHAIN
IF ~NumberOfTimesTalkedTo(0) GlobalLT("ttKachikoSaved","GLOBAL",2)~ THEN TTNAJOKI 0
~So I meet Yoshimo Hashimoto...~
== YOSHJ ~Najoki-san, I have heard that you are wise and noble woman. Do the rumors err? Why is the lunatic Hayashi ruining your lives, why is he allowed to kidnap your daughter?~
== TTNAJOKI ~Wise and noble...but a woman. Since years uncounted Nakanishi respected their women, allowed them to have a say in every matter, and valued their opinion. Not anymore, Yoshimo. Masaki has driven my husband into madness and he preaches traditional values. Kachiko was sworn to him long ago... for her return was foreseen. So he has every right in the eyes of my husband to do with Kachiko what he wishes...~
== YOSHJ ~What! I beg you to have pity on me! Please, Najoki-san, please... where is Kachiko? I will hurt none of your family, I will just take her away from this terrible man... Surely you do not want Masaki to wed your daughter?~
== TTNAJOKI ~No I do not. I need you to answer one question, Yoshimo. Just one, but it has to be an answer you know to be the absolute truth. Look to very bottom of your soul Yoshimo and tell me if the love of my daughter Kachiko is stronger in you than your hatred of Masaki?~
== YOSHJ ~Yes, Najoki-san.~
== TTNAJOKI ~Good. That's good. Masaki and his followers are hiding in the dungeon on the northern part of this Island. They are preparing for a ceremony, which will transfer the curse to Kachiko and make her one of us... Do not ask what I mean, for we have no time for long tales. Just know that you'd lose Kachiko forever if they would succeed. Part of the ceremony is to keep a person dead for a day. But if you resurrect the person before the time is over, curse would not take effect. Here is the scroll. They will guard Kachiko closely and it is not likely that you will get to her without battle... Do what you must, but get to Kachiko and resurrect her... It's good you have your friends with you; I do not think a single man would be able to accomplish this...~
== YOSHJ ~My friends... Uhm... Najoki-san, I do not command my friends... I need to ask <CHARNAME> if they'd help me... <CHARNAME>?~
END
 ++ ~Yoshimo, your father said that the only way for everyone to be freed of the curse is to kill one of the families during a single day. Every person...~ EXTERN TTNAJOKI 4
 ++ ~I am with you, Yoshimo! We have to save Kachiko! Let's go!~ DO ~GiveItemCreate("SCRL63",Player1,0,0,0)~ EXIT
 ++ ~I am not sure... Najoki, would you give me any practical help, like giving us directions back to civilization if I go save your daughter?~ EXTERN TTNAJOKI 7

CHAIN TTNAJOKI 4
~Your father is an intelligent man, Yoshimo. Trust me, I meditated on this solution also... But I do not believe that it is a true solution. I believe it is a part of the curse itself... It gives a new edge to our hatred every day, for we hope endlessly that it is TODAY that we will kill each and every person from another family and thus WE will be saved. Hatred and death will not break the curse...~
END
 ++ ~What will?~ EXTERN TTNAJOKI 5

CHAIN TTNAJOKI 5
~Love and devotion. Perhaps, it sounds banal, but unfortunately humankind hasn't still realized that.~
END
 ++ ~What?~ EXTERN TTNAJOKI 6
 ++ ~There is certain logic in your words Najoki. We will save your daughter and then we will see what happens. But I do not like the site of a fighting man blushing like a schoolgirl. So we better go.~ DO ~GiveItemCreate("SCRL63",Player1,0,0,0)~ EXIT
 ++ ~I am not sure... Najoki, would you give me any practical help, like giving us directions back to civilization if I go save your daughter?~ EXTERN TTNAJOKI 7

CHAIN TTNAJOKI 6
~You do not know what love is? Love is strong and it can defeat both hatred and fate.~
== VICONIJ IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~Love is for weak-hearted rivvins...~
== KELDORJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~Love of God is a higher calling, then an earthly passion, but still there is a measure of truth in your words, Najoki...~
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~Re yer gonna stop greasing the floor with yer mumbo-jumbo, stupid woman?~
== AERIEJ IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~How... how romantic...~
== TTNAJOKI ~I have a hope that if Hashimoto pledges his heart to Nakanishi, despite everything, the curse will be broken...~
END
 ++ ~Could you be more specific?~ EXTERN TTNAJOKI 7

CHAIN TTNAJOKI 7
~If you will help Yoshimo to save my daughter I will give you a map... The wizard who cursed us gave it to me as a cruel joke. The map shows the Shiny Gate, the magical portal, which would teleport you wherever you wish to go... We spent years trying to build a seaworthy ship... but none would float. The wizard gave us yet another false hope and another torture for our souls... I will give you the map if you save my daughter.~
END
 ++ ~That's a suitable reward. Deal, we will help Yoshimo.~ DO ~GiveItemCreate("SCRL63",Player1,0,0,0)~ EXIT
 ++ ~Why give... Do not tire yourself so, Najoki. I will take it from you myself!~ DO ~SetGlobal("ttEvilPath","GLOBAL",2) Enemy()~ EXIT

CHAIN
IF ~NumTimesTalkedToGT(0) GlobalLT("ttKachikoSaved","GLOBAL",2)~ THEN TTNAJOKI 8
~Please hurry... my daughter's life hangs in the balance.~
END
 IF ~PartyHasItem("SCRL63")~ THEN EXIT
 IF ~!PartyHasItem("SCRL63")~ THEN DO ~GiveItemCreate("SCRL63",Player1,0,0,0)~ EXIT

// Dungeon Entrance - Second meet with Masaki
CHAIN
IF ~Global("ttKachikoKidnapped","GLOBAL",3)
Global("ttAlomeMeet","GLOBAL",1)~ THEN TTMASAKI 10
~You are stupid enough to come here? Do not you know that Nakanishi hold the dungeon now?~
END
 IF ~Global("ttKachikoHostile","GLOBAL",0) Global("ttEvilPath","GLOBAL",0)~ THEN DO ~SetGlobal("ttKachikoKidnapped","GLOBAL",4)~ EXTERN YOSHJ TS193
 IF ~OR(2) Global("ttKachikoHostile","GLOBAL",1) Global("ttEvilPath","GLOBAL",2)~ THEN DO ~SetGlobal("ttKachikoKidnapped","GLOBAL",4)~ EXTERN YOSHJ TS194

CHAIN YOSHJ TS193
~I do not care but for one Nakanishi. Release Kachiko, and we will be gone... You are laughing... well, we shall see who will be the last one to laugh!~
EXTERN TTMASAKI 11

CHAIN YOSHJ TS194
~My friend and I come to do my father's bidding. Nakanishi shall be no more before the dawn breaks... You are laughing... well, we shall see who will be the last one to laugh!~
EXTERN TTMASAKI 11

CHAIN TTMASAKI 11
~Fool! Pathetic fool! For Nakanishi's honor we shall strike you and the foreigners you aligned yourself with!~
DO ~ForceSpell(Myself,DRYAD_TELEPORT)~
EXIT

// Dungeon Entrance - NPC Remark about the dungeon
CHAIN
IF ~Global("ttNPCRemark","GLOBAL",1)~ THEN MINSCJ TS241
~Boo senses evil in every crack. Ooo! Major butt-kicking is coming!~
DO ~SetGlobal("ttNPCRemark","GLOBAL",2)~
EXIT

CHAIN
IF ~Global("ttNPCRemark","GLOBAL",1)~ THEN JAHEIRAJ TS532
~Unnatural creatures, unnatural place. What a dread to be here. Yet there seem to be some awkward balance in Nakanishi and Hashimoto's war. <CHARNAME> your command to come here was one of the many leadership errors.~
DO ~SetGlobal("ttNPCRemark","GLOBAL",2)~
EXIT

// Lair on the First Floor of the Caves - Chromatic Dragon
CHAIN
IF ~NumTimesTalkedTo(0)~ THEN TTCHDRAG 0
~It seems to me the Child of Bhaal is intensively looking for his true death... If you are going to live a little bit longer, you must defeat me... (*sadistic laugh*)~
= ~Don't panick. I'm just kidding...(*laughs again*). Now, get out of my sight.~
EXIT

CHAIN
IF ~NumTimesTalkedToGT(0)~ THEN TTCHDRAG 1
~I see you're really annoying person. So be it...~
DO ~Enemy()~
EXIT

// Dungeon: Second Floor - Third meet with Masaki
CHAIN
IF ~Global("ttKachikoKidnapped","GLOBAL",4)~ THEN TTMASAKI 12
~Doing your best to stay alive? Let me tell you that it is not good enough! You cannot resist Nakanishi for much longer! For Nakanishi's honor!~ DO ~SetGlobal("ttKachikoKidnapped","GLOBAL",5)~
== YOSHJ ~You! Stay here and fight! I am getting tired of you talking!~
== TTMASAKI ~Me? Fight scum like you? Ha-ha-ha...~
DO ~ForceSpell(Myself,DRYAD_TELEPORT)~
EXIT

// Dungeon: Second Floor - Kiotsi
CHAIN
IF ~True()~ THEN TTKIOTSI 0
~I see it's my job to finish you off? Wonderful! I was looking forward to it!~
DO ~Enemy()~
EXIT

// Dungeon: Second Floor - Undead Kensai Leader
CHAIN
IF ~Global("ttSamuraiMeeting","GLOBAL",0)~ THEN TTNKLEAD 0
~Foul heathen! You dare to disturb my meeting on consecrated ground! My guests will not tolerate interruptions! You shall pay for this blasphemy!~
DO ~SetGlobal("ttSamuraiMeeting","GLOBAL",1) Enemy()~
EXIT

// Dungeon: The Crypt - Last meet with Masaki
CHAIN
IF ~Global("ttKachikoKidnapped","GLOBAL",5)~ THEN TTMASAKI 14
~I see, that I would have to finish you off...short of doing it yourself, you would never get it done... Defend yourself! For Nakanishi's honor!~
DO ~SetGlobal("ttKachikoKidnapped","GLOBAL",6) Enemy()~
EXIT

// Dungeon: The Crypt - Hasuno
CHAIN
IF ~See("Yoshimo") Global("ttHitomiMeet","GLOBAL",0)~ THEN TTHITOMI 0
~You have come for my daughter, Yoshimo Hashimoto...~
END
 IF ~!Dead("ttnajoki") !Global("ttEvilPath","GLOBAL",2)~ THEN REPLY ~Sir, I am afraid we have terrible misunderstanding here... See, your wife suggested that if Yoshimo is allowed to speak to Kachiko, all of us, Nakanishi, and Hashimoto... we can get away...~ DO ~SetGlobal("ttHitomiMeet","GLOBAL",1)~ EXTERN TTHITOMI 1
 ++ ~I did not come here to talk. I do Hashimoto's bidding, which is to end your sorry lives!~ DO ~SetGlobal("ttHitomiMeet","GLOBAL",1)~ EXTERN TTHITOMI 3

CHAIN TTHITOMI 1
~You are young and naive. My wife's words are those of a weak woman.~
== YOSHJ ~Are you so eager to battle us? We are strong...~
== TTHITOMI ~I am tired of hectic bloodshed. No, if we are to fight we shall fight as honorable ancestors taught us. Choose a champion amongst yourselves and let him fight my sons in one on one combat.~
== YOSHJ ~<CHARNAME>, I should warn you that in such a combat only two weapons are allowed: a noble katana and your hand, and no armor is to cover the fighter's body. And no one is permitted to leave the fighting arena until the fight is over... I am ready and willing to answer the challenge, but it's your decision who shall fight.~
END
 IF ~InParty(Player2) See(Player2) !StateCheck(Player2,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER2> would represent us.~ DO ~StartCutSceneMode() StartCutScene("ttcutf02")~ EXIT
 IF ~InParty(Player3) See(Player3) !StateCheck(Player3,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER3> shall face him now.~ DO ~StartCutSceneMode() StartCutScene("ttcutf03")~ EXIT
 IF ~InParty(Player4) See(Player4) !StateCheck(Player4,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER4> is ready to answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf04")~ EXIT
 IF ~InParty(Player5) See(Player5) !StateCheck(Player5,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER5> shall be our champion.~ DO ~StartCutSceneMode() StartCutScene("ttcutf05")~ EXIT
 IF ~See(Player1) !StateCheck(Player1,CD_STATE_NOTVALID)~ THEN REPLY ~I, myself, shall answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf01")~ EXIT
 IF ~InParty(Player6) See(Player6) !StateCheck(Player6,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER6>, go ahead.~ DO ~StartCutSceneMode() StartCutScene("ttcutf06")~ EXIT

CHAIN TTHITOMI 3
~I am tired of hectic bloodshed. No, if we are to fight we shall fight as honorable ancestors taught us. Choose a champion amongst yourselves and let him fight my sons in one on one combat.~
== YOSHJ ~<CHARNAME>, I should warn you that in such a combat only two weapons are allowed: a noble katana and your hand, and no armor is to cover the fighter's body. And no one is permitted to leave the fighting arena until the fight is over... I am ready and willing to answer the challenge, but it's your decision who shall fight.~
END
 IF ~InParty(Player2) See(Player2) !StateCheck(Player2,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER2> would represent us.~ DO ~StartCutSceneMode() StartCutScene("ttcutf02")~ EXIT
 IF ~InParty(Player3) See(Player3) !StateCheck(Player3,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER3> shall face him now.~ DO ~StartCutSceneMode() StartCutScene("ttcutf03")~ EXIT
 IF ~InParty(Player4) See(Player4) !StateCheck(Player4,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER4> is ready to answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf04")~ EXIT
 IF ~InParty(Player5) See(Player5) !StateCheck(Player5,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER5> shall be our champion.~ DO ~StartCutSceneMode() StartCutScene("ttcutf05")~ EXIT
 IF ~See(Player1) !StateCheck(Player1,CD_STATE_NOTVALID)~ THEN REPLY ~I, myself, shall answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf01")~ EXIT
 IF ~InParty(Player6) See(Player6) !StateCheck(Player6,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER6>, go ahead.~ DO ~StartCutSceneMode() StartCutScene("ttcutf06")~ EXIT

CHAIN
IF ~Global("ttPlayerVsMichio","GLOBAL",0) Global("ttPlayerVsMomoko","GLOBAL",3) Global("ttNakanishiDuel","GLOBAL",0)~ THEN TTHITOMI 4
~I see that Momoko proved the weaker... Who should stand against my elder son, Michio?~
END
 IF ~!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN REPLY ~I, myself, shall answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf11")~ EXIT
 IF ~InParty(Player2) !StateCheck(Player2,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER2> would represent us.~ DO ~StartCutSceneMode() StartCutScene("ttcutf12")~ EXIT
 IF ~InParty(Player3) !StateCheck(Player3,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER3> shall face him now.~ DO ~StartCutSceneMode() StartCutScene("ttcutf13")~ EXIT
 IF ~InParty(Player4) !StateCheck(Player4,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER4> is ready to answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf14")~ EXIT
 IF ~InParty(Player5) !StateCheck(Player5,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER5> shall be our champion.~ DO ~StartCutSceneMode() StartCutScene("ttcutf15")~ EXIT
 IF ~InParty(Player6) !StateCheck(Player6,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER6>, go ahead.~ DO ~StartCutSceneMode() StartCutScene("ttcutf16")~ EXIT
 ++ ~I think we need a short break.~ EXIT

CHAIN IF ~Global("ttPlayerVsMichio","GLOBAL",0) Global("ttPlayerVsMomoko","GLOBAL",2) Global("ttNakanishiDuel","GLOBAL",0)~ THEN TTHITOMI 5
~The battle is over. Momoko stands undefeated. Is there another who would try their skill against my son?~
END
 IF ~InParty(Player2) See(Player2) !StateCheck(Player2,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER2> would represent us.~ DO ~StartCutSceneMode() StartCutScene("ttcutf02")~ EXIT
 IF ~InParty(Player3) See(Player3) !StateCheck(Player3,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER3> shall face him now.~ DO ~StartCutSceneMode() StartCutScene("ttcutf03")~ EXIT
 IF ~InParty(Player4) See(Player4) !StateCheck(Player4,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER4> is ready to answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf04")~ EXIT
 IF ~InParty(Player5) See(Player5) !StateCheck(Player5,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER5> shall be our champion.~ DO ~StartCutSceneMode() StartCutScene("ttcutf05")~ EXIT
 IF ~See(Player1) !StateCheck(Player1,CD_STATE_NOTVALID)~ THEN REPLY ~I, myself, shall answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf01")~ EXIT
 IF ~InParty(Player6) See(Player6) !StateCheck(Player6,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER6>, go ahead.~ DO ~StartCutSceneMode() StartCutScene("ttcutf06")~ EXIT
 ++ ~No, I think we will cut our losses this day. ~ EXTERN TTHITOMI 9
 ++ ~I think we need a short break.~ EXIT

CHAIN IF ~Global("ttPlayerVsMichio","GLOBAL",3) Global("ttPlayerVsMomoko","GLOBAL",3) Global("ttNakanishiDuel","GLOBAL",0)~ THEN TTHITOMI 6
~I stand alone now between you and my daughter. She is still alive. I sense the presence of her soul...~
END
 IF ~CheckStatGT(LastTalkedToBy(Myself),14,WIS) !Global("ttEvilPath","GLOBAL",2)~ THEN REPLY ~Hitomi, please, trust what your wife said. May be her words are true? May be it is our only chance? Besides, we can always fight after we try to bring Kachiko back to life. ~ EXTERN TTHITOMI 11
 ++ ~Nothing will stand in my way! Be prepared to cower and flee!~ EXTERN TTHITOMI 12
 ++ ~Do you still want to fight against us?~ EXTERN TTHITOMI 13

CHAIN IF ~Global("ttPlayerVsMichio","GLOBAL",2) Global("ttPlayerVsMomoko","GLOBAL",3) Global("ttNakanishiDuel","GLOBAL",0)~ THEN TTHITOMI 7
~The battle is over. Michio stands undefeated. Is there another who would try their skill against my elder son?~
END
 IF ~!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN REPLY ~I, myself, shall answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf11")~ EXIT
 IF ~InParty(Player2) !StateCheck(Player2,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER2> would represent us.~ DO ~StartCutSceneMode() StartCutScene("ttcutf12")~ EXIT
 IF ~InParty(Player3) !StateCheck(Player3,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER3> shall face him now.~ DO ~StartCutSceneMode() StartCutScene("ttcutf13")~ EXIT
 IF ~InParty(Player4) !StateCheck(Player4,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER4> is ready to answer your challenge.~ DO ~StartCutSceneMode() StartCutScene("ttcutf14")~ EXIT
 IF ~InParty(Player5) !StateCheck(Player5,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER5> shall be our champion.~ DO ~StartCutSceneMode() StartCutScene("ttcutf15")~ EXIT
 IF ~InParty(Player6) !StateCheck(Player6,CD_STATE_NOTVALID)~ THEN REPLY ~<PLAYER6>, go ahead.~ DO ~StartCutSceneMode() StartCutScene("ttcutf16")~ EXIT
 ++ ~No, I'm not ready yet.~ EXIT
 ++ ~No, I think we will cut our losses this day. ~ EXTERN TTHITOMI 9

CHAIN
IF ~Global("ttNakanishiDuel","GLOBAL",1)~ THEN TTHITOMI 8
~Don't bother me until the battle is finished.~
EXIT

CHAIN TTHITOMI 9
~I assume you would not honor our ancient custom and commit a ritual suicide?~
END
 ++ ~My custom condemns suicide as a sin. I shall fight and die with honor in battle if I am not to win!~ EXTERN TTHITOMI 10

CHAIN TTHITOMI 10
~I shall honor your custom, as you just have honored mine in agreeing to the duel. So be it, let's fight to death.~
DO ~SetGlobal("ttHitomiAttacked","GLOBAL",1)~
EXIT

CHAIN TTHITOMI 11
~Maybe Najoki is right... I can see that you are stronger than me, and I shall not dishonor myself anymore. I love my daughter, but I can do nothing to save her. I am a dead man. My soul cannot find a place outside this damned island. And I have no choice but to trust you... Possibly, you are my last chance... Here is my wardstone. Take it, save my daughter, and find your way outside the island. Now, I beg you to stand back and let me commit my last ritual suicide... Last... (*you don't know why but you feel a great sorrow about this man when you see he smiles*)~
DO ~GiveItem("ttwardex",Player1) StartCutSceneMode() StartCutScene("ttcuthit")~
EXIT

CHAIN TTHITOMI 12
~So be it, let's fight to your death.~
DO ~SetGlobal("ttHitomiAttacked","GLOBAL",1)~
EXIT

CHAIN TTHITOMI 13
~I can see that you are stronger than me, and I shall not dishonor myself by loosing a battle to a foreigner. Now, I beg you to stand back and let me commit a ritual suicide.~
END
 ++ ~My custom condemns suicide as a sin. Fight and die with honor in battle!~ EXTERN TTHITOMI 14
 ++ ~*You step back and keep quiet while Hitomi commits harakiri*~ DO ~StartCutSceneMode() StartCutScene("ttcuthit")~ EXIT

CHAIN TTHITOMI 14
~I shall honor your custom, as you just have honored mine in agreeing to the duels. So be it, let's fight to your death.~
DO ~SetGlobal("ttHitomiAttacked","GLOBAL",1)~
EXIT

CHAIN
IF ~!See("Yoshimo") Global("ttHitomiMeet","GLOBAL",0)~ THEN TTHITOMI 15
~Until you bring Yoshimo Hashimoto to me, I have nothing to say to you.~
EXIT

// Dungeon: The Crypt - Hasuno Sons
CHAIN
IF ~True()~ THEN VPSONS 0
~I have no desire to speak with you.~
EXIT

// Dungeon: The Crypt - Kachiko Ressurection
CHAIN
IF WEIGHT #1 ~Global("ttKachikoReborn","GLOBAL",1)~ THEN TTKACHIP 9
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

/////////////////////////
// After the Dungeon
/////////////////////////

// Island Shore - Aino and Najoki - Good Ending
CHAIN
IF ~Global("ttKachikoSaved","GLOBAL",2)~ THEN TTNAJOKI 9
~Let fate smile at you, brave stranger, for you have freed the doomed from their eternal torture.~
== TTAINO ~Our souls were accepted by our gods and we all now rest in peace... Nakanishi and Hashimoto alike. Here is the map, stranger, let the winds and the waves be kind to you and your passage be swift.~ DO ~GiveItem("ttwardti",Player1)~
= ~My son, I am proud of you and you had shown wisdom and strength beyond your years. Your father bows to you with respect.~
== TTNAJOKI ~Kachiko and Yoshimo, each of you is now the only surviving member of your family. We paid dearly for our hatred, but now it's no more. Love defeated death. Both Nakanishi and Hashimoto shall continue in your children. Bless you my daughter and fare thee well... Yoshimo, take a good care of her.~
DO ~GiveItem("ttcharts",Player1)
SetGlobal("ttEndIsland","GLOBAL",1)
ActionOverride("ttnajoka",ForceSpell(Myself,DRYAD_TELEPORT))
ActionOverride("ttainoa",ForceSpell(Myself,DRYAD_TELEPORT))~
EXIT

// Island Shore - Aino - Bad Ending
CHAIN
IF ~OR(2)
Global("ttKachikoSaved","GLOBAL",3)
Global("ttEvilPath","GLOBAL",2)~ THEN TTAINO 11
~My son, your friends and you fought valiantly and I am grateful. Unfortunately, the curse is not lifted, and we will wake up tomorrow to battle Nakanishi once more. They have Kachiko back with them now, but I have no heart to pull you into this madness. Here is the wardstone, which will let you to get away. Run, my son and run swiftly... Farewell.~ DO ~GiveItem("ttwardti",Player1)~
== YOSHJ ~Father, I do not wish to leave without you.~
== TTAINO ~You do not understand. I cannot leave. None of us can leave. We are all dead, long dead. Flee, my son, as you had done once, save your soul untouched by hatred and treachery!~
== YOSHJ ~I am afraid it's too late. Kachiko is dead and she was my only reason to be unstained by treachery...~
END
 ++ ~What are you talking about, Yoshimo?~ EXTERN YOSHJ TS204

CHAIN YOSHJ TS204
~Nothing, <CHARNAME>. You were right, we should not have come here. Now, let's go rescue your friend.~
DO ~SetGlobal("ttEndIsland","GLOBAL",1)
SetGlobal("ttEvilPath","GLOBAL",3)
ActionOverride("ttainoa",ForceSpell(Myself,DRYAD_TELEPORT))
ChangeAlignment(Myself,CHAOTIC_EVIL)~
EXIT

// Island Shore - Talk with Captain
CHAIN
IF WEIGHT #9 ~Global("ttOnIsland","GLOBAL",1) Global("ttEndIsland","GLOBAL",2)~ THEN TTNOMEAS TS29
~The good news is that the ship is ready to sail. The bad news is that we are far to the south from Athkatla, and I am not sure if we will see Amn's shores again.~
= ~I have no knowledge of these waters and I am reluctant to start out without more information... What is your command, my <PRO_LADYLORD>?~
END
 ++ ~Well, I'd trade you my good news! I got a map, showing a magical portal, which can teleport our ship back to our lands, and a wardstone, which makes possible to restore our time-space continuum.~ DO ~SetGlobal("ttEndIsland","GLOBAL",3)~ EXTERN TTNOMEAS TS30

CHAIN TTNOMEAS TS30
~Magical portal? Time wardstone? Sounds just as good as the Fog of Fate spell... Let me see the sea charts you get...~
= ~Hmm, looks like it was made with skill. I have a feeling it's genuine.~
= ~I suggest that we go to Athkatla and then sail further in a more traditional way, because the area miles around the city is heavily warded against magical travels... Rig up, crew!~
DO ~StartCutSceneMode()
StartCutScene("ttend")~
EXIT