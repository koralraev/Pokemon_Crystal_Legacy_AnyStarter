	db PARASECT ; 047

	db  60,  95,  80,  30,  60,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS ; type
	db 75 ; catch rate
	db 128 ; base exp
	db TINYMUSHROOM, BIG_MUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/parasect/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BODY_SLAM, CURSE, CUT, DIG, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FLASH, FURY_CUTTER, GIGA_DRAIN, HIDDEN_POWER, HYPER_BEAM, MEGA_DRAIN, MIMIC, PROTECT, RAGE, REFLECT, REST, RETURN, ROCK_SMASH, SLEEP_TALK, SLUDGE_BOMB, SNORE, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWEET_SCENT, SWORDS_DANCE, THIEF, TOXIC
	; end
