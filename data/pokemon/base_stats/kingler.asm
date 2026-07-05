	db KINGLER ; 099

	db  55, 130, 115,  75,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 206 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/kingler/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HAIL, AMNESIA, ATTRACT, BLIZZARD, BODY_SLAM, BUBBLEBEAM, CURSE, CUT, DIG, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FURY_CUTTER, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, IRON_DEFENSE, MIMIC, MUD_SLAP, PROTECT, RAGE, RAIN_DANCE, REST, RETURN, ROCK_SMASH, SLEEP_TALK, SNORE, STRENGTH, SUBSTITUTE, SURF, SWAGGER, SWORDS_DANCE, THIEF, TOXIC, WATERFALL, WHIRLPOOL
	; end
