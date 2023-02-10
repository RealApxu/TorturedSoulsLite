BEGIN VPLULU

CHAIN
IF ~Name("Yoshimo",LastTalkedToBy)~ THEN VPLULU 0
@0
EXIT

CHAIN
IF ~OR(2) !InPartySlot(LastTalkedToBy,0) !Name("Yoshimo",LastTalkedToBy)~ THEN VPLULU 1
@1
EXIT