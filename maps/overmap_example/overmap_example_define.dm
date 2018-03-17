/datum/map/overmap_example
	name = "Smelyj"
	full_name = "Smelyj"
	path = "overmap_example"

	station_name  = "EV Smelij"
	station_short = "Smelij"

	dock_name     = "FTS Tetras Prime"
	boss_name     = "TSR Exploration Fleet"
	boss_short    = "Kontr-Admiral"
	company_name  = "Avalanche Concern"
	company_short = "Avalanche"
	overmap_event_areas = 11

	default_law_type = /datum/ai_laws/corporate

	evac_controller_type = /datum/evacuation_controller/lifepods
	lobby_icon = 'maps/overmap_example/overmap_example_lobby.dmi'
	lobby_screens = list("spess","aesthetic")

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
	use_overmap = 1
	num_exoplanets = 3
	welcome_sound = 'sound/effects/cowboysting.ogg'

	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."

	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

/datum/map/overmap_example/map_info(victim)
	to_chat(victim, "You're aboard the <b>[station_name],</b> an exploration vessel affiliated with Tetras Stellar Republic and Avalanche Concern, on a SPACE FRONTIER. No major corporation or government has laid claim on the planets in this sector, so their exploitation is entirely up to you!")

/datum/map/overmap_example/setup_map()
	..()
	GLOB.traders += new /datum/trader/xeno_shop
	GLOB.traders += new /datum/trader/medical
	GLOB.traders += new /datum/trader/mining