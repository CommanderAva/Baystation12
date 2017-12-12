/obj/item/ammo_parts
	name = "bullet part"
	desc = "bullet part. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "jacket"
	var/dens = 0
	var/weight = 0
	var/rad = 0
	var/power = 0
	var/material/material
	var/default_material
	var/applies_material_colour = 1
	var/cost = 50

/obj/item/ammo_parts/proc/set_material(var/new_material)
	material = get_material_by_name(new_material)
	if(!material)
		qdel(src)
	else
		name = "[material.display_name] [initial(name)]"
		if(applies_material_colour)
			color = material.icon_colour


/obj/item/ammo_parts/New(var/newloc, var/material_key)
	..(newloc)
	if(!material_key)
		material_key = default_material
	set_material(material_key)
	if(!material)
		qdel(src)
		return

/obj/item/ammo_parts/jacket
	name = "bullet jacket"
	desc = "bullet jacket. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "jacket"
	default_material = "copper"
	cost = 80

/obj/item/ammo_parts/heart
	name = "bullet heart"
	desc = "bullet heart. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "heart"
	default_material = "lead"
	cost = 160

/obj/item/ammo_parts/needle
	name = "bullet needle"
	desc = "bullet needle. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "needle"
	default_material = "steel"
	cost = 100

/obj/item/ammo_parts/gunpowder
	name = "gunpowder"
	desc = "gunpowder. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "gunpowder"
	default_material = "gunpowder"
	power = 1

/obj/item/ammo_parts/incendiary
	name = "incendiary"
	desc = "incendiary. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "incendiary"
	var/incendiary = 1.1
	default_material = "phoron"



