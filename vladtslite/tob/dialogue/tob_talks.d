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
ForceSpell(Myself,TRANSFORMATION_DEATH)~
EXIT

/////////////////////////////////////////////////////////////////////
// Yoshimo is Dead and Dumped from the party - Kachiko Reaction
/////////////////////////////////////////////////////////////////////

CHAIN
IF WEIGHT #0 ~Global("ttYoshimoDies","GLOBAL",3)~ THEN TTKACH2J 19
~Sorry, <CHARNAME>, I cannot stay with you any longer. Without Yoshimo, I have nothing to do in your party. I must go back to Kozakura. Good luck to you.~
DO ~SetGlobal("ttYoshimoDies","GLOBAL",4)
LeaveParty()
EscapeArea()~
EXIT

///////////////////////////////////////
// Final Solar Talk Interjections
///////////////////////////////////////

// Kachiko
EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("ttkachi")~ THEN EXTERN TTKACH2J ttKachikoSolarChoice
END

CHAIN TTKACH2J ttKachikoSolarChoice
~There are ten millions immortal spirits we worship in Kara-Tur.~
END
  IF ~Kit(Player1,KENSAI)~ THEN EXTERN TTKACH2J ttKachikoSolarChoiceKensai
  IF ~!Kit(Player1,KENSAI)~ THEN EXTERN TTKACH2J ttKachikoSolarChoiceNoKensai

CHAIN TTKACH2J ttKachikoSolarChoiceKensai
~You are now offered a destiny each samurai dreams of since his or her first steps on the path. You can join the ranks of the immortals, <CHARNAME>-san. Kachiko Nakanishi bows to you.~
COPY_TRANS FINSOL01 27

CHAIN TTKACH2J ttKachikoSolarChoiceNoKensai
~You might become one of them. I bow to your greatness and achievement, <CHARNAME>-san.~
COPY_TRANS FINSOL01 27

// Yoshimo
EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("Yoshimo")~ THEN EXTERN YOSHJ ttYoshimoSolarChoice
END

CHAIN YOSHJ ttYoshimoSolarChoice
~Say the word you think is proper. But be you god or be you mortal, always remember that Yoshimo is your friend.~
COPY_TRANS FINSOL01 27