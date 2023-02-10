BEGIN VPNKLEAD

CHAIN IF ~Global("Samurai_Meeting","GLOBAL",0)~ THEN VPNKLEAD 0
@0
DO ~SetGlobal("Samurai_Meeting","GLOBAL",1) Enemy()~
EXIT