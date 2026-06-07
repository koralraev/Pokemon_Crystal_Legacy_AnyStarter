	object_const_def
	const CIANWOODLUGIASPEECHHOUSE_TEACHER
	const CIANWOODLUGIASPEECHHOUSE_LASS
	const CIANWOODLUGIASPEECHHOUSE_TWIN

CianwoodLugiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTeacherText

CianwoodLugiaSpeechHouseLassScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseLassText

CianwoodLugiaSpeechHouseTwinScript:
;	jumptextfaceplayer CianwoodLugiaSpeechHouseTwinText
	faceplayer
	opentext
	yesorno
	iffalse .FirstNo
	writetext FirstYesText
	sjump .SecondPrompt
	
.FirstNo:
	writetext FirstNoText
	
.SecondPrompt:
	yesorno
	iffalse .SecondNo
	writetext SecondYesText
	sjump .LastPrompt
	
.SecondNo:
	writetext SecondNoText
	
.LastPrompt:
	yesorno
	iffalse .LastNo
	writetext LastYesText
	sjump .OfferTutor
	
.LastNo:
	writetext LastNoText
	
.OfferTutor:
	promptbutton
	writetext ILikeToMimicText
	yesorno
	iffalse .Refused
	writetext AskMysteryBerryPaymentText
	yesorno
	iffalse .Refused
	checkitem MYSTERYBERRY
	iffalse .NoMysteryBerryPayment
	setval MIMIC
	sjump .TeachMove
	
.NoMysteryBerryPayment:
	writetext NoMysteryBerryPaymentText
	waitbutton
	closetext
	end

.Refused:
	writetext MimicTutorRefusedText
	waitbutton
	closetext
	end
	
.Cancel:
	writetext MimicTutorRefusedText
	waitbutton
	closetext
	end

.TeachMove:
	writetext MimicTutorTeachMoveText
	waitbutton
	special MoveTutor
	ifequal FALSE, .MoveTaught
	closetext
	end
	
.MoveTaught:
	writetext MimicTutorToughtMoveText
	takeitem MYSTERYBERRY
	waitbutton
	closetext
	end

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

CianwoodLugiaSpeechHouseTeacherText:
;	text "You came from"
;	line "OLIVINE?"

;	para "Do you remember"
;	line "the four islands"
;	cont "along the way?"

	text "I heard that a "
	line "mythical sea crea-"
	cont "ture is hiding in"
	cont "Whirl Islands"
	done

CianwoodLugiaSpeechHouseLassText:
	text "I heard that you"
	line "can only see it if"

	para "you have a SILVER"
	line "WING."

;	para "It must have the"
;	line "same scent as the"
;	cont "creature."
	done


FirstNoText:
	text "No."
	done

FirstYesText:
	text "Yes."
	done
	
SecondNoText:
	text "No?"
	done

SecondYesText:
	text "Yes?"
	done
	
LastNoText:
	text "No!"
	done

LastYesText:
	text "Yes!"
	done

ILikeToMimicText:
	text "I like to mimic!"
	
	para "We are a bit"
	line "isolated out here"
	cont "so we have to make"
	cont "our own fun."
	
	para "Do you want me to"
	line "teach one of your"
	cont "#mon to MIMIC?"
	done
	
AskMysteryBerryPaymentText:
	text "OK! We don't have"
	line "any trees here."
	
	para "I want a"
	line "MYSTERY BERRY!"
	done
	
NoMysteryBerryPaymentText:
	text "You don't have"
	line "a MYSTERY BERRY…"
	done
	
MimicTutorRefusedText:
	text "OK, bye!"
	done
	
MimicTutorTeachMoveText:
	text "Which one should"
	line "learn to MIMIC?"
	done
	
MimicTutorToughtMoveText:
	text "It's a fun move!"
	done


CianwoodLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  6,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseLassScript, -1
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTwinScript, -1
