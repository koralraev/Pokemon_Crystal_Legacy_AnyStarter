	object_const_def
	const OLIVINEPOKECENTER1F_NURSE
	const OLIVINEPOKECENTER1F_FISHING_GURU
	const OLIVINEPOKECENTER1F_FISHER
	const OLIVINEPOKECENTER1F_TEACHER
	const OLIVINE_PC_FLYSERVICE 	 ;<----
	const OLIVINE_PC_FLYSERVICE_ABRA  ;<----

OlivinePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivinePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

OlivinePokecenter1FFishingGuruScript:
	jumpstd HappinessCheckScript

OlivinePokecenter1FFisherScript:
	jumptextfaceplayer OlivinePokecenter1FFisherText

OlivinePokecenter1FTeacherScript:
	jumptextfaceplayer OlivinePokecenter1FTeacherText
	
Olivine_FlyService: ;<----1
	opentext
	writetext Olivine_FlyText ;<----1
	yesorno
	iffalse .Refused
	closetext
	appear OLIVINE_PC_FLYSERVICE_ABRA ;<----1
	playsound SFX_WARP_FROM
	applymovement OLIVINE_PC_FLYSERVICE_ABRA, Olivine_AbraTeleportTo ;<----2
	setevent EVENT_FLYSERVICE_HIDE_ABRA ; clears the abra for next visit
	callasm FlyService
	reloadmappart
	playsound SFX_WARP_TO
	applymovement OLIVINE_PC_FLYSERVICE_ABRA, Olivine_AbraTeleportFrom ;<----2
	disappear OLIVINE_PC_FLYSERVICE_ABRA ;<----1
	end
.Refused
	closetext
	end
Olivine_AbraTeleportTo: 	;<----1
	teleport_to
	step_end
Olivine_AbraTeleportFrom: ;<----1
	teleport_from
	step_end
Olivine_FlyText: 	;<----1
	text "Call an Abra?"
	done

OlivinePokecenter1FFisherText:
	text "The SAILOR in the"
	line "OLIVINE CAFE next"

	para "door is really"
	line "generous."

	para "He taught my"
	line "#MON STRENGTH."

	para "Now it can move"
	line "big boulders."
	done

OlivinePokecenter1FTeacherText:
	text "There's a person"
	line "in CIANWOOD CITY"
	cont "who brags about"
	cont "his rare"
	cont "#MON."
	done

OlivinePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, OLIVINE_CITY, 1
	warp_event  4,  7, OLIVINE_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFishingGuruScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFisherScript, -1
	object_event  7,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FTeacherScript, -1
	object_event  5,  2, SPRITE_FLYSERVICE_PC, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Olivine_FlyService, EVENT_FLYSERVICE_UNLOCKED
	object_event  6,  3, SPRITE_ABRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Olivine_FlyService, EVENT_FLYSERVICE_HIDE_ABRA
