
_SandstormSpDefBoost:	;----- could possibly move but for now keep directly in effect_commands.asm
; First, check if Sandstorm is active.
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	ret nz

; Then, check the opponent's types.
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
.ok
	ld a, [hli]
	cp ROCK
	jr z, .start_boost
	ld a, [hl]
	cp ROCK
	ret nz

.start_boost
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld b, h
	ld c, l
	ret

_BattleCommand_CheckPowder:
; Checks if the move is powder/spore-based and 
; if the opponent is Grass-type
	ld a, BATTLE_VARS_MOVE_ANIM
	farcall GetBattleVar ; to farcall
	ld hl, PowderMoves
	farcall IsInByteArray ; to farcall
	ret nc

; Safety Goggles protects the target regardless of type
	farcall GetOpponentItem ; check the target of the moves held item
	ld a, [hl]
	cp GOGGLES
	jr z, .GogglesProtectedPowder

; If the opponent is Grass-type, the move fails.
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .CheckGrassType
	ld hl, wBattleMonType1

.CheckGrassType:
	ld a, [hli]
	cp GRASS
	jr z, .Immune
	ld a, [hl]
	cp GRASS
	ret nz
	;fallthrough
.Immune:
	ld a, 1
	ld [wAttackMissed], a
	ld hl, GrassTypeImmunePowderSporeText
	jp StdBattleTextbox
	ret
.GogglesProtectedPowder:
	ld a, 1
	ld [wAttackMissed], a
	ld hl, TargetProtectedByGogglesText
	jp StdBattleTextbox
	ret


INCLUDE "engine/battle/move_effects/magnitude.asm"
;INCLUDE "engine/battle/move_effects/baton_pass.asm" ; too complex to move
INCLUDE "engine/battle/move_effects/transform.asm"
INCLUDE "engine/battle/move_effects/beat_up.asm"

