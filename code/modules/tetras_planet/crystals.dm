/obj/structure/tetras_crystal
	name = "Phoron crystal"
	desc = "Phoron crystal"
	icon = 'icons/turf/planet.dmi'
	icon_state = "crystal"
	light_color = "#fa7c0b"
	var/brightness_on = 4
	var/crystal_power = 20
	density = 1
	anchored = 1

/obj/structure/tetras_crystal/New()
    ..()
    icon_state = pick("crystal", "crystal1", "crystal2")
    glow()

/obj/structure/tetras_crystal/proc/glow()
	var/turf/pos = get_turf(src)
	if(pos)
		set_light(brightness_on, crystal_power, light_color)