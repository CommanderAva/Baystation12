/obj/machinery/power/fission_reactor/
	name = "nuclear reactor"
	desc = "Core of the nuclear reactor. Contact admin or developer if you see this"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "core"
	density = 1
	use_power = 1
	idle_power_usage = 50
	active_power_usage = 200

	var/core_max_temp = 1000
	var/initial_temperature = 200
	var/light_e = 0
	var/rod_quality = 0
	var/control_rod_position = 0
	var/circular_system_quality = 0
	var/shielding_max_temp = 0
	var/turbine_quality = 0
	var/fail_percentage = 0
	var/divide_k = 0
	var/list/fuel_rods = null
	var/reactor_open = 0
	var/output = 0
	var/power_output = 0
	var/temperature = 0
	var/temperature_interchange = 0
	var/max_temperature = 0
	var/power_produced = 0
	var/fission = 0
	var/minwork = 0
	var/maxwork = 100
	var/fission_check = 0

/obj/machinery/power/fission_reactor/habar/New()
	..()

	component_parts = list()
	component_parts += new /obj/item/weapon/stock_parts/fission/control_rod/graphite(src)
	component_parts += new /obj/item/weapon/stock_parts/fission/circular_system/maverick(src)
	component_parts += new /obj/item/weapon/stock_parts/fission/shielding/plumbum(src)
	component_parts += new /obj/item/weapon/stock_parts/fission/turbine/chorus(src)
	component_parts += new /obj/item/weapon/stock_parts/fission/safety_system/nato(src)
	component_parts += new /obj/item/weapon/stock_parts/fission/circular_system/maverick(src)
	fuel_rods = list()
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)

	RefreshParts()


/*
/obj/machinery/power/fission_reactor/New()
	..()

	fuel_rods = list()
	fuel_rods += new /obj/item/weapon/fuel_rod/uranium238(src)
*/

/obj/machinery/power/fission_reactor/attack_ai(mob/user)
	attack_hand(user)

/obj/machinery/power/fission_reactor/Initialize()
	. = ..()
	connect_to_network()
	check_parts()

/obj/machinery/power/fission_reactor/proc/check_parts()
	for(var/obj/item/weapon/stock_parts/fission/P in component_parts)
		for(var/obj/item/weapon/stock_parts/fission/shielding/I in component_parts)
			src.shielding_max_temp = I.shielding_max_temp
		for(var/obj/item/weapon/stock_parts/fission/turbine/I in component_parts)
			src.turbine_quality = I.turbine_quality
		for(var/obj/item/weapon/stock_parts/fission/circular_system/I in component_parts)
			src.circular_system_quality = I.circular_system_quality
		for(var/obj/item/weapon/stock_parts/fission/control_rod/I in component_parts)
			src.rod_quality = I.rod_quality
		for(var/obj/item/weapon/stock_parts/fission/safety_system/I in component_parts)
			src.fail_percentage = I.fail_percentage

	max_temperature = core_max_temp + shielding_max_temp
	temperature_interchange = circular_system_quality + turbine_quality
	for(var/obj/item/weapon/fuel_rod/I in fuel_rods)
		src.divide_k = I.divide_k

/obj/machinery/power/fission_reactor/attackby(var/obj/item/weapon/fuel_rod/A, mob/user as mob)
	if (src.reactor_open == 0)
		to_chat(user, "<span class='notice'>You'll have to open the \"[src]\" first.</span>")
		return
	else if(!typesof(A, /obj/item/weapon/fuel_rod) && src.reactor_open == 1)
		to_chat(user, "<span class='notice'>You can't put that into reactor fuel slot!.</span>")
		return
	else
		if(A.fuel_life != 0)
			user.drop_item()
			A.forceMove(src)
			src.fuel_rods += A
			to_chat(user, "<span class='notice'>You add \"[A]\" into \the [src].</span>")

			return
		else if (fuel_rods.len == 10)
			to_chat(user, "<span class='notice'>All slots for fuel rods are full.</span>")
			return
		else if (A.fuel_life != 0)
			to_chat(user, "<span class='notice'>This \"[A]\" is depleted.</span>")
			return
