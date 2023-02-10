BEGIN VPOGI

CHAIN
IF ~Name("Yoshimo",LastTalkedToBy)~ THEN VPOGI 0
@0
EXIT

CHAIN
IF ~OR(2)
!InPartySlot(LastTalkedToBy,0)
!Name("Yoshimo",LastTalkedToBy)~ THEN VPOGI 1
@1
EXIT