/datum/subsystem/area_capture
	name = "capture zone"
	icon_state = "teleporter"
	var/faction_to_capture = null
	var/cp = 0 //Capture points, faggot
	var/controller = null
	var/has_people = 0
	var/stalkers = 0
	var/bandits = 0
	var/duty = 0
	var/list/factions = list(		"stalkers" = 0,
									"bandits" = 0,
									"duty" = 0

	)
	var/list/factions_cp = list(	"stalkers" = 0,
									"bandits" = 0,
									"duty" = 0

	)

/datum/subsystem/area_capture/Entered(var/mob/living/carbon/human/M, src)
	has_people += 1
	if(M.faction = "stalkers")
		factions["stalkers"] += 1
	if(M.faction = "bandits")
		factions["bandits"] += 1
	if(M.faction = "duty")
		factions["duty"] += 1
	return

/datum/subsystem/area_capture/Exited(var/mob/living/carbon/human/M, src)
	has_people -= 1
	if(M.faction = "stalkers")
		factions["stalkers"] -= 1
	if(M.faction = "bandits")
		factions["bandits"] -= 1
	if(M.faction = "duty")
		factions["duty"] -= 1
	return
/datum/subsystem/area_capture/Initialize()
	. = ..()
	Process()

/datum/subsystem/area_capture/Process()
	if(has_people > 0)
		fire()

/datum/subsystem/area_capture/fire()
	var/max_val = 0
	var/max_faction = ""
	for(var/faction in factions)
		if(factions[faction] > max_val)
			if(factions_cp[factions.faction])
			max_val = factions_list[faction]
			max_faction = faction






