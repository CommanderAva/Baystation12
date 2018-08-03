/datum/crafting_recipe
	var/name = "" //in-game display name
	var/reqs[] = list() //type paths of items consumed associated with how many are needed
	var/result //type path of item resulting from this craft
	var/tools[] = list() //type paths of items needed but not consumed
	var/time = 30 //time in deciseconds
	var/parts[] = list() //type paths of items that will be placed in the result
	var/chem_catalysts[] = list() //like tools but for reagents
	var/category = CAT_NONE //where it shows up in the crafting UI
	var/subcategory = CAT_NONE

/datum/crafting_recipe/secbot
	name = "Zbruja"
	result = /obj/item/clothing/suit/armor/zbruja
	reqs = list(/obj/item/clothing/head/helmet/serb/panzer = 1,
				/obj/item/clothing/under/serb = 1)
	tools = list(TOOL_SCREWDRIVING)
	time = 60
	category = CAT_CLOTHING