	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE
	const CIANWOODPOKECENTER1F_SUPER_NERD
	const CIANWOOD_PC_FLYSERVICE 	 ;<----
	const CIANWOOD_PC_FLYSERVICE_ABRA  ;<----
	const CIANWOOD_FLYSERVICE_GUY

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodFlyServiceGuyScript:
	opentext
	checkevent EVENT_BEAT_CHUCK
	iffalse .DontDisturb
	checkevent EVENT_GOT_HM02_FLY
	iffalse .StillNeedFly
	writetext FlyGuyIntroText
	promptbutton
	closetext
	pause 10
	faceplayer
	opentext
	clearevent EVENT_FLYSERVICE_UNLOCKED
	setevent EVENT_FLYSERVICE_FLYGUY_HIDE ;should hide him
	writetext FlyGuyFlyServiceText
	promptbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CIANWOOD_FLYSERVICE_GUY, FlyGuyTeleportFrom
	disappear CIANWOOD_FLYSERVICE_GUY
	end		
	
.DontDisturb:
	writetext FlyGuyDontDisturbText
	promptbutton
	closetext
	end
.StillNeedFly:
	writetext FlyGuyStillNeedFlyText
	promptbutton
	closetext
	end
FlyGuyTeleportFrom:
	teleport_from
	step_end
	
FlyGuyIntroText:
	text "Aaaand done!"
	done
FlyGuyFlyServiceText:
	text "HA! I bet you"
	line "always wondered"
	cont "what this small"
	cont "PC was for?"
	para "I'll tell you!"
	para "This is a network"
	line "for teleportation"
	cont "between the"
	cont "#MON CENTERS"
	cont "of Johto."
	para "We finally got"
	line "the permits"
	cont "approved!"
	cont "And it only took"
	cont "some 30 years..."
	para "But I'm just glad"
	line "it's finally"
	cont "working."
	para "You just click"
	line "here, and one of"
	cont "my Abra's will come"
	cont "pick you up and"
	cont "take you to"
	cont "your destination!"
	cont "Easy right?"
	para "Now if you don't"
	line "have a flying"
	cont "#MON you can"
	cont "still get around."
	para "I just restarted"
	line "the PC, but if"
	cont "you go out and"
	cont "come back in,"
	cont "it'll be ready"
	cont "for service in"
	cont "all PokeCenters."
	para "Bye!"
	done	
	
FlyGuyDontDisturbText:
	text "I'm almost done"
	line "here. Can't you"
	cont "go beat the GYM"
	cont "or something?"
	para "I'll probably"
	line "be done by then."
	done
	
FlyGuyStillNeedFlyText:
	text "You beat the GYM"
	line "already?"
	para "That was quick."
	para "I'm still not"
	line "done here, but"
	cont "a woman came in"
	cont "here looking for"
	cont "someone who just"
	cont "beat Chuck."
	para "That must be you"
	line "right?"
	done

	
Cianwood_FlyService: ;<----1
	opentext
	writetext Cianwood_FlyText ;<----1
	yesorno
	iffalse .Refused
	closetext
	appear CIANWOOD_PC_FLYSERVICE_ABRA ;<----1
	playsound SFX_WARP_FROM
	applymovement CIANWOOD_PC_FLYSERVICE_ABRA, Cianwood_AbraTeleportTo ;<----2
	setevent EVENT_FLYSERVICE_HIDE_ABRA ; clears the abra for next visit
	callasm FlyService
	reloadmappart
	playsound SFX_WARP_TO
	applymovement CIANWOOD_PC_FLYSERVICE_ABRA, Cianwood_AbraTeleportFrom ;<----2
	disappear CIANWOOD_PC_FLYSERVICE_ABRA ;<----1
	end
.Refused
	closetext
	end
Cianwood_AbraTeleportTo: 	;<----1
	teleport_to
	step_end
Cianwood_AbraTeleportFrom: ;<----1
	teleport_from
	step_end
Cianwood_FlyText: 	;<----1
	text "Call an Abra?"
	done

CianwoodPokecenter1FLassText:
	text "Did you meet the"
	line "#MANIAC?"

	para "He's always brag-"
	line "ging about his"
	cont "rare #MON."
	done

CianwoodGymGuideText:
	text "The #MON GYM"
	line "trainers here are"
	cont "macho bullies."

	para "If I stick around,"
	line "they might come"
	cont "after me."

	para "Here's some ad-"
	line "vice: the GYM"

	para "LEADER uses the"
	line "FIGHTING-type."

	para "So you should"
	line "confound him with"
	cont "psychic #MON."

	para "Wipe out his #-"
	line "MON before they"

	para "can use their"
	line "physical strength."

	para "And those boulders"
	line "in the middle of"
	cont "the GYM?"

	para "If you don't move"
	line "them correctly,"

	para "you won't reach"
	line "the GYM LEADER."

	para "If you get stuck,"
	line "go outside."
	done

CianwoodGymGuideWinText:
	text "<PLAYER>! You won!"
	line "I could tell by"
	cont "looking at you!"
	done

CianwoodPokecenter1FUnusedText1: ; unreferenced
	text "Don't you get the"
	line "urge to show off"

	para "your #MON to"
	line "friends?"

	para "I wish I could"
	line "show the #MON I"

	para "raised to my pal"
	line "in VIOLET."
	done

CianwoodPokecenter1FUnusedText2: ; unreferenced
	text "I've been battling"
	line "my pal in VIOLET"

	para "using a MOBILE"
	line "ADAPTER link."

	para "I'm down 5-7"
	line "against him. I've"
	cont "gotta crank it up!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "I love showing off"
	line "the #MON that"

	para "I've raised."
	line "Don't you?"

	para "I'm going to get"
	line "into a bunch of"

	para "battles, and show"
	line "off my #MON!"
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  2,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
	object_event  5,  2, SPRITE_FLYSERVICE_PC, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Cianwood_FlyService, EVENT_FLYSERVICE_UNLOCKED
	object_event  6,  3, SPRITE_FLYSERVICE_ABRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Cianwood_FlyService, EVENT_FLYSERVICE_HIDE_ABRA
	object_event  5,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodFlyServiceGuyScript, EVENT_FLYSERVICE_FLYGUY_HIDE
