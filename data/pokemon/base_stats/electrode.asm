	db ELECTRODE ; 101

	db  60,  50,  70, 140,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 150 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/electrode/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm BIDE, CURSE, DOUBLE_TEAM, ENDURE, EXPLOSION, FLASH, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, MIMIC, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, ROLLOUT, SLEEP_TALK, SNORE, SUBSTITUTE, SWAGGER, SWIFT, TELEPORT, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, ZAP_CANNON
	; end
