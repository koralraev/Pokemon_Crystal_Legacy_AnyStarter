BIND_TRAP_TURNS EQU 3
BIND_STACK_TURNS EQU 3

_BattleCommand_TrapStack:
; trapstack (used by BIND and WRAP)
	ld a, [wAttackMissed]
	and a
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	
;	call AnimateCurrentMove

	ldh a, [hBattleTurn]
	and a
	jr z, .TargetIsEnemy

.TargetIsPlayer:
	ld hl, wPlayerWrapCount
	ld a, [hl]
	and a
	jr nz, .PlayerAddStack

	ld [hl], BIND_TRAP_TURNS
	ld de, wPlayerTrappingMove
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	call .ShowTrapText

.PlayerAddStack:
	ld hl, wPlayerBindStack1Turns
	ld de, wPlayerScreens
	call .AddStack
	ret

.TargetIsEnemy:
	ld hl, wEnemyWrapCount
	ld a, [hl]
	and a
	jr nz, .EnemyAddStack

	ld [hl], BIND_TRAP_TURNS
	ld de, wEnemyTrappingMove
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	call .ShowTrapText

.EnemyAddStack:
	ld hl, wEnemyBindStack1Turns
	ld de, wEnemyScreens
	call .AddStack
	ret

.ShowTrapText:
	ld b, a
	ld hl, .Traps
.find_trap_text
	ld a, [hli]
	cp b
	jr z, .found_trap_text
	inc hl
	inc hl
	jr .find_trap_text
.found_trap_text
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextbox
	ret

.AddStack:
; hl = this side's BindStack1Turns (3 consecutive bytes)
; de = this side's Screens byte
	ld b, 0                   ; slot index 0-2
.find_free_slot
	ld a, [hl]
	and a
	jr z, .got_free_slot
	inc hl
	inc b
	ld a, b
	cp 3
	jr nz, .find_free_slot
	ret                        ; all 3 stacks already active

.got_free_slot
	ld a, BIND_STACK_TURNS
	ld [hl], a

	ld a, [de]
	ld c, a
	ld a, b
	and a
	jr z, .set_bit5
	dec a
	jr z, .set_bit6
	ld a, c
	set 7, a
	jr .store_screens
.set_bit5
	ld a, c
	set 5, a
	jr .store_screens
.set_bit6
	ld a, c
	set 6, a
.store_screens
	ld [de], a
	ret

.Traps:
	dbw BIND, UsedBindText
	dbw WRAP, WrappedByText
