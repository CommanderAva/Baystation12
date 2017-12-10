/obj/item/weapon/circuitboard/ammo_workbench
	name = T_BOARD("Ammunition workbench")
	build_path = /obj/machinery/power/fission_reactor/habar
	board_type = "machine"
	origin_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 2)
	req_components = list(
							/obj/item/weapon/stock_parts/console_screen = 1,
							/obj/item/weapon/stock_parts/matter_bin = 3,
							/obj/item/weapon/stock_parts/manipulator = 5
							)