GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE   EQU 700
GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE EQU 300
TUTORMONEYPAYAMOUNT EQU 5000

	object_const_def
	const GOLDENRODUNDERGROUND_SUPER_NERD1
	const GOLDENRODUNDERGROUND_SUPER_NERD2
	const GOLDENRODUNDERGROUND_SUPER_NERD3
	const GOLDENRODUNDERGROUND_SUPER_NERD4
	const GOLDENRODUNDERGROUND_POKE_BALL
	const GOLDENRODUNDERGROUND_GRAMPS
	const GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	const GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	const GOLDENRODUNDERGROUND_GRANNY
	const GOLDENRODUNDERGROUND_MAX_ELDER

GoldenrodUnderground_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .ResetSwitches
	callback MAPCALLBACK_TILES, .CheckBasementKey
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeek

.ResetSwitches:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	endcallback

.CheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	endcallback

.LockBasementDoor:
	changeblock 18, 6, $3d ; locked door
	endcallback

.CheckDayOfWeek:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday

; Sunday
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Monday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	checktime MORN
	iffalse .NotMondayMorning
	appear GOLDENRODUNDERGROUND_GRAMPS
.NotMondayMorning:
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Tuesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Wednesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Thursday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Friday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Saturday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_OLDER_HAIRCUT_BROTHER
	disappear GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

TrainerSupernerdEric:
	trainer SUPER_NERD, ERIC, EVENT_BEAT_SUPER_NERD_ERIC, SupernerdEricSeenText, SupernerdEricBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdEricAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTeru:
	trainer SUPER_NERD, TERU, EVENT_BEAT_SUPER_NERD_TERU, SupernerdTeruSeenText, SupernerdTeruBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTeruAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacIssac:
	trainer POKEMANIAC, ISSAC, EVENT_BEAT_POKEMANIAC_ISSAC, PokemaniacIssacSeenText, PokemaniacIssacBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacIssacAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacDonald:
	trainer POKEMANIAC, DONALD, EVENT_BEAT_POKEMANIAC_DONALD, PokemaniacDonaldSeenText, PokemaniacDonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacDonaldAfterBattleText
	waitbutton
	closetext
	end

BitterMerchantScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .Open
	ifequal SATURDAY, .Open
	sjump GoldenrodUndergroundScript_ShopClosed

.Open:
	pokemart MARTTYPE_BITTER, MART_UNDERGROUND
	closetext
	end

BargainMerchantScript:
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	iftrue GoldenrodUndergroundScript_ShopClosed
	readvar VAR_WEEKDAY
	ifequal MONDAY, .CheckMorn
	sjump GoldenrodUndergroundScript_ShopClosed

.CheckMorn:
	checktime MORN
	iffalse GoldenrodUndergroundScript_ShopClosed
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end

OlderHaircutBrotherScript:
	opentext
	.DoHairCut
;	readvar VAR_WEEKDAY
;	ifequal TUESDAY, .DoHaircut
;	ifequal THURSDAY, .DoHaircut
;	ifequal SATURDAY, .DoHaircut
;	sjump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
;	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
;	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText
	promptbutton
	special OlderHaircutBrother
	sjump .then
;	ifequal $0, .Refused
;	ifequal $1, .Refused
;	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
;	ifequal $2, .two
;	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.then
	takemoney YOUR_MONEY, GOLDENRODUNDERGROUND_OLDER_HAIRCUT_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundOlderHaircutBrotherAllDoneText
	waitbutton
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext GoldenrodUndergroundOlderHaircutBrotherThatsAShameText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodUndergroundOlderHaircutBrotherYoullNeedMoreMoneyText
	waitbutton
	closetext
	end

YoungerHaircutBrotherScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .DoHaircut
	ifequal WEDNESDAY, .DoHaircut
	ifequal FRIDAY, .DoHaircut
	sjump GoldenrodUndergroundScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText
	promptbutton
	special YoungerHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.then
	takemoney YOUR_MONEY, GOLDENRODUNDERGROUND_YOUNGER_HAIRCUT_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundYoungerHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	writetext GoldenrodUndergroundYoungerHaircutBrotherHowDisappointingText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodUndergroundYoungerHaircutBrotherShortOnFundsText
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext GoldenrodUndergroundYoungerHaircutBrotherOneHaircutADayText
	waitbutton
	closetext
	end
	

