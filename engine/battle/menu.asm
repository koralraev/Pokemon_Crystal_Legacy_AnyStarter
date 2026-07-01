LoadBattleMenu:
	xor a
	ld [wBattleMenuStartPressed], a

.loop
	call ClearBattleMenuStrip
	ld hl, BattleMenuHeader
	call LoadMenuHeader
	ld a, [wBattleMenuCursorPosition]
	ld [wMenuCursorPosition], a

	ld a, 1
	ld [wBattleMenuStartEnabled], a

	call InterpretBattleMenu

	ld a, [wMenuCursorPosition]
	ld [wBattleMenuCursorPosition], a
	call ExitMenu

	ld a, [wBattleMenuStartPressed]
	and a
	jr z, .done

	xor a
	ld [wBattleMenuStartPressed], a
	call ShowBattleStatStages
	jr .loop

.done
	xor a
	ld [wBattleMenuStartEnabled], a
	ret

SafariBattleMenu: ; unreferenced
	ld hl, SafariBattleMenuHeader
	call LoadMenuHeader
	jr CommonBattleMenu

ContestBattleMenu:
	ld hl, ContestBattleMenuHeader
	call LoadMenuHeader
	; fallthrough

CommonBattleMenu:
	ld a, [wBattleMenuCursorPosition]
	ld [wMenuCursorPosition], a
	call _2DMenu
	ld a, [wMenuCursorPosition]
	ld [wBattleMenuCursorPosition], a
	call ExitMenu
	ret

BattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba .Text
	dbw BANK(@), NULL

.Text:
	db "FIGHT@"
	db "<PKMN>@"
	db "PACK@"
	db "RUN@"

SafariBattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba .Text
	dba .PrintSafariBallsRemaining

.Text:
	db "サファりボール×　　@" ; "SAFARI BALL×  @"
	db "エサをなげる@" ; "THROW BAIT"
	db "いしをなげる@" ; "THROW ROCK"
	db "にげる@" ; "RUN"

.PrintSafariBallsRemaining:
	hlcoord 17, 13
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

ContestBattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 2, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba .Text
	dba .PrintParkBallsRemaining

.Text:
	db "FIGHT@"
	db "<PKMN>@"
	db "PARKBALL×  @"
	db "RUN@"

.PrintParkBallsRemaining:
	hlcoord 13, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
	
; blanks the entire battle menu text
ClearBattleMenuStrip:
;	hlcoord 0, 12	; top row of battle menu
;	ld c, 20
;	call .ClearRow
	hlcoord 1, 13
	ld c, 19
	call .ClearRow
	hlcoord 1, 14
	ld c, 19
	call .ClearRow
	hlcoord 1, 15
	ld c, 19
	call .ClearRow
	hlcoord 1, 16
	ld c, 19
	call .ClearRow
;	hlcoord 0, 17	;bottom row of battle menu
;	ld c, 20
;	call .ClearRow
	ret

.ClearRow:
	ld a, " "
	ld [hli], a
	dec c
	jr nz, .ClearRow
	ret
	
