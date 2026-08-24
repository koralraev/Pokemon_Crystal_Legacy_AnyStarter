_BattleCommand_ArenaTrap:
; arenatrap

; Doesn't work on an absent opponent.

	farcall CheckHiddenOpponent ; was call
	jr nz, .failed

; Don't trap if the opponent is already trapped.

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_CANT_RUN, [hl]
	jr nz, .failed

; Otherwise trap the opponent.

	set SUBSTATUS_CANT_RUN, [hl]
	farcall AnimateCurrentMove ;call
	ld hl, CantEscapeNowText
	jp StdBattleTextbox

.failed
	farcall AnimateFailedMove
	farcall PrintButItFailed ;jp
	ret ;remember to add return otherwise game crash
