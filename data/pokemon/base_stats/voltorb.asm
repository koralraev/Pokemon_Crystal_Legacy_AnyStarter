	db VOLTORB ; 100

	db  40,  30,  50, 100,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 103 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/voltorb/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, DOUBLE_TEAM, ENDURE, EXPLOSION, FLASH, HEADBUTT, HIDDEN_POWER, MIMIC, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, ROLLOUT, SLEEP_TALK, SNORE, SUBSTITUTE, SWAGGER, SWIFT, TELEPORT, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, ZAP_CANNON
	; end
