/obj/item/weapon/gun/custom
	name = "custom gun"
	desc = "This really shouldn't exist yet."

	var/max_shots = 0                          // Weapon capacity.
	var/caliber = ""                           // Barrel size/type of projectile.
	var/decl/weapon_model/model                // Model and manufacturer info, if any.
	var/force_icon                             // File to override component icons with.
	var/force_icon_state                       // State to use with the above.
	var/gun_type = ""                              // General class of gun.
	var/jammed                                 // Are we jammed?
	var/list/components = list()
	var/list/accessories = list()              // Installed accessories, if any.
	//new stats
	var/weight
	var/complexity
	var/convenience

	flags =  CONDUCT



