/decl/hierarchy/mil_uniform
	name = "Master outfit hierarchy"
	hierarchy_type = /decl/hierarchy/mil_uniform
	var/branch = null
	var/departments = 0
	var/min_rank = 0

	var/pt_under = null
	var/pt_shoes = null

	var/utility_under = null
	var/utility_shoes = null
	var/utility_hat = null
	var/utility_extra = null

	var/service_under = null
	var/service_skirt = null
	var/service_over = null
	var/service_shoes = null
	var/service_hat = null
	var/service_gloves = null
	var/service_extra = null

	var/dress_under = null
	var/dress_skirt = null
	var/dress_over = null
	var/dress_shoes = null
	var/dress_hat = null
	var/dress_gloves = null
	var/dress_extra = null

//decl/hierarchy/mil_uniform/sundowner
//	name = "Head of Security outfit"
//	hierarchy_type = /decl/hierarchy/mil_uniform/sundowner
//	branch = /datum/mil_branch/sundowner

/decl/hierarchy/mil_uniform/serb
	name = "Master SSA outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/serb
	branch = /datum/mil_branch/serbs

	utility_under = /obj/item/clothing/under/serb
	utility_shoes = /obj/item/clothing/shoes/dutyboots
	utility_hat = /obj/item/clothing/head/serbsoft
	utility_extra = list()

/decl/hierarchy/mil_uniform/usmc
	name = "Master USMC outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/usmc
	branch = /datum/mil_branch/marine

/decl/hierarchy/outfit/job/serb/komandant
	name = OUTFIT_JOB_NAME("Komandant")
	hierarchy_type = /decl/hierarchy/mil_uniform/serb
	uniform = /obj/item/clothing/under/serb
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/dutyboots
	head = /obj/item/clothing/head/serbsoft

/decl/hierarchy/outfit/job/serb/
	name = OUTFIT_JOB_NAME("Serbian Soldier")
	hierarchy_type = /decl/hierarchy/mil_uniform/serb
	uniform = /obj/item/clothing/under/serb
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/dutyboots
	head = /obj/item/clothing/head/serbsoft