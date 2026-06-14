	db OMASTAR ; 139

	db  70,  60, 125,  55, 115,  70
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 199 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 8 ; step cycles to hatch
	INCBIN "gfx/pokemon/omastar/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BODY_SLAM, BUBBLEBEAM, CURSE, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, IRON_DEFENSE, MIMIC, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, ROCK_SMASH, ROLLOUT, SANDSTORM, SEISMIC_TOSS, SLEEP_TALK, SNORE, SUBMISSION, SUBSTITUTE, SURF, SWAGGER, THIEF, TOXIC, WATERFALL, WHIRLPOOL
	; end
