	db EXEGGCUTE ; 102

	db  60,  40,  80,  40,  60,  45
	;   hp  atk  def  spd  sat  sdf

	db GRASS, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 98 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/exeggcute/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CURSE, DOUBLE_EDGE, DOUBLE_TEAM, DREAM_EATER, EGG_BOMB, ENDURE, EXPLOSION, FLASH, GIGA_DRAIN, HIDDEN_POWER, MIMIC, NIGHTMARE, PROTECT, PSYCHIC_M, PSYCH_UP, RAGE, REFLECT, REST, RETURN, ROLLOUT, SLEEP_TALK, SLUDGE_BOMB, SNORE, SOLARBEAM, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWORDS_DANCE, TELEPORT, THIEF, TOXIC
	; end
