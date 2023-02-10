BEGIN VPNANNY

CHAIN
IF ~NumberOfTimesTalkedTo(0)
See("Yoshimo")~ THEN VPNANNY 0
@0
== YOSHJ @4
== VPNANNY @1
EXIT

CHAIN
IF ~NumberOfTimesTalkedTo(0)
OR(2)
!InPartySlot(LastTalkedToBy,0)
!Name("Yoshimo",LastTalkedToBy)~ THEN VPNANNY 3
@3
EXIT

CHAIN 
IF ~!NumberOfTimesTalkedTo(0)~ THEN VPNANNY 2
@2
EXIT