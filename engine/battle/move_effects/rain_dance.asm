BattleCommand_StartRain:
; startrain
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	call GetUserItem
	ld a, [hl]
	cp DAMP_ROCK
	ld a, 8
	jr z, .got_duration
	ld a, 5
.got_duration
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextbox
