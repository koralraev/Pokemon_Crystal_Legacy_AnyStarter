	db STARYU ; 120

	db  30,  45,  55,  85,  70,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 225 ; catch rate
	db 106 ; base exp
	db STARDUST, STAR_PIECE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/staryu/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BUBBLEBEAM, CURSE, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FLASH, HIDDEN_POWER, ICE_BEAM, ICY_WIND, MIMIC, PROTECT, PSYCHIC_M, PSYCH_UP, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SNORE, SUBSTITUTE, SURF, SWAGGER, SWIFT, TELEPORT, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, TRI_ATTACK, WATERFALL, WHIRLPOOL, ZAP_CANNON
	; end
