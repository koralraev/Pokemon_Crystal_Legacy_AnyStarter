	db BEEDRILL ; 015

	db  65,  80,  40,  75,  45,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 45 ; catch rate
	db 159 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 4 ; step cycles to hatch
	INCBIN "gfx/pokemon/beedrill/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BIDE, CURSE, CUT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FURY_CUTTER, GIGA_DRAIN, HIDDEN_POWER, HYPER_BEAM, IRON_DEFENSE, MEGA_DRAIN, MIMIC, PROTECT, RAGE, REFLECT, REST, RETURN, SLEEP_TALK, SLUDGE_BOMB, SNORE, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWEET_SCENT, SWIFT, SWORDS_DANCE, TOXIC
	; end
