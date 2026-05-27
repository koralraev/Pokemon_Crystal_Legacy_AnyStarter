	db GOLBAT ; 042

	db  75,  80,  70,  90,  65,  75
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 4 ; step cycles to hatch
	INCBIN "gfx/pokemon/golbat/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BIDE, CURSE, DETECT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, GIGA_DRAIN, HIDDEN_POWER, HYPER_BEAM, MEGA_DRAIN, MIMIC, NASTY_PLOT, PROTECT, RAGE, REST, RETURN, SLEEP_TALK, SLUDGE_BOMB, SNORE, STEEL_WING, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWIFT, THIEF, TOXIC, 
	; end
