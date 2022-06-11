EXTEND_BOTTOM BOTSMITH 4
IF ~PartyHasItem("moblk01")~ THEN GOTO MO#PartyHasAtLeastOneItem END
  
APPEND BOTSMITH
IF ~~ THEN BEGIN MO#PartyHasAtLeastOneItem SAY @40000







	IF ~~ THEN BEGIN MO#ItemUp00 SAY @567865
		IF ~PartyHasItem("moblk01")
			!PartyHasItem("compon04")~ THEN GOTO MO#ItemUp01
		IF ~PartyHasItem("moblk01")
			PartyHasItem("compon04")~ THEN GOTO MO#ItemUp02
	END
  
	IF ~~ THEN BEGIN MO#ItemUp01 SAY @5678865
		IF ~~ THEN GOTO MO#NoItemUp
	END
  
	IF ~~ THEN BEGIN MO#ItemUp02 SAY @5678965
		IF ~PartyGoldLT(10000)~ THEN REPLY #66662 GOTO MO#NoItemUp
		IF ~PartyGoldGT(9999)~ THEN REPLY #66664 DO ~SetGlobal("MO#TOBItemUp","GLOBAL",1)
											 		 SetGlobal("ImpForgeStuff","GLOBAL",1)
													 SetGlobal("MO#TOBCraft","GLOBAL",1)
													 TakePartyGold(10000)
													 DestroyGold(10000)
													 TakePartyItemNum("moblk01",1)
													 DestroyItem("moblk01")
													 TakePartyItemNum("compon04",1)
													 DestroyItem("compon04")~ GOTO 11
    IF ~~ THEN REPLY #66770 GOTO MO#NoItemUp
	END

	IF ~~ THEN BEGIN MO#NoItemUp SAY @5678
		COPY_TRANS BOTSMITH 4
	END
END