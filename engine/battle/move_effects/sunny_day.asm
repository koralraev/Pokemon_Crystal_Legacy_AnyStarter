BattleCommand_StartSun:
; startsun
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	call GetUserItem
	ld a, [hl]
	cp HEAT_ROCK
	ld a, 8
	jr z, .got_duration
	ld a, 5
.got_duration
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextbox
