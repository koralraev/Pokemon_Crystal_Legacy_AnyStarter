	object_const_def
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F
	const MAHOGANY_PC_FLYSERVICE 	 ;<----
	const MAHOGANY_PC_FLYSERVICE_ABRA  ;<----

MahoganyPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

MahoganyPokecenter1FPokefanMScript:
	jumptextfaceplayer MahoganyPokecenter1FPokefanMText

MahoganyPokecenter1FYoungsterScript:
	jumptextfaceplayer MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FCooltrainerFScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerFText
	
Mahogany_FlyService: ;<----1
	opentext
	writetext Mahogany_FlyText ;<----1
	yesorno
	iffalse .Refused
	closetext
	appear MAHOGANY_PC_FLYSERVICE_ABRA ;<----1
	playsound SFX_WARP_FROM
	applymovement MAHOGANY_PC_FLYSERVICE_ABRA, Mahogany_AbraTeleportTo ;<----2
	setevent EVENT_FLYSERVICE_HIDE_ABRA ; clears the abra for next visit
	callasm FlyService
	reloadmappart
	playsound SFX_WARP_TO
	applymovement MAHOGANY_PC_FLYSERVICE_ABRA, Mahogany_AbraTeleportFrom ;<----2
	disappear MAHOGANY_PC_FLYSERVICE_ABRA ;<----1
	end
.Refused
	closetext
	end
Mahogany_AbraTeleportTo: 	;<----1
	teleport_to
	step_end
Mahogany_AbraTeleportFrom: ;<----1
	teleport_from
	step_end
Mahogany_FlyText: 	;<----1
	text "Call an Abra?"
	done

MahoganyPokecenter1FPokefanMText:
	text "What's this? TEAM"
	line "ROCKET has come"
	cont "back?"

	para "I saw some men in"
	line "black at LAKE OF"
	cont "RAGE…"
	done

MahoganyPokecenter1FYoungsterText:
	text "I stop my #MON"
	line "from evolving too"
	cont "early."

	para "I make them learn"
	line "certain moves be-"
	cont "fore I let them"
	cont "evolve."
	done

MahoganyPokecenter1FCooltrainerFText:
	text "#MON do become"
	line "stronger when they"

	para "evolve, but they"
	line "also learn moves"
	cont "more slowly."
	done

MahoganyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 4
	warp_event  4,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerFScript, -1
	object_event  5,  2, SPRITE_FLYSERVICE_PC, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Mahogany_FlyService, EVENT_FLYSERVICE_UNLOCKED
	object_event  6,  3, SPRITE_ABRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Mahogany_FlyService, EVENT_FLYSERVICE_HIDE_ABRA
