/material/depleted_uranium
	name = "depleted uranium"
	stack_type = /obj/item/stack/material/depleted_uranium
	radioactivity = 8
	icon_base = "stone"
	display_name = "depleted uranium"
	icon_reinf = "reinf_stone"
	icon_colour = "#001a00"
	weight = 28
	hardness = 60
	integrity = 350
	stack_origin_tech = list(TECH_MATERIAL = 5)
	door_icon_base = "stone"
	sheet_singular_name = "pellet"
	sheet_plural_name = "pellets"
	ignition_point = T0C+350
	incendiary = 1.1

/material/copper
	name = "copper"
	stack_type = /obj/item/stack/material/copper
	display_name = "copper"
	icon_colour = "#cc3300"
	weight = 20
	hardness = 15
	integrity = 120
	stack_origin_tech = list(TECH_MATERIAL = 4)
	sheet_singular_name = "ingot"
	sheet_plural_name = "ingots"

/material/lead
	name = "lead"
	stack_type = /obj/item/stack/material/lead
	icon_colour = "#999966"
	weight = 40
	hardness = 7
	display_name = "lead"
	integrity = 80
	stack_origin_tech = list(TECH_MATERIAL = 4)
	sheet_singular_name = "ingot"
	sheet_plural_name = "ingots"

/material/gunpowder
	name = "gunpowder"
	stack_type = /obj/item/stack/material/gunpowder
	icon_colour = "#999966"
	weight = 7
	display_name = "gunpowder"
	hardness = 1
	integrity = 10
	ignition_point = T0C+100
	stack_origin_tech = list(TECH_MATERIAL = 4)
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	power = 1


/obj/item/stack/material/copper
	name = "copper"
	icon_state = "sheet-uranium"
	default_type = "copper"


/obj/item/stack/material/copper/fifty
	name = "copper"
	icon_state = "sheet-uranium"
	default_type = "copper"
	amount = 50

/obj/item/stack/material/depleted_uranium
	name = "depleted uranium"
	icon_state = "sheet-uranium"
	default_type = "depleted uranium"

/obj/item/stack/material/depleted_uranium/fifty
	name = "depleted uranium"
	icon_state = "sheet-uranium"
	default_type = "depleted uranium"
	amount = 50


/obj/item/stack/material/lead
	name = "lead"
	icon_state = "sheet-uranium"
	default_type = "lead"

/obj/item/stack/material/lead/fifty
	name = "lead"
	icon_state = "sheet-uranium"
	default_type = "lead"
	amount = 50


/obj/item/stack/material/gunpowder
	name = "gunpowder"
	icon_state = "sheet-uranium"
	default_type = "gunpowder"

/obj/item/stack/material/gunpowder/fifty
	name = "gunpowder"
	icon_state = "sheet-uranium"
	default_type = "gunpowder"
	amount = 50