; =======================================================================
; ShowBattleStatStages
; Draws a box over the same bottom strip the battle menu uses, showing
; the player's current stat stage modifiers (-6 to +6). Waits for any
; button press, then returns.
; =======================================================================
ShowBattleStatStages:
	push af
	push bc
	push de
	push hl
	
	call ClearBattleMenuStrip
	hlcoord 0, 12
	lb bc, 4, 18
	call MenuBox

	; Left column: attack, sp.attack, speed, evasion
	hlcoord 2, 13
	ld de, .LabelATK
	call PlaceString
	hlcoord 5, 13
	ld a, [wPlayerAtkLevel]
	call .PrintStage

	hlcoord 2, 14
	ld de, .LabelSPA
	call PlaceString
	hlcoord 5, 14
	ld a, [wPlayerSAtkLevel]
	call .PrintStage

	hlcoord 2, 15
	ld de, .LabelSPE
	call PlaceString
	hlcoord 5, 15
	ld a, [wPlayerSpdLevel]
	call .PrintStage

	hlcoord 2, 16
	ld de, .LabelEVA
	call PlaceString
	hlcoord 5, 16
	ld a, [wPlayerEvaLevel]
	call .PrintStage

	; center column: def, sp.def, acc, mist
	hlcoord 9, 13 ; 11
	ld de, .LabelDEF
	call PlaceString
	hlcoord 12, 13 ; 15
	ld a, [wPlayerDefLevel]
	call .PrintStage

	hlcoord 9, 14
	ld de, .LabelSPD
	call PlaceString
	hlcoord 12, 14
	ld a, [wPlayerSDefLevel]
	call .PrintStage

	hlcoord 9, 15
	ld de, .LabelACC
	call PlaceString
	hlcoord 12, 15
	ld a, [wPlayerAccLevel]
	call .PrintStage
	
	hlcoord 9, 16
	ld de, .LabelMST
	call PlaceString
	hlcoord 13, 16
	ld a, [wPlayerSubStatus4] ; mist
	call .PrintMist
	
	; right column: remaining: weather, safeguard, light screen, reflect
	hlcoord 15, 13
	ld de, .LabelWEA
	call PlaceString
	hlcoord 18, 13
	ld a, [wWeatherCount]
	call .PrintCount
	
	hlcoord 15, 14
	ld de, .LabelSG
	call PlaceString
	hlcoord 18, 14
	ld a, [wPlayerSafeguardCount]
	call .PrintCount
	
	hlcoord 15, 15
	ld de, .LabelLS
	call PlaceString
	hlcoord 18, 15
	ld a, [wPlayerLightScreenCount]
	call .PrintCount
	
	hlcoord 15, 16
	ld de, .LabelREF
	call PlaceString
	hlcoord 18, 16
	ld a, [wPlayerReflectCount]
	call .PrintCount
	
	call UpdateSprites
	call ApplyTilemap

.wait:
	call JoyTextDelay
	call GetMenuJoypad
	and a
	jr z, .wait

	pop hl
	pop de
	pop bc
	pop af
	ret

; Input : A = raw stage level (0-12, 6 = neutral)
;         HL = destination tile address
; Output: writes sign tile then digit tile
.PrintStage:
	sub 7
	jr z, .stage_zero
	jr c, .stage_negative

.stage_positive:
	push af
	ld a, "+"
	ld [hli], a
	pop af
	add a, "0"
	ld [hl], a
	ret

.stage_zero:
	ld a, " "
	ld [hli], a
	ld a, "0"
	ld [hl], a
	ret

.stage_negative:
	push af
	ld a, "-"
	ld [hli], a
	pop af
	cpl
	inc a
	add a, "0"
	ld [hl], a
	ret
	
; Input : A = remaining turn count (0 = inactive)
;         HL = destination tile address
; Output: writes ONE tile: "1"-"9" for active, "-" for zero/inactive
.PrintCount:
	and a
	jr z, .count_inactive
	add a, "0"
	ld [hl], a
	ret
.count_inactive:
	ld a, "-"
	ld [hl], a
	ret
	

; Input : A = substatus byte
;         HL = destination tile address
; Output: writes ONE tile: "+" if mist active, "-" if not
.PrintMist:
	and a
	jr z, .mist_off
	ld a, "+"
	ld [hl], a
	ret
.mist_off:
	ld a, "-"
	ld [hl], a
	ret

.LabelATK:
	db "ATK@"
.LabelDEF:
	db "DEF@"
.LabelSPA:
	db "SPA@"
.LabelSPD:
	db "SPD@"
.LabelSPE:
	db "SPE@"
.LabelACC:
	db "ACC@"
.LabelEVA:
	db "EVA@"
.LabelWEA:
	db "WEA@"
.LabelSG:
	db "SG @"
.LabelLS:
	db "LS @"
.LabelREF:
	db "REF@"
.LabelMST:
	db "MST@"
