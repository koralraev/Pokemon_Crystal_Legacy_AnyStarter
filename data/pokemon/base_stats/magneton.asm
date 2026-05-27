	db MAGNETON ; 082

	db  50,  60,  95,  70, 120,  70
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db 60 ; catch rate
	db 161 ; base exp
	db NO_ITEM, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/magneton/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm BIDE, CURSE, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FLASH, HIDDEN_POWER, HYPER_BEAM, IRON_DEFENSE, MIMIC, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, ROLLOUT, SLEEP_TALK, SNORE, SUBSTITUTE, SWAGGER, SWIFT, TELEPORT, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, ZAP_CANNON
	; end
