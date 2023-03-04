/////////////////////////////////////
// Kachiko Banters with Party - ToB
/////////////////////////////////////

//Lovetalks ToB

CHAIN
IF ~Global("VP_KachikoRomanceTOB","GLOBAL",2)~ THEN VPKACH2B YoshiKachiLoveTalk1TOB
@0
== VPYOSH2B @1
== VPKACH2B @2
== VPYOSH2B @3
== VPKACH2B @4
EXIT

CHAIN
IF ~Global("VP_KachikoRomanceTOB","GLOBAL",4)~ THEN VPKACH2B YoshiKachiLoveTalk2TOB
@5
== VPYOSH2B @6
== VPKACH2B @7
== VPYOSH2B @8
== VPKACH2B @9
== VPYOSH2B @10
== VPKACH2B @11
== VPYOSH2B @12
== VPKACH2B @13
EXIT

CHAIN
IF ~Global("VP_KachikoRomanceTOB","GLOBAL",6)~ THEN VPKACH2B YoshiKachiLoveTalk3TOB
@14
== VPYOSH2B @15
== VPKACH2B @16
== VPYOSH2B @17
== VPKACH2B @18
== VPYOSH2B @19
== VPKACH2B @20
== VPYOSH2B @21
== VPKACH2B @22
EXIT

//Valygar Romance

/*
CHAIN
IF ~InParty("vpkachi")
See("vpkachi")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("vpkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPKachiValygar1TOB","GLOBAL",0)~ THEN BVALYG25 KachiValygarTalk1TOB
~Is that true? You two are getting married?~
DO ~SetGlobal("VPKachiValygar1TOB","GLOBAL",1)~
== VPKACH2B ~Eventually. Well, will you come?~
== BVALYG25 ~My congratulations! Of course I will.~
== VPKACH2B ~And you will bring <CHARNAME> along?~
== BVALYG25 ~Ahem... Aren't you going to invite <CHARNAME>?~
== VPKACH2B ~(*Smiles*)~
== BVALYG25 ~Kachiko?~
== VPKACH2B ~Valygar, of course! You know well enough that Yoshimo's soul was redeemed with her help and we cannot imagine our wedding without <CHARNAME> as our most honored guest, but I was hoping you would come together...~
== BVALYG25 ~The sweet matchmaker is at work again?~
== VPKACH2B ~How long can I watch you sighing? How long can I watch her giving you secret glances?~
== BVALYG25 ~I am afraid your own happiness makes you see the world in rose, Kachiko. Look at  <CHARNAME>! She may join the pantheon soon. We are on a mission of meticulously killing her blood relatives. It's just not the right time!~
== VPKACH2B ~When will she need support and love more than now? Valygar, you are taming your heart needlessly.~
== BVALYG25 ~(*sighs*)~
EXIT

CHAIN
IF ~InParty("vpkachi")
See("vpkachi")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("vpkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPKachiValygar2TOB","GLOBAL",0)~ THEN BVALYG25 KachiValygarTalk2TOB
~And what makes you so merry, Kachiko?~
DO ~SetGlobal("VPKachiValygar2TOB","GLOBAL",1)~
== VPKACH2B ~(*Hugs Valygar*)~
== BVALYG25 ~Kachiko, the Kara-Turians are supposed to be a reserved people. Besides, Yoshimo is going to cut my throat shortly.~
== VPYOSH2B ~I'll spare you this time, ranger. Cherry Blossom, you embarrass Valygar.~
== VPKACH2B ~Of course I do not!~
== VPYOSH2B ~Yes you do. After all, it is a private matter.~
== VPKACH2B ~Oh, you are right, Dragon Tongue.~
== BVALYG25 ~What this is all about, lovebirds?~
== VPYOSH2B ~(*sighs*) You and <CHARNAME> of course.~
== BVALYG25 ~I did not think the City Crier's had announced that yet.~
== VPKACH2B ~Sorry, Valygar. It is impossible not to notice.~
== BVALYG25 ~If something goes wrong I know whom to blame, don't I?~
== VPKACH2B ~One, who does not take risk, will never win.~
EXIT
*/

//Yoshimo-Valygar

CHAIN
IF ~InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("Valygar",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPYoshiValygar1TOB","GLOBAL",0)~ THEN BVALYG25 YoshiValygar1TOB
@23
DO ~SetGlobal("VPYoshiValygar1TOB","GLOBAL",1)~
== VPYOSH2B @24
== BVALYG25 @25
== VPYOSH2B @26
== BVALYG25 @27
== VPYOSH2B @28
== BVALYG25 @29
== VPYOSH2B @30
== BVALYG25 @31
EXIT