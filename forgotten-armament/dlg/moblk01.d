EXTEND_BOTTOM BOTSMITH 4
IF ~PartyHasItem("miscbc")~ THEN GOTO MO#PartyHasAtLeastOneItem END
  
APPEND BOTSMITH
IF ~~ THEN BEGIN MO#PartyHasAtLeastOneItem SAY @40000
	IF ~PartyHasItem("miscbc")
		PartyHasItem("compon04")~ THEN GOTO MO#PartyHasAllParts
	IF ~PartyHasItem("miscbc")
		!PartyHasItem("compon04")~ THEN GOTO MO#PartyDoesNotHaveAllParts
END 

IF ~~ THEN BEGIN MO#PartyDoesNotHaveAllParts SAY @40001
	IF ~~ THEN GOTO MO#MovingRightAlong
END 

IF ~~ THEN BEGIN MO#PartyHasAllParts SAY @40002
	IF ~PartyGoldLT(10000)~ THEN REPLY #66662 GOTO MO#MovingRightAlong
	IF ~PartyGoldGT(9999)~ THEN REPLY #66664 DO ~SetGlobal("MO#TOBItemUp","GLOBAL",1)
											 		 SetGlobal("ImpForgeStuff","GLOBAL",1)
													 TakePartyGold(10000)
													 DestroyGold(10000)
													 TakePartyItemNum("miscbc",1)
													 DestroyItem("miscbc")
													 TakePartyItemNum("compon04",1)
													 DestroyItem("compon04")~ GOTO 11
	IF ~~ THEN REPLY #66770 GOTO MO#MovingRightAlong
	END 

	IF ~~ THEN BEGIN MO#MovingRightAlong SAY @40003
		COPY_TRANS BOTSMITH 4
	END
END