EitherHaircutBrotherScript_SlightlyHappier:
	writetext HaircutBrosText_SlightlyHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_Happier:
	writetext HaircutBrosText_Happier
	special PlayCurMonCry
	waitbutton
	closetext
	end

EitherHaircutBrotherScript_MuchHappier:
	writetext HaircutBrosText_MuchHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

BasementDoorScript::
	opentext
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext GoldenrodUndergroundTheDoorsLockedText
	waitbutton
	closetext
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext GoldenrodUndergroundBasementKeyOpenedDoorText
	waitbutton
	closetext
	changeblock 18, 6, $2e ; unlocked door
	reloadmappart
	closetext
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext GoldenrodUndergroundTheDoorIsOpenText
	waitbutton
	closetext
	end

GoldenrodUndergroundScript_ShopClosed:
	writetext GoldenrodUndergroundWeAreNotOpenTodayText
	waitbutton
	closetext
	end

GoldenrodUndergroundCoinCase:
	itemball COIN_CASE

GoldenrodUndergroundNoEntrySign:
	jumptext GoldenrodUndergroundNoEntryText

GoldenrodUndergroundHiddenParlyzHeal:
	hiddenitem PARLYZ_HEAL, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_PARLYZ_HEAL

GoldenrodUndergroundHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_SUPER_POTION

GoldenrodUndergroundHiddenAntidote:
	hiddenitem ANTIDOTE, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_ANTIDOTE
	
	
ShadyTmGuyMoveTutorScript:
	faceplayer
	opentext
	writetext TutorAskTeachAMoveText
	yesorno
	iffalse .Refused
	special PlaceMoneyTopRight
	writetext TutorAskMoneyOkayText
	yesorno
	iffalse .RefusePay
	checkmoney YOUR_MONEY, TUTORMONEYPAYAMOUNT
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext TutorWhichMoveShouldITeachText
	
.Page1:
	loadmenu .MoveMenuHeaderPage1
	verticalmenu
	closewindow
	ifequal 1, .MegaPunch
	ifequal 2, .MegaKick
	ifequal 3, .BodySlam
	ifequal 4, .DoubleEdge
	ifequal 5, .Bubblebeam
	ifequal 6, .Page2
	sjump .Refused
	
.Page2:
	loadmenu .MoveMenuHeaderPage2
	verticalmenu
	closewindow
	ifequal 1, .Icebeam
	ifequal 2, .PayDay
	ifequal 3, .Submission
	ifequal 4, .Counter
	ifequal 5, .SeismicToss
	ifequal 6, .Page3
	sjump .Refused
	
.Page3:
	loadmenu .MoveMenuHeaderPage3
	verticalmenu
	closewindow
	ifequal 1, .Rage
	ifequal 2, .MegaDrain
	ifequal 3, .DragonRage
	ifequal 4, .Thunderbolt
	ifequal 5, .Teleport
	ifequal 6, .Page4
	sjump .Refused
	
.Page4:
	loadmenu .MoveMenuHeaderPage4
	verticalmenu
	closewindow
	ifequal 1, .Mimic
	ifequal 2, .Reflect
	ifequal 3, .Bide
	ifequal 4, .Metronome
	ifequal 5, .EggBomb
	ifequal 6, .Page5
	sjump .Refused
	
.Page5:
	loadmenu .MoveMenuHeaderPage5
	verticalmenu
	closewindow
	ifequal 1, .Softboiled
	ifequal 2, .SkyAttack
	ifequal 3, .Explosion
	ifequal 4, .RockSlide
	ifequal 5, .TriAttack
	ifequal 6, .Substitute
	sjump .Refused
	

; --- moves for the menu pages
.MegaPunch:
	setval MEGA_PUNCH
	sjump .TeachMove2
	
.MegaKick:
	setval MEGA_KICK
	sjump .TeachMove2
	
.BodySlam:
	setval BODY_SLAM
	sjump .TeachMove2
	
