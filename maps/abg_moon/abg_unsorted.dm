GLOBAL_LIST_EMPTY(serb_spawn)
GLOBAL_LIST_EMPTY(marine_spawn)

var/global/list/serb_spawn = list()
var/global/list/marine_spawn = list()

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


