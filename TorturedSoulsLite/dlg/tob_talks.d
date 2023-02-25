////////////////////////////////////////
// ToB Other Talks and Interjections
////////////////////////////////////////

BEGIN VPKACH2J

CHAIN IF ~Global("VP_Yoshimo_Dies","GLOBAL",2)
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN VPKACH2J 0
~Sorry, <CHARNAME>, I cannot stay with you any longer. Without Yoshimo, I have nothing to do in your party. I must go back to Kozakura. Good luck to you.~
DO ~LeaveParty() EscapeArea()~ 
EXIT

CHAIN VPKACH2J 1
~Oh, my love, I was so worried about you!~
EXIT

CHAIN VPKACH2J 2
~Yes, Yoshimo, let's go. Sorry, <CHARNAME>... Take care...~
DO ~LeaveParty() EscapeArea()~
EXIT

////////////////
// Solar
////////////////

// Kachiko
EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("vpkachi")~ THEN EXTERN VPKACH2J KachiChoice
END

CHAIN VPKACH2J KachiChoice
~There are ten millions immortal spirits we worship in Kara-Tur.~
END
  IF ~Kit(Player1,KENSAI)~ THEN EXTERN VPKACH2J KachiChoiceKensai
  IF ~!Kit(Player1,KENSAI)~ THEN EXTERN VPKACH2J KachiChoiceNoKensai

CHAIN VPKACH2J KachiChoiceKensai
~You are now offered a destiny each samurai dreams of since his or her first steps on the path. You can join the ranks of the immortals, <CHARNAME>-san. Kachiko Nakanishi bows to you.~
COPY_TRANS FINSOL01 27

CHAIN VPKACH2J KachiChoiceNoKensai
~You might become one of them. I bow to your greatness and achievement, <CHARNAME>-san.~
COPY_TRANS FINSOL01 27

// Yoshimo
EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("Yoshimo")~ THEN EXTERN YOSHJ VPYoshimoChoice
END

CHAIN YOSHJ VPYoshimoChoice
~Say the word you think is proper. But be you god or be you mortal, always remember that Yoshimo is your friend.~
COPY_TRANS FINSOL01 27

//IF ~~ THEN BEGIN 6
//  SAY ~Oh, my love, I was so worried about you!~
//  IF ~~ THEN DO ~ActionOverride("Yoshimo",JoinParty())~ EXIT
//END

//IF ~~ THEN BEGIN 7
//  SAY  ~Yes, Yoshimo, let's go. Sorry, <CHARNAME>... Take care...~
//  IF ~~ THEN DO ~ActionOverride("Yoshimo",EscapeArea())
//LeaveParty()
//EscapeArea())~ EXIT
//END