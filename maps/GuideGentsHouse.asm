	object_const_def
	const GUIDEGENTSHOUSE_GRAMPS
	const GUIDEGENTSHOUSE_YOUNGSTER

GuideGentsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GuideGentsHouseGuideGent:
	jumptextfaceplayer GuideGentsHouseGuideGentText
	
GuideGentsHouseYoungster:
	jumptextfaceplayer GuideGentsHouseStatMenuGuideText

GuideGentsHouseBookshelf:
	jumpstd MagazineBookshelfScript

GuideGentsHouseGuideGentText:
	text "When I was a wee"
	line "lad, I was a hot-"
	cont "shot trainer!"

	para "Here's a word of"
	line "advice: Catch lots"
	cont "of #MON!"

	para "Treat them all"
	line "with kindness!"
	done
	
GuideGentsHouseStatMenuGuideText:
	text "The new in-battle"
	line "STAT menu can be"
	cont "opened by pressing"
	cont "the START button."
	
	para "It shows your"
	line "#mons current"
	cont "stat changes and"
	cont "the remaining"
	cont "turns of weather"
	cont "moves, screens and"
	cont "SAFEGUARD, and if"
	cont "MIST is active."
	
	para "Abbreviations are:"
	line "ATK is Attack"
	cont "DEF is Defense"
	cont "SPA is Sp.Atk"
	cont "SPD is Sp.Def"
	cont "SPE is Speed"
	cont "ACC is Accuracy"
	cont "EVA is Evasion"
	cont "MST is MIST"
	cont "WEA is weather"
	cont "SG is SAFEGUARD"
	cont "LS is LIGHT SCREEN"
	cont "REF is REFLECT"
	done
	
	

GuideGentsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 4
	warp_event  3,  7, CHERRYGROVE_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, GuideGentsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, GuideGentsHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GuideGentsHouseGuideGent, EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GuideGentsHouseYoungster, -1
