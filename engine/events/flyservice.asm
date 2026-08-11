SECTION "PokemonCenterFlyService", ROMX

; handles animation and teleporting player character
; called from FlyService -> branch of FlyFunction->DoFly in engine/event/overworld.asm
FlyServiceScript::
	reloadmappart
	special UpdateTimePals
	playsound SFX_WARP_TO
	applymovement PLAYER, .TeleportFrom
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportTo
	callasm .RestorePlayerPalette
	end

.TeleportFrom:
	teleport_from
	step_end

.TeleportTo:
	teleport_to
	step_end

.RestorePlayerPalette:
	ld e, PAL_OW_RED
	farcall SetFirstOBJPalette
	ret

; handles opening flymap and selecting destination
FlyService::
	ld a, 1
;	ld [wUsingHMItem], a
	ld [wFlyingWithPC], a
	farcall FlyFunction ;lives in engine/event/overworld.asm. FlyFunction->DoFly branches to FlyServiceScript when "flying" using PokeCenter PC [wFlyingWithPC]
	ld a, [wFieldMoveSucceeded]
	cp $2
	jr z, .Fail
	cp $0
	jr z, .Error
	
	ld a, [wQueuedScriptBank]
	ld d, a
	ld a, [wQueuedScriptAddr]
	ld l, a
	ld a, [wQueuedScriptAddr + 1]
	ld h, a
	ld a, d
	call CallScript
	
	farcall StubbedTrainerRankings_Fly
	ld b, $4
	ld a, $2
	ret
.Fail:
	ld a, $3
	ret
.Error:
	ld a, $0
	ret

