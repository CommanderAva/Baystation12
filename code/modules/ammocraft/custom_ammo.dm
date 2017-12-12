/obj/item/projectile/bullet/custom
	fire_sound = 'sound/weapons/gunshot/gunshot_pistol.ogg'
	damage = 0 //9mm, .38, etc
	armor_penetration = 0
	var/list/composition = list()
	var/rad = 0
	var/dens = 0
	var/weight = 0
	var/power = 0
	var/bullet_type = ""
	var/incendiary = 0
	var/wc = 0.40
	var/dc = 0.35

/obj/item/projectile/bullet/custom/proc/check_inside_parts()
	src.dens = 0
	src.weight = 0
	src.rad = 0
	if(bullet_type == "FMJ")
		for(var/obj/item/ammo_parts/P in composition)
			if(istype(P, /obj/item/ammo_parts/jacket/))
				src.dens += P.material.hardness*1.1
				src.weight += P.material.weight*0.3
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/heart/))
				src.dens += P.material.hardness*0.5
				src.weight += P.material.weight*0.9
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/gunpowder/))
				src.power += P.material.power


	else if(bullet_type == "HP")
		for(var/obj/item/ammo_parts/P in composition)
			if(istype(P, /obj/item/ammo_parts/jacket/))
				src.dens += P.material.hardness*1.1
				src.weight += P.material.weight*0.4
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/heart/))
				src.dens += P.material.hardness*0.3
				src.weight += P.material.weight*0.1
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/gunpowder/))
				src.power += P.material.power


	else if(bullet_type == "AP")
		for(var/obj/item/ammo_parts/P in composition)
			if(istype(P, /obj/item/ammo_parts/jacket/))
				src.dens += P.material.hardness*0.9
				src.weight += P.material.weight*0.4
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/heart/))
				src.dens += P.material.hardness*0.8
				src.weight += P.material.weight*0.5
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/gunpowder/))
				src.power += P.material.power


	else if(bullet_type == "Sabot")
		for(var/obj/item/ammo_parts/P in composition)
			if(istype(P, /obj/item/ammo_parts/jacket/))
				src.dens += P.material.hardness*0.6
				src.weight += P.material.weight*0.5
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/needle/))
				src.dens += P.material.hardness*1.5
				src.weight += P.material.weight*0.3
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/gunpowder/))
				src.power += P.material.power*0.9


	else if(bullet_type == "Incendiary")
		for(var/obj/item/ammo_parts/P in composition)
			if(istype(P, /obj/item/ammo_parts/jacket/))
				src.dens += P.material.hardness*0.7
				src.weight += P.material.weight*0.5
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/heart/))
				src.dens += P.material.hardness*0.6
				src.weight += P.material.weight*0.8
				src.rad += P.material.radioactivity
			else if(istype(P, /obj/item/ammo_parts/gunpowder/))
				src.power += P.material.power
			else if(istype(P, /obj/item/ammo_parts/incendiary/))
				src.incendiary = P.material.incendiary

	damage = (src.weight * wc)
	armor_penetration = (src.dens * dc)
	return


/*
/obj/item/projectile/bullet/custom/incendiary/on_hit(var/atom/target, var/blocked = 0)
	if(isturf(target))
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(4, 1, src)
		s.start()
	..()
*/



/obj/item/ammo_casing/custom
	desc = "A 9mm custom bullet casing."
	caliber = ""
	projectile_type = /obj/item/projectile/bullet/custom/

/obj/item/ammo_magazine/custom_box
	name = "Custom ammo box"
	desc = "Box of customised ammunition made at ammunition workbench"
	icon_state = "custom_ammo"
	ammo_type = /obj/item/ammo_casing/custom
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = null
	max_ammo = 16
	multiple_sprites = 1





