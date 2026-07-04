	object_const_def
	const TOHJOFALLS_POKE_BALL
	const SPARKLE_HIDDEN_SMOOTH_ROCK

TohjoFalls_MapScripts:
	def_scene_scripts

	def_callbacks

TohjoFallsMoonStone:
	itemball MOON_STONE
	
TohjoFallsHiddenSmoothRockScript:
	checkevent EVENT_HIDDEN_SMOOTH_ROCK
	iftrue .GotSmoothRock
	opentext
	writetext HiddenSmoothRockText
	promptbutton
	giveitem SMOOTH_ROCK
	iffalse .NoRoom
	itemnotify
	setevent EVENT_HIDDEN_SMOOTH_ROCK
	disappear SPARKLE_HIDDEN_SMOOTH_ROCK
	closetext
	end
.GotSmoothRock:
	end
.NoRoom:
	jumpstd PackFullMScript
	end
	
HiddenSmoothRockText:
	text "There is a small"
	line "hole here."
	cont "You reach in and"
	cont "feel something..."
	
	para "<PLAYER> found a"
	line "SMOOTH ROCK!"
	
	para "Wow. It's really"
	cont "smooth."
	done

TohjoFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 15, ROUTE_27, 2
	warp_event 25, 15, ROUTE_27, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TohjoFallsMoonStone, EVENT_TOHJO_FALLS_MOON_STONE
	object_event  3,  5, SPRITE_ITEM_SPARKLE, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TohjoFallsHiddenSmoothRockScript, EVENT_HIDDEN_SMOOTH_ROCK
