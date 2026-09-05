_BattleCommand_Roost:
	lb bc, FLYING, CURSE_TYPE

	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .got_types
	ld hl, wEnemyMonType1
.got_types
	; both types Flying (pure Flying-type)?
	ld a, [hli]
	cp b
	jr nz, .not_double_flying
	ld a, [hld]
	cp b
	jr z, .pure_flying
.not_double_flying
	; hl points at whichever slot still needs checking
	ld a, [hl]
	cp b
	ret nz ; no Flying type present at all — just heal, nothing to remove
	ld [hl], c
	jr .set_flag
.pure_flying
	; pure Flying temporarily becomes Normal, like in later games
	ld a, NORMAL
	ld [hli], a
	ld [hl], a
.set_flag
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_ROOST, [hl]
	ret
