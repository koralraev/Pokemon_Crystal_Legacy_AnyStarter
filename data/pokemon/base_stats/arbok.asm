	db ARBOK ; 024

	db  62,  95,  69,  90,  65,  79
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 90 ; catch rate
	db 147 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/arbok/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BODY_SLAM, CURSE, DIG, DOUBLE_EDGE, DOUBLE_TEAM, EARTHQUAKE, ENDURE, GIGA_DRAIN, HEADBUTT, HIDDEN_POWER, HYPER_BEAM, MEGA_DRAIN, MIMIC, PROTECT, RAGE, REST, RETURN, ROCK_SLIDE, SLEEP_TALK, SLUDGE_BOMB, SNORE, STRENGTH, SUBSTITUTE, SUNNY_DAY, SWAGGER, THIEF, TOXIC
	; end
