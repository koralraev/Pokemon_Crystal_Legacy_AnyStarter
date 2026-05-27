	db PINSIR ; 127

	db  65, 125, 100,  85,  55,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 45 ; catch rate
	db 200 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 6 ; step cycles to hatch
	INCBIN "gfx/pokemon/pinsir/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BIDE, BODY_SLAM, CURSE, CUT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FURY_CUTTER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, IRON_DEFENSE, MIMIC, PROTECT, RAGE, REST, RETURN, ROCK_SMASH, SEISMIC_TOSS, SLEEP_TALK, SNORE, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, THIEF, TOXIC
	; end
