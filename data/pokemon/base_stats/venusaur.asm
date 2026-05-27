	db VENUSAUR ; 003

	db  80,  82,  83,  80, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 208 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/venusaur/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm AMNESIA, ATTRACT, BIDE, BODY_SLAM, CURSE, CUT, DEFENSE_CURL, DOUBLE_EDGE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FLASH, FURY_CUTTER, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, MEGA_DRAIN, MIMIC, MUD_SLAP, PROTECT, RAGE, REFLECT, REST, RETURN, ROAR, SLEEP_TALK, SLUDGE_BOMB, SNORE, SOLARBEAM, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWEET_SCENT, SWORDS_DANCE, TOXIC
	; end
