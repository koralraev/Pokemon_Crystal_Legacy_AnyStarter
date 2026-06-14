	db MOLTRES ; 146

	db  90, 100,  90,  90, 125,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 217 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/moltres/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, DETECT, DOUBLE_EDGE, DOUBLE_TEAM, ENDURE, FIRE_BLAST, FLAMETHROWER, FLY, HIDDEN_POWER, HYPER_BEAM, MIMIC, MUD_SLAP, NASTY_PLOT, PROTECT, RAGE, RAIN_DANCE, REFLECT, REST, RETURN, ROAR, ROCK_SMASH, SANDSTORM, SKY_ATTACK, SLEEP_TALK, SNORE, SOLARBEAM, STEEL_WING, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWIFT, TOXIC, 
	; end
