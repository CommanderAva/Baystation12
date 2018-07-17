/datum/map/abg
	name = "Battle for Moon"
	full_name = "Ava's Battlegrounds"
	path = "abg"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK

	lobby_tracks = list(/music_track/crni_bombarder)

	allowed_spawns = list("Serbian Forces Barracks", "USMC FOB")
	default_spawn = "Serbian Forces Barracks"

//	lobby_icon = 'maps/abg_moon/icons/lobby.dmi'

	station_levels = list(1,2,3)
	contact_levels = list(1,2,3)
	player_levels = list(1,2,3)
	admin_levels = list(10,11)
	empty_levels = list(6)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1,"4"=1,"5"=1,"6"=30,"7"=10,"8"=10)
	overmap_size = 40
	overmap_event_areas = 15
	base_turf_by_z = list()