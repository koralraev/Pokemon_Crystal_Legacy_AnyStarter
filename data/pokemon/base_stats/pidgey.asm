	db PIDGEY ; 016

	db  40,  45,  40,  56,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 55 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 4 ; step cycles to hatch
	INCBIN "gfx/pokemon/pidgey/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CURSE, DETECT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FLY, HEADBUTT, HIDDEN_POWER, MIMIC, MUD_SLAP, PROTECT, RAGE, REFLECT, REST, RETURN, SKY_ATTACK, SLEEP_TALK, SNORE, STEEL_WING, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWIFT, THIEF, TOXIC, 
	; end
