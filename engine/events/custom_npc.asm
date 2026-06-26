SECTION "Custom NPC Giver", ROMX

CustomNPC_SelectPokemonUI::
	call FadeToMenu
	ld a, 1
	ld [wPokedexSelectionMode], a
	farcall Pokedex
	xor a
	ld [wPokedexSelectionMode], a
	ld a, [wScriptVar]
	ld [wCurPartySpecies], a
	call CloseSubmenu
	ret

CustomNPC_StoreLevel::
	ld a, [wScriptVar]
	ld [wCurPartyLevel], a
	ret

CustomNPC_SetShiny::
	ld a, 1
	ld [wForceShiny], a
	ret

CustomNPC_ClearShiny::
	xor a
	ld [wForceShiny], a
	ret

CustomNPC_SelectLevelUI::
	call LoadStandardMenuHeader
	hlcoord 6, 8
	ld b, 2
	ld c, 6
	call Textbox
	
	ld a, 5
	ld [wScriptVar], a ; Default level 5

.loop
	call .DrawLevel
	
	ld a, 1
	ldh [hBGMapMode], a
	
	call DelayFrame
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and B_BUTTON
	jr nz, .cancel
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .confirm

	ldh a, [hJoyPressed]
	and D_UP
	jr nz, .up
	ldh a, [hJoyPressed]
	and D_DOWN
	jr nz, .down
	ldh a, [hJoyPressed]
	and D_RIGHT
	jr nz, .up10
	ldh a, [hJoyPressed]
	and D_LEFT
	jr nz, .down10
	jr .loop

.up
	ld a, [wScriptVar]
	cp 100
	jr z, .loop
	inc a
	ld [wScriptVar], a
	jr .loop
	
.up10
	ld a, [wScriptVar]
	add a, 10
	cp 101
	jr c, .up10store
	ld a, 100
.up10store
	ld [wScriptVar], a
	jr .loop

.down
	ld a, [wScriptVar]
	cp 1
	jr z, .loop
	dec a
	ld [wScriptVar], a
	jr .loop

.down10
	ld a, [wScriptVar]
	cp 11
	jr nc, .down10sub
	ld a, 1
	jr .down10store
.down10sub
	sub 10
.down10store
	ld [wScriptVar], a
	jr .loop

.cancel
	xor a
	ld [wScriptVar], a
	call CloseWindow
	ret

.confirm
	call CloseWindow
	ret

.DrawLevel:
	hlcoord 7, 9
	ld de, .LevelString
	call PlaceString
	hlcoord 10, 9
	ld de, wScriptVar
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

.LevelString:
	db "Lv.@"

CustomNPC_GivePokemon::
	ld a, 0
	ld [wCurItem], a
	ld b, 0
	farcall GivePoke
	ret