/*
/obj/machinery/power/fission_reactor/proc/check_divide_k()
	var/obj/item/I = locate(/obj/item/fission_reactor/internal/fuel_rod/) in fuel_rods
	if(I.divide_k != 0)
		return divide_k

/obj/machinery/power/fission_reactor/proc/check_shielding_max_temp()
	var/obj/item/I = locate(/obj/item/fission_reactor/internal/shielding/) in component_parts
	if(I.shielding_max_temp != 0)
		return shielding_max_temp

/obj/machinery/power/fission_reactor/proc/check_turbine_quality()
	var/obj/item/I = locate(/obj/item/fission_reactor/internal/turbine/) in component_parts
	if(I.turbine_quality != 0)
		return turbine_quality

/obj/machinery/power/fission_reactor/proc/check_circular_system_quality()
	var/obj/item/I = locate(/obj/item/fission_reactor/internal/circular_system/) in component_parts
	if(I.circular_system_quality != 0)
		return circular_system_quality

/obj/machinery/power/fission_reactor/proc/check_control_rod_quality()
	var/obj/item/I = locate(/obj/item/fission_reactor/internal/control_rod/) in component_parts
	if(I.rod_quality != 0)
		return rod_quality

/obj/machinery/power/fission_reactor/proc/check_safety_system_quality()
	var/obj/item/I = locate(/obj/item/fission_reactor/internal/safety_system/) in component_parts
	if(I.fail_percentage != 0)
		return fail_percentage
*/
/obj/machinery/power/fission_reactor/proc/check_reaction()
	if(!fission)
		fission_check = "Dead"
	if(fission)
		fission_check = "Active"


/obj/machinery/power/fission_reactor/Process(mob/user as mob)
	check_parts()
	check_reaction()
	if(temperature > 0)
		temperature -= 10
	if(temperature < 0)
		temperature = 0
	if(reactor_open == 1)
		to_chat(user, "<span class='notice'>Reactor chamber opened. Close it before start.</span>")
		return
	if(control_rod_position == 0)
		fission = 0
		return
	for(var/obj/item/weapon/fuel_rod/I in src.fuel_rods)
		I.divide_k = src.divide_k
		if(I.fuel_life == 0)
			fission = 0
			return
	if(fission && fuel_rods.len > 0)
		temperature = temperature * (divide_k * (control_rod_position * 0.01))
		power_produced = temperature * temperature_interchange
		add_avail(power_produced * 3) //Don't ask me why the fuck i did it. BALANCE!

		for(var/obj/item/weapon/fuel_rod/I in src.fuel_rods)
			I.fuel_life -= 1



/obj/machinery/power/fission_reactor/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	// this is the data which will be sent to the ui

	var/data[0]
	data["totalOutput"] = power_produced
	data["totalTemperature"] = temperature
	data["maxTotalTemperature"] = max_temperature
	data["controlRodPosition"] = control_rod_position
	data["fuelRods"] = fuel_rods
	data["divideCoefficient"] = divide_k
	data["interchangeCoefficient"] = temperature_interchange
	data["fission"] = fission_check
	data["minwork"] = minwork
	data["maxwork"] = maxwork
	data["setControlRod"] = round(control_rod_position)




	// update the ui if it exists, returns null if no ui is passed/found
	ui = GLOB.nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		// the ui does not exist, so we'll create a new() one
		// for a list of parameters and their descriptions see the code docs in \code\modules\nano\nanoui.dm
		ui = new(user, src, ui_key, "fission_reactor.tmpl", "Fission Reactor", 700, 700)
		// when the ui is first opened this is the data it will use
		ui.set_initial_data(data)
		// open the new ui window
		ui.open()
		// auto update every Master Controller tick
		ui.set_auto_update(1)


/obj/machinery/power/fission_reactor/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["startFission"])
		fission = 1
		temperature += initial_temperature
		update_icon()

	if(href_list["stopFission"])
		control_rod_position = 0
		update_icon()

	if (href_list["rod_adj"])
		var/diff = text2num(href_list["rod_adj"])
		control_rod_position += diff


/obj/machinery/power/fission_reactor/attack_hand(mob/user)
	if(fuel_rods && reactor_open)
		check_parts()
		return
	if(!reactor_open)
		check_parts()
		ui_interact(user)

/obj/machinery/power/fission_reactor/verb/reactor_chamber(mob/user as mob)
	set category = "Object"
	set name = "Open/Close reactor chamber"
	set src in view(1)

	if(reactor_open)
		to_chat(user, "<span class='notice'>You've closed the [src] chamber</span>")
		reactor_open = 0
		check_parts()
		connect_to_network()
		return
	if(!reactor_open)
		to_chat(user, "<span class='notice'>You've opened the [src] chamber</span>")
		reactor_open = 1
		check_parts()
		disconnect_from_network()
		return

/obj/machinery/power/fission_reactor/habar
	name = "Habar X-1 Nuclear Reactor"
	desc = "Habar X-1 Nuclear Reactor, old but trustworhy, don't expect a lot from it though."
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "core"


