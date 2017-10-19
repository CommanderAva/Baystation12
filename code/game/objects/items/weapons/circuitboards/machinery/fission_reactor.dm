/obj/item/weapon/circuitboard/fission_reactor
	name = T_BOARD("Habar X-1 nuclear reactor")
	build_path = /obj/machinery/power/fission_reactor/habar
	board_type = "machine"
	origin_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 2)
	req_components = list(
							/obj/item/weapon/stock_parts/fission/control_rod = 1,
							/obj/item/weapon/stock_parts/fission/circular_system = 1,
							/obj/item/weapon/stock_parts/fission/shielding = 1,
							/obj/item/weapon/stock_parts/fission/turbine = 1,
							/obj/item/weapon/stock_parts/fission/safety_system = 1

							)