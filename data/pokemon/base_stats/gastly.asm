	db GASTLY ; 092

	db  30, 35,  30,  80,  100,  35
	;   hp  atk  def  spd  sat  sdf

	db GHOST, POISON ; type
	db 190 ; catch rate
	db 95 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/gastly/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CURSE, DOUBLE_TEAM, DREAM_EATER, ENDURE, EXPLOSION, GIGA_DRAIN, HIDDEN_POWER, MEGA_DRAIN, MIMIC, NIGHTMARE, PROTECT, PSYCHIC_M, PSYCH_UP, RAGE, RAIN_DANCE, REST, RETURN, SHADOW_BALL, SLEEP_TALK, SNORE, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, THUNDER, THUNDERBOLT, TOXIC, ZAP_CANNON
	; end
