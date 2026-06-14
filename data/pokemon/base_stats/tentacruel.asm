	db TENTACRUEL ; 073

	db  80,  70,  65, 100,  80, 120
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 60 ; catch rate
	db 205 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/tentacruel/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BUBBLEBEAM, CURSE, CUT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, GIGA_DRAIN, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, MEGA_DRAIN, MIMIC, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SLUDGE_BOMB, SNORE, SUBSTITUTE, SURF, SWAGGER, SWORDS_DANCE, TOXIC, WATERFALL, WHIRLPOOL
	; end
