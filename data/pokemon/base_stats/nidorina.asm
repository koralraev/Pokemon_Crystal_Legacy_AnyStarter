	db NIDORINA ; 030

	db  70,  62,  67,  56,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 120 ; catch rate
	db 117 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F100 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/nidorina/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BODY_SLAM, BUBBLEBEAM, CURSE, DEFENSE_CURL, DETECT, DIG, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, ICE_BEAM, IRON_TAIL, MIMIC, MUD_SLAP, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, ROCK_SMASH, SLEEP_TALK, SLUDGE_BOMB, SNORE, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, TOXIC, 
	; end
