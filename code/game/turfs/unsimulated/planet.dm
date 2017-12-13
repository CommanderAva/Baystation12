/turf/unsimulated/planet
	name = "rocky surface"
	icon = 'icons/turf/planet.dmi'
	icon_state = "planet"
	desc = "Rocky dark-purple upper layer of planet's surface. You can't grow anything here"
	initial_gas = list( "lithiumnitride" = MOLES_LI3NTETRAS,
						"nitrogen" = MOLES_N2TETRAS,
						"oxygen" = MOLES_O2TETRAS,
						"argon" = MOLES_ARTETRAS,
						"methane" = MOLES_METETRAS
					  )
	temperature = 57

/turf/unsimulated/planet/New()
    ..()
    icon_state = pick("planet", "planet3","planet3","planet3", "planet0","planet1","planet2","planet3","planet4")


/turf/simulated/planet
	name = "rocky surface"
	icon = 'icons/turf/planet.dmi'
	icon_state = "planet"
	desc = "Rocky dark-purple upper layer of planet's surface. You can't grow anything here"
	initial_gas = list( "lithiumnitride" = MOLES_LI3NTETRAS,
						"nitrogen" = MOLES_N2TETRAS,
						"oxygen" = MOLES_O2TETRAS,
						"argon" = MOLES_ARTETRAS,
						"methane" = MOLES_METETRAS
					  )
	temperature = 57

/turf/unsimulated/planet/New()
    ..()
    icon_state = pick("planet", "planet3","planet3","planet3", "planet0","planet1","planet2","planet3","planet4")
