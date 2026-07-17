	object_const_def
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
;	const OLIVINECAFE_SAILOR2
	const OLIVINECAFE_SILPHCO_WORKER

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

;OlivineCafeSailorScript:
;	jumptextfaceplayer OlivineCafeSailorText
	
OlivineCafeSilphCoWorkerScopeLens:
	faceplayer
	opentext
	checkevent EVENT_HIDDEN_SCOPE_LENS
	iftrue .GotScopeLens
	writetext OlivineCafeGiveScopeLens
	promptbutton
	verbosegiveitem SCOPE_LENS
	setevent EVENT_HIDDEN_SCOPE_LENS
	writetext OlivineCafeGotScopeLens
	waitbutton
	closetext
	end
.GotScopeLens:
	writetext OlivineCafeGotScopeLens
	waitbutton
	closetext
	end

OlivineCafeStrengthSailorText:
	text "Hah! Your #MON"
	line "sure look like"
	cont "lightweights!"

	para "They don't have"
	line "the power to move"
	cont "boulders aside."

	para "Here, use this"
	line "and teach them"
	cont "STRENGTH!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "On the sea, the"
	line "only thing you can"

	para "count on is your"
	line "own good self!"

	para "I'm so proud of my"
	line "buff bod!"
	done

OlivineCafeFishingGuruText:
	text "OLIVINE CAFE's"
	line "menu is chock full"

	para "of hearty fare for"
	line "beefy SAILORS!"
	done

;OlivineCafeSailorText:
;	text "Whenever I roll"
;	line "into this town, I"

;	para "always visit the"
;	line "OLIVINE CAFE."

;	para "Everything on the"
;	line "menu makes me feel"

;	para "stronger. I can't"
;	line "stop eating!"
;	done
	
OlivineCafeGiveScopeLens:
	text "What am I to do?"
	
	para "I work for Silph"
	line "in Kanto, but with"
	cont "the Magnet Train"
	cont "not running I can't"
	cont "get back!"
	
	para "I've been here in"
	line "Johto to research"
	cont "and develop a"
	cont "brand new battle"
	cont "item."
	
	para "I call it the"
	line "SCOPE LENS!"
	
	para "It inceases the"
	line "chance of landing"
	cont "critical hits!"
	
	para "Hey, you are a"
	line "#MON trainer!"

	para "Why don't you take"
	line "this prototype?"
	done
	
OlivineCafeGotScopeLens:
	text "The SCOPE LENS"
	line "increase critical"
	cont "hit chance."
	
	para "Don't worry."
	line "I can make a new"
	cont "back at Silph Co."
	
	para "I'm sure the"
	line "President won't"
	cont "mind it being"
	cont "promoted a bit"
	cont "before it hits"
	cont "the shelves."
	done
	

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
;	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
	object_event  7,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSilphCoWorkerScopeLens, -1
