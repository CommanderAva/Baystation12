/obj/item/clothing/head/helmet/serb/panzer
	name = "'Panzer-2' helmet"
	desc = "Panzer-2 is a serbian design of helmet made specifically for use with breathing equipment for space combat. Gives moderate protection from projectile weaponry, but don't hope for it too much"
	icon_state = "helmet_panzer"
	icon = 'maps/abg_moon/icons/items/helmet.dmi'
	valid_accessory_slots = null
	body_parts_covered = HEAD|EYES
	cold_protection = HEAD|EYES
	heat_protection = HEAD|EYES
	armor = list(melee = 60, bullet = 60, laser = 10, energy = 15, bomb = 20, bio = 0, rad = 0)
	siemens_coefficient = 0.4
	var/toggleable = TRUE
	var/shades = FALSE

/obj/item/clothing/head/helmet/serb/panzer/verb/toggle()
	set name = "Flick Shades"
	set category = "Object"
	set src in usr

	if(toggleable && !usr.incapacitated())
		if(shades)
			shades = FALSE
			src.icon_state = initial(icon_state)
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			to_chat(usr, "You flick the shades up, making you see more clearly [src].")
			update_clothing_icon()
		else
			shades = TRUE
			src.icon_state = "[icon_state]_shades"
			flash_protection = FLASH_PROTECTION_MODERATE
			tint = TINT_MODERATE
			to_chat(usr, "You flick the shades down, protecting your eyes from flash [src].")
			update_clothing_icon()

		usr.update_action_buttons()

/obj/item/clothing/head/serbsoft
	name = "Utility cap"
	desc = "Serbian utility cap. Provides no protection whatsoever. You wonder why it is even given out to space forces."
	icon_state = "serbsoft"
	icon = 'maps/abg_moon/icons/items/helmet.dmi'
	body_parts_covered = 0