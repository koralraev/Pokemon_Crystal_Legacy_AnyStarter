BattleCommand_Mimic:
; mimic

	call ClearLastMove
	call BattleCommand_MoveDelay
	ld a, [wAttackMissed]
	and a
	jp nz, .fail

	call CheckHiddenOpponent
	jp nz, .fail

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn

	ld a, 1
	ld [wMoveSelectionMenuType], a
	farcall MoveSelectionScreen
	push af
	push bc
	call SafeLoadTempTilemapToTilemap
	call UpdateBattleHuds
	pop bc
	pop af
	jp nz, .fail
	ld a, b
	ld hl, wEnemyMonMoves
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	jr .got_move

.enemy_turn
	ld hl, wBattleMonMoves
.random_loop
	call BattleRandom
	and 3
	ld c, a
	ld b, 0
	push hl
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .random_loop

.got_move
	and a
	jp z, .fail
	cp STRUGGLE
	jp z, .fail
	ld b, a

	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn_2
	ld hl, wEnemyMonMoves
.player_turn_2
	ld c, NUM_MOVES
.check_already_knows_move
	ld a, [hli]
	cp b
	jp z, .fail
	dec c
	jr nz, .check_already_knows_move
	dec hl
.find_mimic
	ld a, [hld]
	cp MIMIC
	jr nz, .find_mimic
	inc hl
	ld a, b
	ld [hl], a
	ld [wNamedObjectIndex], a
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld [hl], 5
	call GetMoveName
	;call AnimateCurrentMove ; skips mimics animation but enables learning and using selected move correctly
	ld hl, MimicLearnedMoveText
	call StdBattleTextbox

	ld a, [wNamedObjectIndex]
	ld b, a
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld [hl], b
	call UpdateMoveData
	jp ResetTurn

.fail
	jp FailMimic

