/obj/item/projectile/bullet/custom
	fire_sound = 'sound/weapons/gunshot/gunshot_pistol.ogg'
	damage = 0 //9mm, .38, etc
	armor_penetration = 0
	var/list/composition = list()
	var/list/radioactivity = list()
	var/dens = 0
	var/weight = 0
	var/rad = 0
	var/power = 0
	var/incendiary = 0
	var/ammo_type = ""

/obj/item/projectile/bullet/custom/New()
	check_inside_parts()
	count_chars()

/obj/item/projectile/bullet/custom/proc/count_chars()
	damage = (weight*5)
	armor_penetration = (dens * 12)
	return
/obj/item/projectile/bullet/custom/proc/check_inside_parts()
	return

/obj/item/projectile/bullet/custom/fmj/count_chars()
	damage = (weight*5)
	armor_penetration = (dens * 12)
	return

/obj/item/projectile/bullet/custom/fmj
	name = "custom FMJ bullet"
	desc = "A custom FMJ bullet."
	ammo_type = "FMJ"

/obj/item/projectile/bullet/custom/fmj/stand
	name = "custom FMJ bullet"
	desc = "A custom FMJ bullet."

/obj/item/projectile/bullet/custom/fmj/stand/New()
	..()

	composition = list()
	composition += new /obj/item/ammo_parts/jacket/copper(src)
	composition += new /obj/item/ammo_parts/heart/lead(src)
	composition += new /obj/item/ammo_parts/gunpowder(src)
	check_inside_parts()
	count_chars()


/obj/item/projectile/bullet/custom/fmj/check_inside_parts()
	for(var/obj/item/ammo_parts/P in composition)
		if(istype(P, /obj/item/ammo_parts/jacket/))
			src.dens += P.dens*1.1
			src.weight += P.weight*0.3
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/heart/))
			src.dens += P.dens*0.5
			src.weight += P.weight*0.9
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/gunpowder/))
			src.power += P.power
	return

/obj/item/projectile/bullet/custom/hp
	name = "custom HP bullet"
	desc = "A custom HP bullet."
	ammo_type = "HP"


/obj/item/projectile/bullet/custom/hp/stand
	name = "custom HP bullet"
	desc = "A custom HP bullet."

/obj/item/projectile/bullet/custom/hp/stand/New()
	..()

	composition = list()
	composition += new /obj/item/ammo_parts/jacket/copper(src)
	composition += new /obj/item/ammo_parts/heart/lead(src)
	composition += new /obj/item/ammo_parts/gunpowder(src)
	check_inside_parts()
	count_chars()




/obj/item/projectile/bullet/custom/hp/check_inside_parts()
	for(var/obj/item/ammo_parts/P in composition)
		if(istype(P, /obj/item/ammo_parts/jacket/))
			src.dens += P.dens*1.1
			src.weight += P.weight*0.3
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/heart/))
			src.dens += P.dens*0.5
			src.weight += P.weight
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/gunpowder/))
			src.power += P.power
	return

/obj/item/projectile/bullet/custom/hp/count_chars()
	damage = (weight*7)
	armor_penetration = (dens * 8)
	return

/obj/item/projectile/bullet/custom/sabot
	name = "custom sabot bullet"
	desc = "A custom sabot bullet."
	ammo_type = "Sabot"


/obj/item/projectile/bullet/custom/sabot/stand
	name = "custom sabot bullet"
	desc = "A custom sabot bullet."

/obj/item/projectile/bullet/custom/sabot/stand/New()
	..()

	composition = list()
	composition += new /obj/item/ammo_parts/jacket/copper(src)
	composition += new /obj/item/ammo_parts/needle/steel(src)
	composition += new /obj/item/ammo_parts/gunpowder(src)
	check_inside_parts()
	count_chars()




/obj/item/projectile/bullet/custom/sabot/check_inside_parts()
	for(var/obj/item/ammo_parts/P in composition)
		if(istype(P, /obj/item/ammo_parts/jacket/))
			src.dens += P.dens*0.6
			src.weight += P.weight*0.6
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/needle/))
			src.dens += P.dens*1.5
			src.weight += P.weight*0.3
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/gunpowder/))
			src.power += P.power*0.9
	return

