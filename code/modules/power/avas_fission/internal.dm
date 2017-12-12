/obj/item/weapon/stock_parts/fission
	name = "nuclear reactor internal item"
	desc = "Item inside the nuclear reactor. Contact admin or developer if you see this"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "internal"
	var/condition

/obj/item/weapon/stock_parts/fission/control_rod
	name = "nuclear reactor control rod"
	desc = "Control rod for the nuclear reactor. Contact admin or developer if you see this"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "rod"
	var/rod_quality = 1

/obj/item/weapon/fuel_rod
	name = "nuclear reactor fuel rod"
	desc = "Fuel rod for the nuclear reactor. Contact admin or developer if you see this"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "fuel_rod"
	var/fuel_life = 1
	var/divide_k = 1.3

/obj/item/weapon/stock_parts/fission/circular_system
	name = "nuclear reactor circular system"
	desc = "Circular system for the nuclear reactor. Contact admin or developer if you see this"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "circular_system"
	var/circular_system_quality = 1

/obj/item/weapon/stock_parts/fission/shielding
	name = "nuclear reactor shielding"
	desc = "Shielding for the nuclear reactor. Contact admin or developer if you see this"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "shielding"
	var/shielding_max_temp = 500

/obj/item/weapon/stock_parts/fission/turbine
	name = "nuclear reactor turbine"
	desc = "Turbine for the nuclear reactor. Contact admin or developer if you see this"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "turbine"
	var/turbine_quality = 1

/obj/item/weapon/stock_parts/fission/safety_system
	name = "nuclear reactor safety_system"
	desc = "Safety_system for the nuclear reactor. Contact admin or developer if you see this"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "safety"
	var/fail_percentage = 0.85

/obj/item/weapon/stock_parts/fission/control_rod/graphite
	name = "Graphite control rod"
	desc = "Control rod for the nuclear reactor. Made of graphite"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "rod"
	rod_quality = 1

/obj/item/weapon/stock_parts/fission/circular_system/maverick
	name = "Maverick-1 circular system"
	desc = "Circular system for the nuclear reactor"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "circular_system"
	circular_system_quality = 0.16

/obj/item/weapon/stock_parts/fission/shielding/plumbum
	name = "Plumbum reactor shielding"
	desc = "Shielding for the nuclear reactor. Made of plumbum, or lead in common"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "shielding"
	shielding_max_temp = 500

/obj/item/weapon/stock_parts/fission/turbine/chorus
	name = "Chorus Mark 1 turbine"
	desc = "Turbine for the nuclear reactor"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "turbine"
	turbine_quality = 0.16

/obj/item/weapon/stock_parts/fission/safety_system/nato
	name = "NA-TO nuclear engine safety system"
	desc = "Safety system for the nuclear reactor. They say it never works, but hey, you don't believe them"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "safety"
	fail_percentage = 0.85

/obj/item/weapon/fuel_rod/uranium238
	name = "Uranium-238 fuel rod"
	desc = "Uranium-238 fuel rod for the nuclear reactor. It has enough of U235 to work. It's in the protective casing, so it won't irradiate you"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "fuel_rod"
	fuel_life = 1000
	divide_k = 1.3

/obj/item/weapon/fuel_rod/uranium238/update_icon()
	if(fuel_life > 500)
		icon_state = "fuel_rod"
	else if(fuel_life > 200 && fuel_life < 500)
		icon_state = "fuel_rod_decayed"
	else if(fuel_life < 200)
		icon_state = "fuel_rod_depleted"

/obj/item/weapon/fuel_rod/uranium235
	name = "Uranium-235 fuel rod"
	desc = "Uranium-235 fuel rod for the nuclear reactor. Enriched to the point of U235 being the 90% of this rod. It's in the protective casing, so it won't irradiate you"
	icon = 'icons/obj/machines/power/fission.dmi'
	icon_state = "fuel_rod"
	fuel_life = 1500
	divide_k = 2.3