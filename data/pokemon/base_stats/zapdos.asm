	db ZAPDOS ; 145

	db  90,  90,  85, 100, 125,  90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/zapdos/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, DETECT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FLASH, FLY, HIDDEN_POWER, HYPER_BEAM, MIMIC, MUD_SLAP, NASTY_PLOT, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SMASH, SANDSTORM, SKY_ATTACK, SLEEP_TALK, SNORE, STEEL_WING, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWIFT, THUNDER, THUNDERBOLT, THUNDER_WAVE, TOXIC, ZAP_CANNON
	; end
