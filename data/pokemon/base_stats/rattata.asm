	db RATTATA ; 019

	db  30,  56,  35,  72,  25,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 57 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 4 ; step cycles to hatch
	INCBIN "gfx/pokemon/rattata/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BIDE, BLIZZARD, BODY_SLAM, BUBBLEBEAM, CURSE, CUT, DEFENSE_CURL, DIG, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, ICY_WIND, IRON_TAIL, MIMIC, MUD_SLAP, PROTECT, RAGE, REST, RETURN, ROCK_SMASH, SHADOW_BALL, SLEEP_TALK, SNORE, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWIFT, THIEF, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, 
	; end
