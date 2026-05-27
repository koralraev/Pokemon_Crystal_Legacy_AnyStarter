	db TAUROS ; 128

	db  75, 100,  95, 110,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 211 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/tauros/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BIDE, BLIZZARD, BODY_SLAM, CURSE, DOUBLE_EDGE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FIRE_BLAST, FLAMETHROWER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, IRON_TAIL, MIMIC, PROTECT, RAGE, REST, RETURN, ROCK_SMASH, SLEEP_TALK, SNORE, STRENGTH, SUBSTITUTE, SUNNY_DAY, SURF, SWAGGER, THUNDER, THUNDERBOLT, TOXIC, ZAP_CANNON
	; end
