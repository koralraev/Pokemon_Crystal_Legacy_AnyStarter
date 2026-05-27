	db HITMONLEE ; 106

	db  50, 120,  58,  87,  35, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 139 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 6 ; step cycles to hatch
	INCBIN "gfx/pokemon/hitmonlee/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BIDE, BODY_SLAM, COUNTER, CURSE, DETECT, DOUBLE_EDGE, DOUBLE_TEAM, DYNAMICPUNCH, ENDURE, HEADBUTT, HIDDEN_POWER, MEGA_KICK, MEGA_PUNCH, METRONOME, MIMIC, MUD_SLAP, PROTECT, RAGE, REST, RETURN, ROCK_SMASH, SEISMIC_TOSS, SLEEP_TALK, SNORE, STRENGTH, SUBMISSION, SUBSTITUTE, SUNNY_DAY, SWAGGER, SWIFT, THIEF, TOXIC
	; end
