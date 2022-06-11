EXTEND_BOTTOM BOTSMITH 4
IF ~PartyHasItem("sw2h15")~ THEN GOTO MO#PartyHasAtLeastOneItem END
  
APPEND BOTSMITH
IF ~~ THEN BEGIN MO#PartyHasAtLeastOneItem SAY @40010
	IF ~PartyHasItem("sw2h15")
		PartyHasItem("compon01")~ THEN GOTO MO#PartyHasAllParts
	IF ~PartyHasItem("sw2h15")
		!PartyHasItem("compon01")~ THEN GOTO MO#PartyDoesNotHaveAllParts
END 

IF ~~ THEN BEGIN MO#PartyDoesNotHaveAllParts SAY @40011
	IF ~~ THEN GOTO MO#MovingRightAlong
END 

IF ~~ THEN BEGIN MO#PartyHasAllParts SAY @40012
	IF ~PartyGoldLT(15000)~ THEN REPLY #66662 GOTO MO#MovingRightAlong
	IF ~PartyGoldGT(14999)~ THEN REPLY #66664 DO ~SetGlobal("MO#TOBItemUp","GLOBAL",2)
											 		 SetGlobal("ImpForgeStuff","GLOBAL",1)
													 TakePartyGold(15000)
													 DestroyGold(15000)
													 TakePartyItemNum("sw2h15",1)
													 DestroyItem("sw2h15")
													 TakePartyItemNum("compon01",1)
													 DestroyItem("compon01")~ GOTO 11
	IF ~~ THEN REPLY #66770 GOTO MO#MovingRightAlong
	END 

	IF ~~ THEN BEGIN MO#MovingRightAlong SAY @40013
		COPY_TRANS BOTSMITH 4
	END
END