.DoubleEdge:
	setval DOUBLE_EDGE
	sjump .TeachMove2
	
.Bubblebeam:
	setval BUBBLEBEAM
	sjump .TeachMove2
	
.Icebeam:
	setval ICE_BEAM
	sjump .TeachMove2
	
.PayDay:
	setval PAY_DAY
	sjump .TeachMove2
	
.Submission:
	setval SUBMISSION
	sjump .TeachMove2
	
.Counter:
	setval COUNTER
	sjump .TeachMove2
	
.SeismicToss:
	setval SEISMIC_TOSS
	sjump .TeachMove2
	
.Rage:
	setval RAGE
	sjump .TeachMove2

.MegaDrain:
	setval MEGA_DRAIN
	sjump .TeachMove2

.DragonRage:
	setval DRAGON_RAGE
	sjump .TeachMove2

.Thunderbolt:
	setval THUNDERBOLT
	sjump .TeachMove2	
	
.Teleport:
	setval TELEPORT
	sjump .TeachMove2
	
.Mimic:
	setval MIMIC
	sjump .TeachMove2
	
.Reflect:
	setval REFLECT
	sjump .TeachMove2
	
.Bide:
	setval BIDE
	sjump .TeachMove2
	
.Metronome:
	setval METRONOME
	sjump .TeachMove2
	
.EggBomb:
	setval EGG_BOMB
	sjump .TeachMove2
	
.Softboiled:
	setval SOFTBOILED
	sjump .TeachMove2
	
.SkyAttack:
	setval SKY_ATTACK
	sjump .TeachMove2
	
.Explosion:
	setval EXPLOSION
	sjump .TeachMove2
	
.RockSlide:
	setval ROCK_SLIDE
	sjump .TeachMove2
	
.TriAttack:
	setval TRI_ATTACK
	sjump .TeachMove2
	
.Substitute:
	setval SUBSTITUTE
	sjump .TeachMove2
	
.NotEnoughMoney:
	writetext TutorShortOnFundsText
	waitbutton
	closetext
	end

.Refused:
	writetext TutorRefusedText
	waitbutton
	closetext
	end
	
.RefusePay: 
	writetext TutorRefusePayText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext TutorIncompatibleText
	waitbutton
	closetext
	end
	
.Cancel:
	writetext TutorFarewellText
	waitbutton
	closetext
	end


.TeachMove2:
	writetext TutorTeachMoveText
	waitbutton
	special MoveTutor
	ifequal FALSE, .MoveTaught
	closetext
	end
	
.MoveTaught:
	takemoney YOUR_MONEY, TUTORMONEYPAYAMOUNT
	special PlaceMoneyTopRight
	writetext TutorToughtMoveText	
	waitbutton
	closetext
	end
	
.MoveMenuHeaderPage1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y
	dw .MenuDataPage1
	db 1 ; default option

.MenuDataPage1:
	db STATICMENU_CURSOR ; flags
	db 6 ; items + cancel options
	db "MEGA PUNCH@"
	db "MEGA KICK@"
	db "BODY SLAM@"
	db "DOUBLE EDGE@"
	db "BUBBLEBEAM@"
	db "NEXT@"
	
.MoveMenuHeaderPage2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y
	dw .MenuDataPage2
	db 1 ; default option
	
.MenuDataPage2:
	db STATICMENU_CURSOR ; flags
	db 6 ; items + cancel options
	db "ICE BEAM@"
	db "PAY DAY@"
	db "SUBMISSION@"
	db "COUNTER@"
	db "SEISMIC TOSS@"
	db "NEXT@"
	
.MoveMenuHeaderPage3:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y
	dw .MenuDataPage3
	db 1 ; default option
	
.MenuDataPage3:
	db STATICMENU_CURSOR ; flags
	db 6 ; items + cancel options
	db "RAGE@"
	db "MEGA DRAIN@"
	db "DRAGON RAGE@"
	db "THUNDERBOLT@"
	db "TELEPORT@"
	db "NEXT@"
	
.MoveMenuHeaderPage4:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y
	dw .MenuDataPage4
	db 1 ; default option
	
