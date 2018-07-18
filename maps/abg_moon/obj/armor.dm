/obj/item/clothing/suit/armor/zbruja
	name = "'Zbruja' armor suit"
	desc = "Zbruja is the latest mass-produced armor suit by Serbia for its military using the rich titanium deposits. Used extensively by SSA in non-vacuum conditions. Please note that this is NOT a spacesuit."
	icon_state = "zbruja"
	icon = 'maps/abg_moon/icons/items/armor.dmi'
	item_state_slots = list(
		slot_l_hand_str = "capspacesuit",
		slot_r_hand_str = "capspacesuit",
	)
	w_class = ITEM_SIZE_HUGE
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	allowed = list(/obj/item/weapon/tank/emergency, /obj/item/device/flashlight,/obj/item/weapon/gun/energy, /obj/item/weapon/gun/projectile, /obj/item/ammo_magazine, /obj/item/ammo_casing, /obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs)
	armor = list(melee = 40, bullet = 70, laser = 10, energy = 35, bomb = 60, bio = 70, rad = 100)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	siemens_coefficient = 0.8