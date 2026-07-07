BattleCommand_Safeguard:
; safeguard

	ld hl, wPlayerScreens
	ld de, wPlayerSafeguardCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyScreens
	ld de, wEnemySafeguardCount
.ok
	bit SCREENS_SAFEGUARD, [hl]
	jr nz, .failed
	set SCREENS_SAFEGUARD, [hl]
	call GetUserItem
	ld a, [hl]
	cp CLEANSE_TAG
	ld a, 8
	jr z, .got_duration
	ld a, 5
.got_duration
	ld [de], a
	call AnimateCurrentMove
	ld hl, CoveredByVeilText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
