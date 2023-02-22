////////////////////////////////////////
// ToB Other Talks and Interjections
////////////////////////////////////////

BEGIN VPKACHJ2

CHAIN IF ~Global("VP_Yoshimo_Dies","GLOBAL",2)
See(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN VPKACHJ2 0
~Sorry, <CHARNAME>, I cannot stay with you any longer. Without Yoshimo, I have nothing to do in your party. I must go back to Kozakura. Good luck to you.~
DO ~LeaveParty() EscapeArea()~ 
EXIT

CHAIN VPKACHJ2 1
~Oh, my love, I was so worried about you!~
EXIT

CHAIN VPKACHJ2 2
~Yes, Yoshimo, let's go. Sorry, <CHARNAME>... Take care...~
DO ~LeaveParty() EscapeArea()~
EXIT

////////////////
// Solar
////////////////

// Kachiko
EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("vpkachi")~ THEN EXTERN VPKACHJ2 KachiChoice
END

CHAIN VPKACHJ2 KachiChoice
~There are ten millions immortal spirits we worship in Kara-Tur.~
END
  IF ~Kit(Player1,KENSAI)~ THEN EXTERN VPKACHJ2 KachiChoiceKensai
  IF ~!Kit(Player1,KENSAI)~ THEN EXTERN VPKACHJ2 KachiChoiceNoKensai

CHAIN VPKACHJ2 KachiChoiceKensai
~You are now offered a destiny each samurai dreams of since his or her first steps on the path. You can join the ranks of the immortals, <CHARNAME>-san. Kachiko Nakanishi bows to you.~
COPY_TRANS FINSOL01 27

CHAIN VPKACHJ2 KachiChoiceNoKensai
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