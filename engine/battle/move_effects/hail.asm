BattleCommand_StartHail:
; starthail

	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .failed
	
	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	call GetUserItem
	ld a, [hl]
	cp ICY_ROCK
	ld a, 8
	jr z, .got_duration
	ld a, 5
.got_duration
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, ItStartedToHailText
	jp StdBattleTextbox
	
.failed
	call AnimateFailedMove
	jp PrintButItFailed
