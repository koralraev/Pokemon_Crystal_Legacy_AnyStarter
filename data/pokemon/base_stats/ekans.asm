	db EKANS ; 023

	db  40,  65,  44,  60,  40,  54
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 255 ; catch rate
	db 62 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/ekans/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BODY_SLAM, CURSE, DIG, DOUBLE_EDGE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, MEGA_DRAIN, MIMIC, PROTECT, RAGE, REST, RETURN, ROCK_SLIDE, SLEEP_TALK, SLUDGE_BOMB, SNORE, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, TOXIC
	; end
