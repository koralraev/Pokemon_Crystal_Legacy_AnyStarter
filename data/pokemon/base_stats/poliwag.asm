	db POLIWAG ; 060

	db  40,  50,  40,  90,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 255 ; catch rate
	db 77 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/poliwag/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BODY_SLAM, BUBBLEBEAM, CURSE, DEFENSE_CURL, DOUBLE_EDGE, DOUBLE_TEAM, DREAM_EATER, ENDURE, HEADBUTT, HIDDEN_POWER, ICE_BEAM, ICY_WIND, MIMIC, PROTECT, PSYCHIC_M, RAGE, RAIN_DANCE, REST, RETURN, SLEEP_TALK, SNORE, SUBSTITUTE, SURF, SWAGGER, THIEF, TOXIC, WATERFALL, WHIRLPOOL
	; end