.MenuDataPage4:
	db STATICMENU_CURSOR ; flags
	db 6 ; items + cancel options
	db "MIMIC@"
	db "REFLECT@"
	db "BIDE@"
	db "METRONOME@"
	db "EGG BOMB@"
	db "NEXT@"
	
.MoveMenuHeaderPage5:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y
	dw .MenuDataPage5
	db 1 ; default option
	
.MenuDataPage5:
	db STATICMENU_CURSOR ; flags
	db 6 ; items + cancel options
	db "SOFTBOILED@"
	db "SKY ATTACK@"
	db "EXPLOSION@"
	db "ROCK SLIDE@"
	db "TRI ATTACK@"
	db "SUBSTITUTE@"

SupernerdEricSeenText:
	text "I got booted out"
	line "of the GAME COR-"
	cont "NER."

	para "I was trying to"
	line "cheat using my"
	cont "#MON…"
	done

SupernerdEricBeatenText:
	text "…Grumble…"
	done

SupernerdEricAfterBattleText:
	text "I guess I have to"
	line "do things fair and"
	cont "square…"
	done

SupernerdTeruSeenText:
	text "Do you consider"
	line "type alignments in"
	cont "battle?"

	para "If you know your"
	line "type advantages,"

	para "you'll do better"
	line "in battle."
	done

SupernerdTeruBeatenText:
	text "Ow, ow, ow!"
	done

SupernerdTeruAfterBattleText:
	text "I know my #MON"
	line "type alignments."

	para "But I only use one"
	line "type of #MON."
	done

PokemaniacIssacSeenText:
	text "My #MON just"
	line "got a haircut!"

	para "I'll show you how"
	line "strong it is!"
	done

PokemaniacIssacBeatenText:
	text "Aiyeeee!"
	done

PokemaniacIssacAfterBattleText:
	text "Your #MON will"
	line "like you more if"

	para "you give them"
	line "haircuts."
	done

PokemaniacDonaldSeenText:
	text "I think you have"
	line "some rare #MON"
	cont "with you."

	para "Let me see them!"
	done

PokemaniacDonaldBeatenText:
	text "Gaah! I lost!"
	line "That makes me mad!"
	done

PokemaniacDonaldAfterBattleText:
	text "Are you making a"
	line "#DEX? Here's a"
	cont "hot tip."

	para "The HIKER on ROUTE"
	line "33, ANTHONY, is a"
	cont "good guy."

	para "He'll phone you if"
	line "he sees any rare"
	cont "#MON."
	done

GoldenrodUndergroundTheDoorsLockedText:
	text "The door's locked…"
	done

GoldenrodUndergroundTheDoorIsOpenText:
	text "The door is open."
	done

GoldenrodUndergroundBasementKeyOpenedDoorText:
	text "The BASEMENT KEY"
	line "opened the door."
	done

GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText:
	text "Hello there!"

	para "I'm the elder and"
	line "father of the two"
	cont "HAIRCUT BROTHERS."
	
	para "My oldest son"
	line "went away to"
	cont "perfect his art."
	
	para "So I manage his"
	line "shop for now."
	
	para "Since I'm the elder"
	line "I am much better"
	cont "than both my sons."

	para "I can make your"
	line "#MON the best"
	cont "for just ¥700."

	para "How about that?"
	done

GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText:
	text "Which #MON"
	line "should I work on?"
	done

GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText:
	text "OK! Observe"
	line "PERFECTION!"
	done

GoldenrodUndergroundOlderHaircutBrotherAllDoneText:
	text "There! All done!"
	para "I don't tire like"
	line "the young folks."
	
	para "I can keep doing"
	line "haircuts all day!"
	done

GoldenrodUndergroundOlderHaircutBrotherThatsAShameText:
	text "Don't worry."
	line "I'm here every day."
	done

GoldenrodUndergroundOlderHaircutBrotherYoullNeedMoreMoneyText:
	text "You'll need more"
	line "money than that."
	done

GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText:
	text "Welcome to the"
	line "#MON SALON!"

	para "I'm the younger"
	line "and less expen-"
	cont "sive of the two"
	cont "HAIRCUT BROTHERS."

	para "I'll spiff up your"
	line "#MON for just"
	cont "¥300."

	para "So? How about it?"
	done

GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText:
	text "OK, which #MON"
	line "should I do?"
	done

GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText:
	text "OK! I'll make it"
	line "look cool!"
	done

GoldenrodUndergroundYoungerHaircutBrotherAllDoneText:
	text "There we go!"
	line "All done!"
	done

GoldenrodUndergroundYoungerHaircutBrotherHowDisappointingText:
	text "No? "
	line "How disappointing!"
	done

GoldenrodUndergroundYoungerHaircutBrotherShortOnFundsText:
	text "You're a little"
	line "short on funds."
	done

GoldenrodUndergroundYoungerHaircutBrotherOneHaircutADayText:
	text "I can do only one"
	line "haircut a day."

	para "Sorry, but I'm all"
	line "done for today."
	done

HaircutBrosText_SlightlyHappier:
	text_ram wStringBuffer3
	text " looks a"
	line "little happier."
	done

HaircutBrosText_Happier:
	text_ram wStringBuffer3
	text " looks"
	line "happy."
	done

HaircutBrosText_MuchHappier:
	text_ram wStringBuffer3
	text " looks"
	line "delighted!"
	done

GoldenrodUndergroundWeAreNotOpenTodayText:
	text "We're not open"
	line "today."
	done

GoldenrodUndergroundNoEntryText:
	text "NO ENTRY BEYOND"
	line "THIS POINT"
	done
	
TutorAskTeachAMoveText:
	text "I found this box"
	line "full of TMs!"
	
	para "It must be from"
	line "Kanto as I have"
	cont "never seen these"
	cont "TMs here in Johto."

	para "Team Rocket must"
	line "have forgotten"
	cont "it when they left."
	
	para "…"
	
	para "It would be a"
	line "shame just letting"
	cont "them site here…"

	para "Want to try one?"
	done

TutorShortOnFundsText:
	text "You don't have"
	para "enough money"
	done
	
TutorAskMoneyOkayText:
	text "¥5000 please."	; amount is TUTORMONEYPAYAMOUNT
	done
	
TutorRefusePayText:
	text "What? I am not"
	line "going to just"
	cont "give it to you."
	done

TutorRefusedText:
	text "OK then."
	done

TutorWhichMoveShouldITeachText:
	text "Which move do"
	line "you want?"
	done


TutorTeachMoveText:
	text "Seems like a"
	line "good choise."
	done
	
TutorToughtMoveText:
	text "Nice. It worked."
	done

TutorFarewellText:
	text "Bye then."
	done

TutorIncompatibleText:
	text "Your #mon"
	line "can't learn this"
	cont "move…"
	done

TutorMoveText:
	text_start
	done

GoldenrodUnderground_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  2, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 7
	warp_event  3, 34, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 4
	warp_event 18,  6, GOLDENROD_UNDERGROUND, 4
	warp_event 21, 31, GOLDENROD_UNDERGROUND, 3
	warp_event 22, 31, GOLDENROD_UNDERGROUND, 3
	warp_event 22, 27, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 1 ;

	def_coord_events

	def_bg_events
	bg_event 18,  6, BGEVENT_READ, BasementDoorScript
	bg_event 19,  6, BGEVENT_READ, GoldenrodUndergroundNoEntrySign
	bg_event  6, 13, BGEVENT_ITEM, GoldenrodUndergroundHiddenParlyzHeal
	bg_event  4, 18, BGEVENT_ITEM, GoldenrodUndergroundHiddenSuperPotion
	bg_event 17,  8, BGEVENT_ITEM, GoldenrodUndergroundHiddenAntidote

	def_object_events
	object_event  5, 31, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdEric, -1
	object_event  6,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdTeru, -1
	object_event  3, 27, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacIssac, -1
	object_event  2,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacDonald, -1
	object_event  7, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundCoinCase, EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	object_event  7, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BargainMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRAMPS
	object_event  7, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlderHaircutBrotherScript, -1
	object_event  7, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungerHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	object_event  7, 21, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BitterMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRANNY
	object_event  21,  27, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ShadyTmGuyMoveTutorScript, EVENT_SHADY_MOVE_TUTOR_HIDDEN
