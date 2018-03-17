/obj/machinery/ammo_workbench   //Thanks Lohikar, Hubble#2807 and BlueNexus#0489, huge ones and F-TangSteve#0439 and infinite ones for  GinjaNinja32 from Baystation12 discord for helping with this. It wouldn't work without these people.
	name = "ammunition workbench"
	desc = "A workbench for making custom ammunition"
	icon = 'icons/obj/machines/ammocraft.dmi'
	icon_state = "workbench"
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 0
	active_power_usage = 500
	var/selected_material = null
	var/list/stored_material = list("iron" = 0,
									"copper" = 0,
									"steel" = 0,
									"plasteel" = 0,
									"depleted uranium" = 0,
									"lead" = 0,
									"gunpowder" = 0,
									"phoron" = 0

	)
	var/list/storage_capacity = list("iron" = 0,
									"copper" = 0,
									"steel" = 0,
									"plasteel" = 0,
									"depleted uranium" = 0,
									"lead" = 0,
									"gunpowder" = 0,
									"phoron" = 0

	)
	var/list/charge_list = list("gunpowder")
	var/list/incendiary_list = list("phoron", "depleted uranium")
	var/list/casing_storage = null
	var/show_category = "All"
	var/busy = 0
	var/selected_caliber = ""
	var/selected_type = ""

	var/bullet_ready = 0
	var/mat_efficiency = 1
	var/build_time = 50
	var/list/caliber_types = list("9mm", ".45 ACP", "7.62x25", "7.62x39","7.62x54", "5.56x45")
	var/list/ammo_types = list("FMJ", "HP", "AP", "Sabot", "Incendiary")
	var/obj/item/projectile/bullet/custom/current_bullet = null
	var/allow_work = 0
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
	storage_capacity["iron"] = mb_rating  * 25000
	storage_capacity["copper"] = mb_rating  * 25000
	storage_capacity["steel"]  = mb_rating  * 12500
	storage_capacity["plasteel"]  = mb_rating  * 10000
	storage_capacity["depleted uranium"]  = mb_rating  * 5000
	storage_capacity["lead"] = mb_rating  * 25000
	storage_capacity["phoron"]  = mb_rating  * 10000
	storage_capacity["gunpowder"]  = mb_rating  * 100000

/obj/machinery/ammo_workbench/Destroy()
	return ..()


/obj/machinery/ammo_workbench/interact(mob/user as mob)

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
/obj/machinery/ammo_workbench/proc/check_material(mob/user)

	var/list/required_materials = list()
	for(var/obj/item/ammo_parts/V in current_bullet)
		required_materials[V.material.name] += V.cost
	for(var/mat in required_materials)
		if(stored_material[mat] < required_materials[mat])
			var/material/material = get_material_by_name(mat)
			to_chat(user, "<span class='notice'>Insufficient [material.display_name] to replicate.</span>")
			allow_work = 0
			return

	allow_work = 1
	return

/obj/machinery/ammo_workbench/proc/eat_material()
	if(allow_work == 1)
		for(var/obj/item/ammo_parts/V in current_bullet)
			src.stored_material[V.material.name] -= V.cost

