	object_const_def
	const ICEPATHB2FMAHOGANYSIDE_BOULDER1
	const ICEPATHB2FMAHOGANYSIDE_BOULDER2
	const ICEPATHB2FMAHOGANYSIDE_BOULDER3
	const ICEPATHB2FMAHOGANYSIDE_BOULDER4
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL1
	const ICEPATHB2FMAHOGANYSIDE_POKE_BALL2
	const SPARKLE_HIDDEN_ICY_ROCK

IcePathB2FMahoganySide_MapScripts:
	def_scene_scripts

	def_callbacks

IcePathB2FMahoganySideBoulder:
	jumptext IcePathB2FMahoganySideBoulderText

IcePathB2FMahoganySideFullHeal:
	itemball FULL_HEAL

IcePathB2FMahoganySideMaxPotion:
	itemball MAX_POTION

IcePathB2FMahoganySideHiddenCarbos:
	hiddenitem CARBOS, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_HIDDEN_CARBOS
	
IcePathHiddenIcyRockScript:
	checkevent EVENT_HIDDEN_ICY_ROCK
	iftrue .GotIcyRock
	opentext
	writetext HiddenIcyRockText
	promptbutton
	giveitem ICY_ROCK
	iffalse .NoRoom
	itemnotify
	setevent EVENT_HIDDEN_ICY_ROCK
	disappear SPARKLE_HIDDEN_ICY_ROCK
	closetext
	end
.GotIcyRock:
	end
.NoRoom:
	jumpstd PackFullMScript
	end

IcePathB2FMahoganySideBoulderText:
	text "It's immovably"
	line "imbedded in ice."
	done
	
HiddenIcyRockText:
	text "There is a small"
	line "hole here."
	cont "You reach in and"
	cont "feel something..."
	
	para "<PLAYER> found an"
	line "ICY ROCK!"
	
	para "It's so cold"
	line "it almost burns!"
	done

IcePathB2FMahoganySide_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  1, ICE_PATH_B1F, 2
	warp_event  9, 11, ICE_PATH_B3F, 1
	warp_event 11,  4, ICE_PATH_B1F, 3
	warp_event  4,  6, ICE_PATH_B1F, 4
	warp_event  4, 12, ICE_PATH_B1F, 5
	warp_event 12, 12, ICE_PATH_B1F, 6

	def_coord_events

	def_bg_events
	bg_event  0, 17, BGEVENT_ITEM, IcePathB2FMahoganySideHiddenCarbos

	def_object_events
	object_event 11,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FMahoganySideBoulder, EVENT_BOULDER_IN_ICE_PATH_1A
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FMahoganySideBoulder, EVENT_BOULDER_IN_ICE_PATH_2A
	object_event  3, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FMahoganySideBoulder, EVENT_BOULDER_IN_ICE_PATH_3A
	object_event 12, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB2FMahoganySideBoulder, EVENT_BOULDER_IN_ICE_PATH_4A
	object_event  8,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FMahoganySideFullHeal, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_FULL_HEAL
	object_event  0,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB2FMahoganySideMaxPotion, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_MAX_POTION
	object_event 18, 17, SPRITE_ITEM_SPARKLE, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IcePathHiddenIcyRockScript, EVENT_HIDDEN_ICY_ROCK
