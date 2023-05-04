/////////////////////////////////////
// Kachiko Banters with Party - ToB
/////////////////////////////////////

//Lovetalks ToB
CHAIN
IF ~Global("ttKachikoLoveTalkTOB","GLOBAL",2)~ THEN TTKACH2B YoshiKachiLoveTalk1TOB
@0
DO ~IncrementGlobal("ttKachikoLoveTalkTOB","GLOBAL",1) SetGlobalTimer("ttKachikoRomanceTimerTOB","GLOBAL",ONE_DAY)~
== TTYOSH2B @1
== TTKACH2B @2
== TTYOSH2B @3
== TTKACH2B @4
EXIT

CHAIN
IF ~Global("ttKachikoLoveTalkTOB","GLOBAL",4)~ THEN TTKACH2B YoshiKachiLoveTalk2TOB
@5
DO ~IncrementGlobal("ttKachikoLoveTalkTOB","GLOBAL",1) SetGlobalTimer("ttKachikoRomanceTimerTOB","GLOBAL",ONE_DAY)~
== TTYOSH2B @6
== TTKACH2B @7
== TTYOSH2B @8
== TTKACH2B @9
== TTYOSH2B @10
== TTKACH2B @11
== TTYOSH2B @12
== TTKACH2B @13
EXIT

CHAIN
IF ~Global("ttKachikoLoveTalkTOB","GLOBAL",6)~ THEN TTKACH2B YoshiKachiLoveTalk3TOB
@14
DO ~IncrementGlobal("ttKachikoLoveTalkTOB","GLOBAL",1) SetGlobalTimer("ttKachikoRomanceTimerTOB","GLOBAL",ONE_DAY)~
== TTYOSH2B @15
== TTKACH2B @16
== TTYOSH2B @17
== TTKACH2B @18
== TTYOSH2B @19
== TTKACH2B @20
== TTYOSH2B @21
== TTKACH2B @22
EXIT

//Valygar Romance

/*
CHAIN
IF ~InParty("ttkachi")
See("ttkachi")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiValygar1TOB","GLOBAL",0)~ THEN BVALYG25 KachiValygarTalk1TOB
~Is that true? You two are getting married?~
DO ~SetGlobal("ttKachiValygar1TOB","GLOBAL",1)~
== TTKACH2B ~Eventually. Well, will you come?~
== BVALYG25 ~My congratulations! Of course I will.~
== TTKACH2B ~And you will bring <CHARNAME> along?~
== BVALYG25 ~Ahem... Aren't you going to invite <CHARNAME>?~
== TTKACH2B ~(*Smiles*)~
== BVALYG25 ~Kachiko?~
== TTKACH2B ~Valygar, of course! You know well enough that Yoshimo's soul was redeemed with her help and we cannot imagine our wedding without <CHARNAME> as our most honored guest, but I was hoping you would come together...~
== BVALYG25 ~The sweet matchmaker is at work again?~
== TTKACH2B ~How long can I watch you sighing? How long can I watch her giving you secret glances?~
== BVALYG25 ~I am afraid your own happiness makes you see the world in rose, Kachiko. Look at  <CHARNAME>! She may join the pantheon soon. We are on a mission of meticulously killing her blood relatives. It's just not the right time!~
== TTKACH2B ~When will she need support and love more than now? Valygar, you are taming your heart needlessly.~
== BVALYG25 ~(*sighs*)~
EXIT

CHAIN
IF ~InParty("ttkachi")
See("ttkachi")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("ttkachi",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("ttKachiValygar2TOB","GLOBAL",0)~ THEN BVALYG25 KachiValygarTalk2TOB
~And what makes you so merry, Kachiko?~
DO ~SetGlobal("ttKachiValygar2TOB","GLOBAL",1)~
== TTKACH2B ~(*Hugs Valygar*)~
== BVALYG25 ~Kachiko, the Kara-Turians are supposed to be a reserved people. Besides, Yoshimo is going to cut my throat shortly.~
== TTYOSH2B ~I'll spare you this time, ranger. Cherry Blossom, you embarrass Valygar.~
== TTKACH2B ~Of course I do not!~
== TTYOSH2B ~Yes you do. After all, it is a private matter.~
== TTKACH2B ~Oh, you are right, Dragon Tongue.~
== BVALYG25 ~What this is all about, lovebirds?~
== TTYOSH2B ~(*sighs*) You and <CHARNAME> of course.~
== BVALYG25 ~I did not think the City Crier's had announced that yet.~
== TTKACH2B ~Sorry, Valygar. It is impossible not to notice.~
== BVALYG25 ~If something goes wrong I know whom to blame, don't I?~
== TTKACH2B ~One, who does not take risk, will never win.~
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
== TTYOSH2B @24
== BVALYG25 @25
== TTYOSH2B @26
== BVALYG25 @27
== TTYOSH2B @28
== BVALYG25 @29
== TTYOSH2B @30
== BVALYG25 @31
EXIT