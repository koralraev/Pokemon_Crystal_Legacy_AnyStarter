	object_const_def
	const OLIVINEMART_CLERK
	const OLIVINEMART_COOLTRAINER_F
	const OLIVINEMART_LASS

OlivineMart_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_OLIVINE
	closetext
	end

OlivineMartCooltrainerFScript:
	jumptextfaceplayer OlivineMartCooltrainerFText

OlivineMartLassScript:
;	jumptextfaceplayer OlivineMartLassText
	faceplayer
	opentext
	writetext OlivineMartLassText
	yesorno
	iftrue .TeachRoost
	writetext OlivineMartLassByeText
	waitbutton
	closetext
	end
.TeachRoost:
	checkitem SHARP_BEAK
	iffalse .NoSharpBeakPayment
	setval ROOST
	sjump .TeachMove
.NoSharpBeakPayment:
	writetext NoSharpBeakPaymentText
	waitbutton
	closetext
	end

.TeachMove:
	writetext RoostTutorTeachMoveText
	waitbutton
	special MoveTutor
	ifequal FALSE, .MoveTaught
	closetext
	end
	
.MoveTaught:
	writetext RoostTutorToughtMoveText
	takeitem SHARP_BEAK
	waitbutton
	closetext
	end
	

OlivineMartCooltrainerFText:
	text "Do your #MON"
	line "already know the"

	para "move for carrying"
	line "people on water?"
	done

OlivineMartLassText:
	text "My BUTTERFREE came"
	line "from my boyfriend"
	cont "overseas."

	para "It carried some"
	line "MAIL from him."

	para "Want to know what"
	line "it says?"

	para "Let's see… "
;	line "It's a secret!"
	para "'Many bird"
	line "#MON can ROOST"
	cont "to rest.'"
	para "This is good to"
	line "know!"
	para "Want me to teach"
	line "one of your"
	cont "#MON to ROOST"
	cont "in exchange for"
	cont "a SHARP BEAK?"
	done

OlivineMartLassByeText:
	text "Ok."
	done

NoSharpBeakPaymentText:
	text "But you don't have"
	line "a SHARP BEAK to"
	cont "pay with."
	done

RoostTutorTeachMoveText:
	text "Which one should"
	line "learn to ROOST?"
	done

RoostTutorToughtMoveText:
	text "Now your #MON"
	line "can rest after a"
	cont "long flight."
	done

OlivineMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 8
	warp_event  3,  7, OLIVINE_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMartClerkScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivineMartCooltrainerFScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMartLassScript, -1
