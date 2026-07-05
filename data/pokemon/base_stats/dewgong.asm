	db DEWGONG ; 087

	db  90,  60,  80,  70,  80,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db 75 ; catch rate
	db 176 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/dewgong/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HAIL, ATTRACT, BLIZZARD, BODY_SLAM, BUBBLEBEAM, CURSE, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, MIMIC, PAY_DAY, PROTECT, RAGE, RAIN_DANCE, REST, RETURN, SLEEP_TALK, SNORE, STRENGTH, SUBSTITUTE, SURF, SWAGGER, TOXIC, WATERFALL, WHIRLPOOL
	; end
