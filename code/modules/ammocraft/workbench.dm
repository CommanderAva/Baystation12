/obj/machinery/ammo_workbench
	name = "ammunition workbench"
	desc = "A workbench for making custom ammunition"
	icon = 'icons/obj/machines/ammocraft.dmi'
	icon_state = "workbench"
	density = 1
	use_power = 1
	idle_power_usage = 0
	active_power_usage = 500
	var/selected_material = null
	var/list/workbench_recipes = null
	var/list/ammo_recipes = null
	var/list/stored_material = list("ammunition iron material" = 0,
									"ammunition copper material" = 0,
									"ammunition steel material" = 0,
									"ammunition plasteel material" = 0,
									"ammunition depleted uranium material" = 0,
									"ammunition lead material" = 0,
									"ammunition solid phoron material" = 0

	)
	var/list/storage_capacity = list("ammunition iron material" = 0,
									"ammunition copper material" = 0,
									"ammunition steel material" = 0,
									"ammunition plasteel material" = 0,
									"ammunition depleted uranium material" = 0,
									"ammunition lead material" = 0,
									"ammunition solid phoron material" = 0

	)
	var/list/charge_list = list("gunpowder")
	var/list/casing_storage = null
	var/show_category = "All"
	var/busy = 0
	var/selected_caliber = null
	var/selected_type = null

	var/bullet_ready = 0
	var/mat_efficiency = 1
	var/build_time = 50
	var/list/caliber_types = list("9mm")
	var/list/ammo_types = list("FMJ", "HP", "AP", "Sabot", "Incendiary")
	var/list/start_ask = list ("Replicate programmed bullet", "Design new bullet")
	var/list/current_bullet = null


/obj/machinery/ammo_workbench/New()

	..()
	//Create parts for lathe.
	component_parts = list()
	component_parts += new /obj/item/weapon/circuitboard/ammo_workbench(src)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(src)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(src)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(src)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(src)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(src)
	component_parts += new /obj/item/weapon/stock_parts/console_screen(src)
	RefreshParts()

/obj/machinery/ammo_workbench/RefreshParts()
	..()
	var/mb_rating = 0
	var/man_rating = 0
	for(var/obj/item/weapon/stock_parts/matter_bin/MB in component_parts)
		mb_rating += MB.rating
	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating

	build_time = 50 / man_rating
	storage_capacity["ammunition iron material"] = mb_rating  * 25000
	storage_capacity["ammunition copper material"] = mb_rating  * 25000
	storage_capacity["ammunition steel material"]  = mb_rating  * 12500
	storage_capacity["ammunition plasteel material"]  = mb_rating  * 10000
	storage_capacity["ammunition depleted uranium material"]  = mb_rating  * 5000
	storage_capacity["ammunition lead material"] = mb_rating  * 25000
	storage_capacity["ammunition solid phoron material"]  = mb_rating  * 10000

/obj/machinery/ammo_workbench/Destroy()
	return ..()

/obj/machinery/ammo_workbench/proc/update_recipe_list()
	if(!ammo_recipes)
		ammo_recipes = workbench_recipes

/obj/machinery/ammo_workbench/interact(mob/user as mob)

	update_recipe_list()