/obj/machinery/ammo_workbench/proc/ask(mob/user)

	if(bullet_ready == 1)
		var/N = input(user, "Use old design or build new?", "[src]") as null|anything in list ("Replicate programmed bullet", "Design new bullet")
		if(N)
			var/result = N
			N = null
			check_material()
			if (result == "Replicate programmed bullet" && allow_work == 1)
				eat_material()
				busy = 1
				update_use_power(2)
				//Fancy autolathe animation.
				//flick("autolathe_n", src)
				var/obj/item/ammo_magazine/custom_box/T = new /obj/item/ammo_magazine/custom_box
				T.stored_ammo = list()
				for(var/i in 1 to 16)
					var/obj/item/ammo_casing/custom/C = new
					var/obj/item/projectile/bullet/custom/BB = new
					C.BB = BB
					C.caliber = selected_caliber
					BB.bullet_type = src.selected_type
					BB.damage = current_bullet.damage
					BB.armor_penetration = current_bullet.armor_penetration
					BB.incendiary = current_bullet.incendiary
					BB.rad = current_bullet.rad
					T.stored_ammo += C
				sleep(build_time)
				busy = 0
				T.forceMove(src.loc)
				allow_work = 0
				return
			else if (result == "Design new bullet")
				bullet_ready = 0
			else
				to_chat(user, "<span class='notice'>Insufficient material to replicate.</span>")
				return
	if(current_bullet)
		qdel(current_bullet)
	current_bullet = new /obj/item/projectile/bullet/custom(src)

	var/N = input(user, "Select the calibre", "[src]") as null|anything in caliber_types
	if(N)
		selected_caliber = N
		N = null
	N = input(user, "Select the type of ammunition", "[src]") as null|anything in ammo_types
	if(N)
		selected_type = N


		current_bullet.bullet_type = selected_type
		N = null


	N = input(user,"Select the type of material for charge", "[src]") as null|anything in charge_list
	if(N)
		current_bullet.composition += new /obj/item/ammo_parts/gunpowder(current_bullet, N)


		N = null


	N = input(user, "Select the type of material for jacket", "[src]") as null|anything in stored_material
	if(N)
		current_bullet.composition += new /obj/item/ammo_parts/jacket(current_bullet, N)
		N = null

	if(current_bullet.type != "Sabot")
		N = input(user, "Select the type of material for heart", "[src]") as null|anything in stored_material
		if(N)
			current_bullet.composition += new /obj/item/ammo_parts/heart(current_bullet, N)


			N = null

	else if (current_bullet.type == "Sabot")
		N = input(user, "Select the type of material for needle", "[src]") as null|anything in stored_material
		if(N)
			current_bullet.composition += new /obj/item/ammo_parts/needle(current_bullet, N)

			N = null


	if(selected_type == "incendiary")
		N = input(user, "Select the type of material for incendiary", "[src]") as null|anything in incendiary_list
		if(N)
			current_bullet.composition += new /obj/item/ammo_parts/incendiary(current_bullet, N)
			N = null


	current_bullet.check_inside_parts()


	bullet_ready = 1
	return






/obj/machinery/ammo_workbench/attack_hand(user)
	if(busy)
		to_chat(usr, "<span class='notice'>The workbench is busy. Please wait for completion of previous operation.</span>")
		return
	ask(user)
	return

/obj/machinery/ammo_workbench/attackby(var/obj/item/O as obj, var/mob/user as mob)

	if(busy)
		to_chat(user, "<span class='notice'>\The [src] is busy. Please wait for completion of previous operation.</span>")
		return

	if(default_deconstruction_screwdriver(user, O))
		updateUsrDialog()
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(default_part_replacement(user, O))
		return

	if(stat)
		return

	if(panel_open)
		//Don't eat multitools or wirecutters used on an open lathe.
		if(istype(O, /obj/item/device/multitool) || istype(O, /obj/item/weapon/wirecutters))
			attack_hand(user)
			return

	if(O.loc != user && !(istype(O,/obj/item/stack)))
		return 0

	if(is_robot_module(O))
		return 0

	//Resources are being loaded.
	var/obj/item/eating = O
	if(!eating.matter)
		to_chat(user, "\The [eating] does not contain significant amounts of useful materials and cannot be accepted.")
		return

	var/filltype = 0       // Used to determine message.
	var/total_used = 0     // Amount of material used.
	var/mass_per_sheet = 0 // Amount of material constituting one sheet.

	for(var/material in eating.matter)

		if(isnull(stored_material[material]) || isnull(storage_capacity[material]))
			continue

		if(stored_material[material] >= storage_capacity[material])
			continue

		var/total_material = eating.matter[material]

		//If it's a stack, we eat multiple sheets.
		if(istype(eating,/obj/item/stack))
			var/obj/item/stack/stack = eating
			total_material *= stack.get_amount()

		if(stored_material[material] + total_material > storage_capacity[material])
			total_material = storage_capacity[material] - stored_material[material]
			filltype = 1
		else
			filltype = 2

		stored_material[material] += total_material
		total_used += total_material
		mass_per_sheet += eating.matter[material]

	if(!filltype)
		to_chat(user, "<span class='notice'>\The [src] is full. Please remove material from the autolathe in order to insert more.</span>")
		return
	else if(filltype == 1)
		to_chat(user, "You fill \the [src] to capacity with \the [eating].")
	else
		to_chat(user, "You fill \the [src] with \the [eating].")

	//flick("autolathe_o", src) // Plays metal insertion animation. Work out a good way to work out a fitting animation. ~Z

	if(istype(eating,/obj/item/stack))
		var/obj/item/stack/stack = eating
		stack.use(max(1, round(total_used/mass_per_sheet))) // Always use at least 1 to prevent infinite materials.
	else
		user.remove_from_mob(O)
		qdel(O)

	updateUsrDialog()
	return



