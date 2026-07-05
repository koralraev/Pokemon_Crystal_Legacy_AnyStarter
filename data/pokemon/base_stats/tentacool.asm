	db TENTACOOL ; 072

	db  40,  40,  35,  70,  50, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 190 ; catch rate
	db 105 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/tentacool/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HAIL, ATTRACT, BLIZZARD, BUBBLEBEAM, CURSE, CUT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, GIGA_DRAIN, HIDDEN_POWER, ICE_BEAM, ICY_WIND, MEGA_DRAIN, MIMIC, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SLUDGE_BOMB, SNORE, SUBSTITUTE, SURF, SWAGGER, SWORDS_DANCE, TOXIC, WATERFALL, WHIRLPOOL
	; end
