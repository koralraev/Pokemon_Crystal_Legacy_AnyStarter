	db BULBASAUR ; 001

	db  45,  49,  49,  45,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 64 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/bulbasaur/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm AMNESIA, ATTRACT, BODY_SLAM, CURSE, CUT, DEFENSE_CURL, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FLASH, FURY_CUTTER, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, MEGA_DRAIN, MIMIC, MUD_SLAP, PROTECT, RAGE, REFLECT, REST, RETURN, SLEEP_TALK, SLUDGE_BOMB, SNORE, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWEET_SCENT, SWORDS_DANCE, TOXIC
	; end
