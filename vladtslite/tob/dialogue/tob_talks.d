////////////////////////////////////////
// ToB Other Talks and Interjections
////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Kachiko is Dead and Dumped from the party - Yoshimo Reaction
/////////////////////////////////////////////////////////////////////

CHAIN
IF WEIGHT #0 ~Global("ttKachikoDies","GLOBAL",3)~ THEN TTYOSH2J TS223
~<CHARNAME>, it's my fault. I couldn't save Kachiko... And she was my only reason to live in this damned world... No, I have no rights to continue this miserable existance... I am very sorry, <CHARNAME>... (*Suddenly, the blick of Yoshimo's katana, and...*)~
DO ~SetGlobal("ttKachikoDies","GLOBAL",4)
StartCutSceneMode()
Wait(2)
ForceSpell(Myself,TRANSFORMATION_DEATH)
EndCutSceneMode()~
EXIT

/////////////////////////////////////////////////////////////////////
// Yoshimo is Dead and Dumped from the party - Kachiko Reaction
/////////////////////////////////////////////////////////////////////

CHAIN
IF WEIGHT #0 ~Global("ttYoshimoDies","GLOBAL",3)
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN TTKACH2J 19
~Sorry, <CHARNAME>, I cannot stay with you any longer. Without Yoshimo, I have nothing to do in your party. I must go back to Kozakura. Good luck to you.~
DO ~LeaveParty()
EscapeArea()~
EXIT

////////////////
// Solar
////////////////

// Kachiko
EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("ttkachi")~ THEN EXTERN TTKACH2J KachiChoice
END

CHAIN TTKACH2J KachiChoice
~There are ten millions immortal spirits we worship in Kara-Tur.~
END
  IF ~Kit(Player1,KENSAI)~ THEN EXTERN TTKACH2J KachiChoiceKensai
  IF ~!Kit(Player1,KENSAI)~ THEN EXTERN TTKACH2J KachiChoiceNoKensai

CHAIN TTKACH2J KachiChoiceKensai
~You are now offered a destiny each samurai dreams of since his or her first steps on the path. You can join the ranks of the immortals, <CHARNAME>-san. Kachiko Nakanishi bows to you.~
COPY_TRANS FINSOL01 27

CHAIN TTKACH2J KachiChoiceNoKensai
~You might become one of them. I bow to your greatness and achievement, <CHARNAME>-san.~
COPY_TRANS FINSOL01 27

// Yoshimo
EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("Yoshimo")~ THEN EXTERN YOSHJ VPYoshimoChoice
END

CHAIN YOSHJ VPYoshimoChoice
~Say the word you think is proper. But be you god or be you mortal, always remember that Yoshimo is your friend.~
COPY_TRANS FINSOL01 27