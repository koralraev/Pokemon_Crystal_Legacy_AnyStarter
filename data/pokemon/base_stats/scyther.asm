	db SCYTHER ; 123

	db  70, 110,  80, 105,  55,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 187 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 6 ; step cycles to hatch
	INCBIN "gfx/pokemon/scyther/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BIDE, CURSE, CUT, DETECT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FURY_CUTTER, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, MIMIC, PROTECT, RAGE, REST, RETURN, ROCK_SMASH, SLEEP_TALK, SNORE, STEEL_WING, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWIFT, SWORDS_DANCE, THIEF, TOXIC
	; end
