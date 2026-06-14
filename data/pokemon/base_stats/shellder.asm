	db SHELLDER ; 090

	db  35,  65, 100,  40,  45,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 190 ; catch rate
	db 97 ; base exp
	db PEARL, BIG_PEARL ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/shellder/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BUBBLEBEAM, CURSE, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, EXPLOSION, HIDDEN_POWER, ICE_BEAM, ICY_WIND, IRON_DEFENSE, MIMIC, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SNORE, SUBSTITUTE, SURF, SWAGGER, SWIFT, TELEPORT, TOXIC, TRI_ATTACK, WATERFALL, WHIRLPOOL
	; end
