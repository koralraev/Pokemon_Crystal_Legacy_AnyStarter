	db WEEZING ; 110

	db  75,  90, 120,  60,  85,  70
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 60 ; catch rate
	db 173 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/weezing/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BIDE, CURSE, DOUBLE_TEAM, ENDURE, EXPLOSION, FIRE_BLAST, FLAMETHROWER, HIDDEN_POWER, HYPER_BEAM, MIMIC, PROTECT, RAGE, REST, RETURN, ROLLOUT, SLEEP_TALK, SLUDGE_BOMB, SNORE, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, TOXIC, ZAP_CANNON
	; end
