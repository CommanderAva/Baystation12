/obj/item/ammo_parts
	name = "bullet part"
	desc = "bullet part. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "jacket"
	var/dens = 0
	var/weight = 0
	var/rad = 0
	var/power = 0
	var/list/material = list()

/obj/item/ammo_parts/New()
	check_composition()
	return

/obj/item/ammo_parts/proc/check_composition()
	for(var/obj/item/stack/material/ammo_material/P in material)
		src.dens = P.dens
		src.weight = P.weight
		src.rad = P.rad
	return


/obj/item/ammo_parts/jacket
	name = "bullet jacket"
	desc = "bullet jacket. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "jacket"


/obj/item/ammo_parts/jacket/check_composition()
	for(var/obj/item/stack/material/ammo_material/P in material)
		src.dens = P.dens
		src.weight = P.weight
		src.rad = P.rad

		if(istype(P, /obj/item/stack/material/ammo_material/iron))
			src.name = "iron bullet jacket"
		if(istype(P, /obj/item/stack/material/ammo_material/copper))
			src.name = "copper bullet jacket"
		if(istype(P, /obj/item/stack/material/ammo_material/steel))
			src.name = "steel bullet jacket"
		if(istype(P, /obj/item/stack/material/ammo_material/plasteel))
			src.name = "plasteel bullet jacket"
		if(istype(P, /obj/item/stack/material/ammo_material/depleted_uranium))
			src.name = "depleted uranium bullet jacket"
		if(istype(P, /obj/item/stack/material/ammo_material/lead))
			src.name = "lead bullet jacket"

		return

/obj/item/ammo_parts/heart
	name = "bullet heart"
	desc = "bullet heart. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "heart"

/obj/item/ammo_parts/heart/check_composition()
	for(var/obj/item/stack/material/ammo_material/P in material)
		src.dens = P.dens
		src.weight = P.weight
		src.rad = P.rad

		if(istype(P, /obj/item/stack/material/ammo_material/iron))
			src.name = "iron bullet heart"
		if(istype(P, /obj/item/stack/material/ammo_material/copper))
			src.name = "copper bullet heart"
		if(istype(P, /obj/item/stack/material/ammo_material/steel))
			src.name = "steel bullet heart"
		if(istype(P, /obj/item/stack/material/ammo_material/plasteel))
			src.name = "plasteel bullet heart"
		if(istype(P, /obj/item/stack/material/ammo_material/depleted_uranium))
			src.name = "depleted uranium bullet heart"
		if(istype(P, /obj/item/stack/material/ammo_material/lead))
			src.name = "lead bullet heart"

		return

/obj/item/ammo_parts/needle
	name = "bullet needle"
	desc = "bullet needle. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "needle"


/obj/item/ammo_parts/needle/check_composition()
	for(var/obj/item/stack/material/ammo_material/P in material)
		src.dens = P.dens
		src.weight = P.weight
		src.rad = P.rad

		if(istype(P, /obj/item/stack/material/ammo_material/iron))
			src.name = "iron bullet needle"
		if(istype(P, /obj/item/stack/material/ammo_material/copper))
			src.name = "copper bullet needle"
		if(istype(P, /obj/item/stack/material/ammo_material/steel))
			src.name = "steel bullet needle"
		if(istype(P, /obj/item/stack/material/ammo_material/plasteel))
			src.name = "plasteel bullet needle"
		if(istype(P, /obj/item/stack/material/ammo_material/depleted_uranium))
			src.name = "depleted uranium bullet needle"
		if(istype(P, /obj/item/stack/material/ammo_material/lead))
			src.name = "lead bullet needle"

		return

/obj/item/ammo_parts/gunpowder
	name = "gunpowder"
	desc = "gunpowder. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "gunpowder"
	power = 1

/obj/item/ammo_parts/gunpowder/check_composition()
	for(var/obj/item/stack/material/ammo_material/P in material)
		src.power = P.power
		return

/obj/item/ammo_parts/incendiary
	name = "incendiary"
	desc = "incendiary. Contact admin or developer if you see this"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "incendiary"
	var/incendiary = 1.1

/obj/item/ammo_parts/incendiary/check_composition()
	for(var/obj/item/stack/material/ammo_material/P in material)
		src.incendiary += P.incendiary
		return


/obj/item/ammo_parts/jacket/copper
	name = "c bullet jacket"
	desc = "c bullet jacket. Contact admin or developer if you see this"

/obj/item/ammo_parts/jacket/copper/New()
	..()
	material = list()
	material += new /obj/item/stack/material/ammo_material/copper(src)
	check_composition()

/obj/item/ammo_parts/heart/lead
	name = "c bullet jacket"
	desc = "c bullet jacket. Contact admin or developer if you see this"

/obj/item/ammo_parts/heart/lead/New()
	..()
	material = list()
	material += new /obj/item/stack/material/ammo_material/lead(src)
	check_composition()

/obj/item/ammo_parts/needle/steel
	name = "bullet needle"
	desc = "bullet needle. Contact admin or developer if you see this"

/obj/item/ammo_parts/needle/steel/New()
	..()
	material = list()
	material += new /obj/item/stack/material/ammo_material/steel(src)
	check_composition()


