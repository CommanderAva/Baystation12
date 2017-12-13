/obj/item/gunpart
	name = "custom gun part"
	desc = "custom gun part. Contact admin or dev if you see this"
	w_class = 2
	var/list/available_types = list()
	var/material
	var/default_material
	var/weight
	var/complexity
	var/convenience
	var/damage_nerf
	var/wm
	var/hm
	//loading system stats
	var/firemodes
	//receiver stats
	var/recoil
	var/size
	//barrel stats
	var/hardness
	var/caliber = ""
	//caliber lists
	var/list/available_calibers = list()
	var/list/receiver_calibers = list()
	var/list/small_calibers = list("545x18 MPT", "22 Long Rifle", "22 Winchester Magnum Rimfire", "380 Auto", "9mm Makarov", "38 Special",
	"357 Magnum", "10mm Auto", "44 Magnum", "45 ACP", "500 S&W")
	var/list/medium_calibers = list("5mm Rimfire Magnum", )
	var/list/shotgun_calibers = list ()
	var/list/big_calibers = list ()

/obj/item/gunpart/barrel
	name = "custom gun barrel"
	desc = "custom gun bareel. Contact admin or dev if you see this"

/obj/item/gunpart/barrel/proc/make_stats()
	weight = material.weight*wm
	hardness = material.hardness*hm

/obj/item/gunpart/receiver
	name = "custom gun receiver"
	desc = "custom gun receiver. Contact admin or dev if you see this"

/obj/item/gunpart/proc/set_material(var/new_material)
	material = get_material_by_name(new_material)
	if(!material)
		qdel(src)
	else
		name = "[material.display_name] [initial(name)]"
		if(applies_material_colour)
			color = material.icon_colour


/obj/item/gunpart/New(var/newloc, var/material_key)
	..(newloc)
	if(!material_key)
		material_key = default_material
	set_material(material_key)
	if(!material)
		qdel(src)
		return

