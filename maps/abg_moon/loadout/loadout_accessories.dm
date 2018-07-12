/datum/gear/accessory
	display_name = "locket"
	path = /obj/item/clothing/accessory/locket
	slot = slot_tie
	sort_category = "Accessories"

/* all this is left as example
//have to break up armbands to restrict access
/datum/gear/accessory/armband_security
	display_name = "security armband"
	path = /obj/item/clothing/accessory/armband
	allowed_roles = SECURITY_ROLES

/datum/gear/accessory/holster
	display_name = "holster selection"
	path = /obj/item/clothing/accessory/holster
	cost = 3
	allowed_roles = ARMED_ROLES
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/accessory/tie/New()
	..()
	var/ties = list()
	ties["blue tie"] = /obj/item/clothing/accessory/blue
	ties["red tie"] = /obj/item/clothing/accessory/red
	ties["blue tie, clip"] = /obj/item/clothing/accessory/blue_clip
	ties["red long tie"] = /obj/item/clothing/accessory/red_long
	ties["black tie"] = /obj/item/clothing/accessory/black
	ties["yellow tie"] = /obj/item/clothing/accessory/yellow
	ties["navy tie"] = /obj/item/clothing/accessory/navy
	ties["horrible tie"] = /obj/item/clothing/accessory/horrible
	ties["brown tie"] = /obj/item/clothing/accessory/brown
	gear_tweaks += new/datum/gear_tweak/path(ties)

/datum/gear/accessory/tie_color
	display_name = "colored tie"
	path = /obj/item/clothing/accessory
	allowed_roles = NON_MILITARY_ROLES
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/accessory/tie_color/New()
	..()
	var/ties = list()
	ties["tie"] = /obj/item/clothing/accessory
	ties["striped tie"] = /obj/item/clothing/accessory/long
	gear_tweaks += new/datum/gear_tweak/path(ties)
*/