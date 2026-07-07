	object_const_def
	const ILEXFORESTAZALEAGATE_OFFICER
	const ILEXFORESTAZALEAGATE_GRANNY

IlexForestAzaleaGate_MapScripts:
	def_scene_scripts

	def_callbacks

IlexForestAzaleaGateOfficerScript:
	jumptextfaceplayer IlexForestAzaleaGateOfficerText

IlexForestAzaleaGateGrannyScript:
;	jumptextfaceplayer IlexForestAzaleaGateGrannyText
	faceplayer
	opentext
	checkevent EVENT_HIDDEN_CLEANSE_TAG
	iftrue .GotCleanseTag
	writetext IlexForestAzaleaGateGrannyText
	promptbutton
	verbosegiveitem CLEANSE_TAG
	setevent EVENT_HIDDEN_CLEANSE_TAG
	writetext IlexForestAzaleaGateGrannyGotCleanseTagText
	waitbutton
	closetext
	end
.GotCleanseTag:
	writetext IlexForestAzaleaGateGrannyGotCleanseTagText
	waitbutton
	closetext
	end

IlexForestAzaleaGateOfficerText:
	text "ILEX FOREST is"
	line "big. Be careful!"
	cont "Don't get lost."
	done

IlexForestAzaleaGateGrannyText:
	text "The FOREST is"
	line "watched over by"
	cont "its protector."

	para "And when it is"
	line "not here I like"
	cont "to walk around the"
	cont "forest and perform"
	cont "cleansing rites."
	
	para "Here take this"
	line "CLEANSE TAG."
	
	para "It will keep"
	line "wild #mon away"
	cont "and extend your"
	cont "#mon's SAFEGUARD."
	done
	
IlexForestAzaleaGateGrannyGotCleanseTagText:
	text "Stay out of"
	line "mischief!"
	done

IlexForestAzaleaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ILEX_FOREST, 2
	warp_event  0,  5, ILEX_FOREST, 3
	warp_event  9,  4, AZALEA_TOWN, 7
	warp_event  9,  5, AZALEA_TOWN, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateOfficerScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateGrannyScript, -1
