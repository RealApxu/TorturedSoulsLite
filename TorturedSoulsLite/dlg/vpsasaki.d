BEGIN VPSASAKI

CHAIN
IF ~Name("Yoshimo",LastTalkedToBy)~ THEN VPSASAKI 0
@0
EXIT

CHAIN
IF ~OR(2)
!InPartySlot(LastTalkedToBy,0)
!Name("Yoshimo",LastTalkedToBy)~ THEN VPSASAKI 1
@1
EXIT