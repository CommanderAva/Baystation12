GLOBAL_LIST_EMPTY(serb_spawn)
GLOBAL_LIST_EMPTY(marine_spawn)

var/global/list/serb_spawn = list()
var/global/list/marine_spawn = list()
var/global/serb_amount = 0
var/global/marine_amount = 0

/datum/spawnpoint/serb_spawn
	display_name = "Serbian Forces Barracks"
	disallow_job = list("USMC Commander")

/datum/spawnpoint/serb_spawn/New()
	..()
	turfs = GLOB.serb_spawn

/datum/spawnpoint/marine_spawn
	display_name = "USMC FOB"
	disallow_job = list("Srbski Komandant", "Vodnik")

/datum/spawnpoint/marine_spawn/New()
	..()
	turfs = GLOB.marine_spawn

/datum/controller/occupations/proc/balancing(var/branch)
	var/ratio = 4
	var/permission = 0
	var/diff = 0
	if(branch == "Srpska Svemirska Armija")
		diff = serb_amount - marine_amount
		if (diff >= ratio)
			to_chat(src, alert("To many Serbs. Choose another side or wait for more people to arrive to Marines."))
			return permission
		else
			permission = 1
			serb_amount += 1
			world << "Plus one serb"
			return permission
	else if (branch == "United States Marine Corps")
		if (marine_amount > serb_amount)
			to_chat(src, alert("To many Marines. Choose another side or wait for more people to arrive to Serbs."))
			return permission
		else
			permission = 1
			marine_amount += 1
			world << "Plus one marine"
			return permission
	else
		world << "yo this nigga is eating BEANS"
		to_chat(src, alert("You haven't selected the side to battle for in character occupation. If you had checked and this continues - contact admin."))
		return permission