/*
/obj/machinery/ammo_workbench/attackby(var/obj/item/O as obj, mob/user as mob)
	if(istype(O, /obj/item/ammo_casing/c9mm/custom) && current_bullet != 0)
		var/obj/item/ammo_casing/c9mm/custom/P = O
		P.projectile_type = src.current_bullet
		P.BB = new src.current_bullet(src)
		to_chat(user, "<span class='notice'>You reload the casing with new bullet</span>")
		P.icon_state = "s-casing"
		return
	if(istype(O, /obj/item/ammo_casing/c9mm/custom) && current_bullet == 0)
		to_chat(user, "<span class='notice'>There is no bullet type in the workbench</span>")
		return
	else
		return
*/
/obj/machinery/ammo_workbench/proc/ask()
	if(bullet_ready == 1)
		var/N = input("Use old design or build new?", "[src]") as null|anything in start_ask
		if(N)
			var/result = N
			N = null
			if (result == "Replicate programmed bullet")
				var/obj/item/ammo_casing/custom/T = /obj/item/ammo_casing/custom
				T.caliber = selected_caliber
				T.projectile_type = src.current_bullet
				T.BB = new src.current_bullet(src)
				var/obj/item/ammo_magazine/custom_box/E = /obj/item/ammo_magazine/custom_box
				E.caliber = selected_caliber
				E.ammo_type =  T
				src.loc += new E(src)

			else if (result == "Design new bullet")
				bullet_ready = 0
				current_bullet = null


	var/N = input("Select the calibre", "[src]") as null|anything in caliber_types
	if(N)
		selected_caliber = N
		N = null
	N = input("Select the type of ammunition", "[src]") as null|anything in ammo_types
	if(N)
		selected_type = N
		N = null

		if(selected_type == "FMJ")
			current_bullet += new /obj/item/projectile/bullet/custom/fmj(src)
		if(selected_type == "HP")
			current_bullet += new /obj/item/projectile/bullet/custom/hp(src)
		if(selected_type == "AP")
			current_bullet += new /obj/item/projectile/bullet/custom/ap(src)
		if(selected_type == "Sabot")
			current_bullet += new /obj/item/projectile/bullet/custom/sabot(src)
		if(selected_type == "Incendiary")
			current_bullet += new /obj/item/projectile/bullet/custom/incendiary(src)

	var/obj/item/projectile/bullet/custom/A = current_bullet

	N = input("Select the type of material for jacket", "[src]") as null|anything in stored_material
	if(N)
		selected_material = N
		N = null
		if(selected_material == "ammunition iron material")
			A.composition += new /obj/item/ammo_parts/jacket(src)
			for(var/obj/item/ammo_parts/jacket/B in A.composition)
				B.material += new /obj/item/stack/material/ammo_material/iron(src)
				B.check_parts()
		if(selected_material == "ammunition copper material")
			A.composition += new /obj/item/ammo_parts/jacket(src)
			for(var/obj/item/ammo_parts/jacket/B in A.composition)
				B.material += new /obj/item/stack/material/ammo_material/copper(src)
				B.check_parts()
		if(selected_material == "ammunition steel material")
			A.composition += new /obj/item/ammo_parts/jacket(src)
			for(var/obj/item/ammo_parts/jacket/B in A.composition)
				B.material += new /obj/item/stack/material/ammo_material/steel(src)
				B.check_parts()
		if(selected_material == "ammunition plasteel material")
			A.composition += new /obj/item/ammo_parts/jacket(src)
			for(var/obj/item/ammo_parts/jacket/B in A.composition)
				B.material += new /obj/item/stack/material/ammo_material/plasteel(src)
				B.check_parts()
		if(selected_material == "ammunition depleted uranium material")
			A.composition += new /obj/item/ammo_parts/jacket(src)
			for(var/obj/item/ammo_parts/jacket/B in A.composition)
				B.material += new /obj/item/stack/material/ammo_material/depleted_uranium(src)
				B.check_parts()
		if(selected_material == "ammunition lead material")
			A.composition += new /obj/item/ammo_parts/jacket(src)
			for(var/obj/item/ammo_parts/jacket/B in A.composition)
				B.material += new /obj/item/stack/material/ammo_material/lead(src)
				B.check_parts()
		if(selected_material == "ammunition solid phoron material")
			A.composition += new /obj/item/ammo_parts/jacket(src)
			for(var/obj/item/ammo_parts/jacket/B in A.composition)
				B.material += new /obj/item/stack/material/ammo_material/phoron(src)
				B.check_parts()
		current_bullet = A

	A = current_bullet

	if(selected_type != "Sabot")
		N = input("Select the type of material for heart", "[src]") as null|anything in stored_material
		if(N)
			selected_material = N
			N = null
			if(selected_material == "ammunition iron material")
				A.composition += new /obj/item/ammo_parts/heart(src)
				for(var/obj/item/ammo_parts/heart/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/iron(src)
					B.check_parts()
			if(selected_material == "ammunition copper material")
				A.composition += new /obj/item/ammo_parts/heart(src)
				for(var/obj/item/ammo_parts/heart/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/copper(src)
					B.check_parts()
			if(selected_material == "ammunition steel material")
				A.composition += new /obj/item/ammo_parts/heart(src)
				for(var/obj/item/ammo_parts/heart/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/steel(src)
					B.check_parts()
			if(selected_material == "ammunition plasteel material")
				A.composition += new /obj/item/ammo_parts/heart(src)
				for(var/obj/item/ammo_parts/heart/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/plasteel(src)
					B.check_parts()
			if(selected_material == "ammunition depleted uranium material")
				A.composition += new /obj/item/ammo_parts/heart(src)
				for(var/obj/item/ammo_parts/heart/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/depleted_uranium(src)
					B.check_parts()
			if(selected_material == "ammunition lead material")
				A.composition += new /obj/item/ammo_parts/heart(src)
				for(var/obj/item/ammo_parts/heart/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/lead(src)
					B.check_parts()
			if(selected_material == "ammunition solid phoron material")
				A.composition += new /obj/item/ammo_parts/heart(src)
				for(var/obj/item/ammo_parts/heart/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/phoron(src)
					B.check_parts()
			current_bullet = A
	else if (selected_type == "Sabot")
		N = input("Select the type of material for needle", "[src]") as null|anything in stored_material
		if(N)
			selected_material = N
			N = null
			if(selected_material == "ammunition iron material")
				A.composition += new /obj/item/ammo_parts/needle(src)
				for(var/obj/item/ammo_parts/needle/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/iron(src)
					B.check_parts()
			if(selected_material == "ammunition copper material")
				A.composition += new /obj/item/ammo_parts/needle(src)
				for(var/obj/item/ammo_parts/needle/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/copper(src)
					B.check_parts()
			if(selected_material == "ammunition steel material")
				A.composition += new /obj/item/ammo_parts/needle(src)
				for(var/obj/item/ammo_parts/needle/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/steel(src)
					B.check_parts()
			if(selected_material == "ammunition plasteel material")
				A.composition += new /obj/item/ammo_parts/needle(src)
				for(var/obj/item/ammo_parts/needle/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/plasteel(src)
					B.check_parts()
			if(selected_material == "ammunition depleted uranium material")
				A.composition += new /obj/item/ammo_parts/needle(src)
				for(var/obj/item/ammo_parts/needle/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/depleted_uranium(src)
					B.check_parts()
			if(selected_material == "ammunition lead material")
				A.composition += new /obj/item/ammo_parts/needle(src)
				for(var/obj/item/ammo_parts/needle/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/lead(src)
					B.check_parts()
			if(selected_material == "ammunition solid phoron material")
				A.composition += new /obj/item/ammo_parts/needle(src)
				for(var/obj/item/ammo_parts/needle/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/phoron(src)
					B.check_parts()
			current_bullet = A

	A = current_bullet

	N = input("Select the type of material for charge", "[src]") as null|anything in charge_list
	if(N)
		selected_material = N
		N = null
		if(selected_material == "gunpowder")
			A.composition += new /obj/item/ammo_parts/gunpowder(src)
		current_bullet = A

	if(selected_type == "incendiary")
		N = input("Select the type of material for incendiary", "[src]") as null|anything in stored_material
		if(N)
			selected_material = N
			N = null
			if(selected_material == "ammunition depleted uranium material")
				A.composition += new /obj/item/ammo_parts/incendiary(src)
				for(var/obj/item/ammo_parts/needle/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/depleted_uranium(src)
					B.check_parts()
			if(selected_material == "ammunition solid phoron material")
				A.composition += new /obj/item/ammo_parts/incendiary(src)
				for(var/obj/item/ammo_parts/needle/B in A.composition)
					B.material += new /obj/item/stack/material/ammo_material/phoron(src)
					B.check_parts()
			current_bullet = A

	bullet_ready = 1





/obj/machinery/ammo_workbench/attack_hand(mob/user)
	ask()
	return
