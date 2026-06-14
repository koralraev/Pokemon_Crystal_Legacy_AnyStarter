	db CLOYSTER ; 091

	db  50,  95, 180,  70,  85,  45
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db 60 ; catch rate
	db 203 ; base exp
	db PEARL, BIG_PEARL ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/cloyster/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, BUBBLEBEAM, CURSE, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, EXPLOSION, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, IRON_DEFENSE, MIMIC, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SNORE, SUBSTITUTE, SURF, SWAGGER, SWIFT, TELEPORT, TOXIC, TRI_ATTACK, WATERFALL, WHIRLPOOL
	; end
