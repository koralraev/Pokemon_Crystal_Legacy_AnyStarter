	db PORYGON ; 137

	db  65,  60,  70,  40,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 130 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/porygon/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm BLIZZARD, CURSE, DOUBLE_EDGE, DOUBLE_TEAM, DREAM_EATER, ENDURE, FLASH, HIDDEN_POWER, HYPER_BEAM, ICE_BEAM, ICY_WIND, IRON_TAIL, MIMIC, NIGHTMARE, PROTECT, PSYCHIC_M, PSYCH_UP, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, SLEEP_TALK, SNORE, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWIFT, TELEPORT, THIEF, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, TRI_ATTACK, ZAP_CANNON
	; end
