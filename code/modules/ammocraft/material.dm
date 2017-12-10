/obj/item/stack/material/ammo_material/
	name = "ammunition material"
	icon_state = "sheet-uranium"
	default_type = "ammunition material"
	var/dens = 0
	var/weight = 0
	var/rad = 0
	var/power = 0
	var/list/cost = null
	var/incendiary = 0

/obj/item/stack/material/ammo_material/iron
	name = "ammunition iron material"
	icon_state = "sheet-uranium"
	default_type = "ammunition iron material"
	dens = 1.5
	weight = 1.5
	cost = list(DEFAULT_WALL_MATERIAL = 2)

/obj/item/stack/material/ammo_material/copper
	name = "ammunition copper material"
	icon_state = "sheet-uranium"
	default_type = "ammunition copper material"
	dens = 0.8
	weight = 0.8
	cost = list(DEFAULT_WALL_MATERIAL = 1)

/obj/item/stack/material/ammo_material/steel
	name = "ammunition steel material"
	icon_state = "sheet-uranium"
	default_type = "ammunition steel material"
	dens = 2
	weight = 1.2
	cost = list(DEFAULT_WALL_MATERIAL = 4)

/obj/item/stack/material/ammo_material/plasteel
	name = "ammunition plasteel material"
	icon_state = "sheet-uranium"
	default_type = "ammunition plasteel material"
	dens = 3
	weight = 1
	cost = list("plasteel" = 1)

/obj/item/stack/material/ammo_material/depleted_uranium
	name = "ammunition depleted uranium material"
	icon_state = "sheet-uranium"
	default_type = "ammunition depleted uranium material"
	dens = 3.5
	weight = 1.5
	rad = 0.6
	incendiary = 0.1

/obj/item/stack/material/ammo_material/lead
	name = "ammunition lead material"
	icon_state = "sheet-uranium"
	default_type = "ammunition lead material"
	dens = 0.3
	weight = 3
	cost = list(DEFAULT_WALL_MATERIAL = 2)

/obj/item/stack/material/ammo_material/phoron
	name = "ammunition solid phoron material"
	icon_state = "sheet-uranium"
	default_type = "ammunition solid phoron material"
	dens = 0.2
	weight = 0.2
	power = 1.2
	incendiary = 0.2
	cost = list("solid phoron" = 2)