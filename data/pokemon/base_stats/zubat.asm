	db ZUBAT ; 041

	db  40,  45,  35,  55,  30,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 4 ; step cycles to hatch
	INCBIN "gfx/pokemon/zubat/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BIDE, CURSE, DETECT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, GIGA_DRAIN, HIDDEN_POWER, MEGA_DRAIN, MIMIC, NASTY_PLOT, PROTECT, RAGE, REST, RETURN, SLEEP_TALK, SLUDGE_BOMB, SNORE, STEEL_WING, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWIFT, THIEF, TOXIC, 
	; end