obj/item/projectile/bullet/custom/sabot/count_chars()
	damage = (weight*5)
	armor_penetration = (dens * 12)
	return


/obj/item/projectile/bullet/custom/ap
	name = "custom ap bullet"
	desc = "A custom ap bullet."
	ammo_type = "AP"


/obj/item/projectile/bullet/custom/ap/stand
	name = "custom ap bullet"
	desc = "A custom ap bullet."

/obj/item/projectile/bullet/custom/ap/stand/New()
	..()

	composition = list()
	composition += new /obj/item/ammo_parts/jacket/copper(src)
	composition += new /obj/item/ammo_parts/heart(src)
	composition += new /obj/item/ammo_parts/gunpowder(src)
	check_inside_parts()
	count_chars()




/obj/item/projectile/bullet/custom/ap/check_inside_parts()
	for(var/obj/item/ammo_parts/P in composition)
		if(istype(P, /obj/item/ammo_parts/jacket/))
			src.dens += P.dens*0.8
			src.weight += P.weight*0.4
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/heart/))
			src.dens += P.dens*0.7
			src.weight += P.weight*0.8
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/gunpowder/))
			src.power += P.power
	return

obj/item/projectile/bullet/custom/ap/count_chars()
	damage = (weight*6)
	armor_penetration = (dens * 10)
	return

/obj/item/projectile/bullet/custom/incendiary
	name = "custom incendiary bullet"
	desc = "A custom incendiary bullet."
	ammo_type = "Incendiary"

/obj/item/projectile/bullet/custom/incendiary/on_hit(var/atom/target, var/blocked = 0)
	if(isturf(target))
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(4, 1, src)
		s.start()
	..()


/obj/item/projectile/bullet/custom/incendiary/stand
	name = "custom incendiary bullet"
	desc = "A custom incendiary bullet."

/obj/item/projectile/bullet/custom/incendiary/stand/New()
	..()

	composition = list()
	composition += new /obj/item/ammo_parts/jacket/copper(src)
	composition += new /obj/item/ammo_parts/heart(src)
	composition += new /obj/item/ammo_parts/gunpowder(src)
	composition += new /obj/item/ammo_parts/incendiary(src)
	check_inside_parts()
	count_chars()




/obj/item/projectile/bullet/custom/incendiary/check_inside_parts()
	for(var/obj/item/ammo_parts/P in composition)
		if(istype(P, /obj/item/ammo_parts/jacket/))
			src.dens += P.dens*0.7
			src.weight += P.weight*0.5
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/heart/))
			src.dens += P.dens*0.6
			src.weight += P.weight*0.8
			src.rad += P.rad
		else if(istype(P, /obj/item/ammo_parts/gunpowder/))
			src.power += P.power
		else if(istype(P, /obj/item/ammo_parts/incendiary/))
			src.incendiary += P.incendiary
	return

obj/item/projectile/bullet/custom/incendiary/count_chars()
	damage = (weight*6*incendiary)
	armor_penetration = (dens * 10)
	return


/obj/item/ammo_casing/custom
	desc = "A 9mm custom bullet casing."
	caliber = ""
	projectile_type = null

/obj/item/ammo_casing/custom/fmj_stand
	desc = "A 9mm custom bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/custom/fmj/stand

/obj/item/ammo_casing/custom/hp_stand
	desc = "A 9mm custom bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/custom/hp/stand

/obj/item/ammo_casing/custom/sabot_stand
	desc = "A 9mm custom bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/custom/sabot/stand

/obj/item/ammo_casing/custom/ap_stand
	desc = "A 9mm custom bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/custom/ap/stand

/obj/item/ammo_casing/custom/incendiary_stand
	desc = "A 9mm custom bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/custom/incendiary/stand

/obj/item/ammo_magazine/custom_box
	name = "Custom ammo box"
	desc = "Box of customised ammunition made at ammunition workbench"
	icon_state = "custom_ammo"
	ammo_type = null
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = null
	max_ammo = 16
	multiple_sprites = 1





