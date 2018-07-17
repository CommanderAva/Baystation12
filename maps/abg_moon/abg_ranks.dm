/datum/map/abg
	branch_types = list(
		/datum/mil_branch/serbs,
		/datum/mil_branch/marine
	)

	spawn_branch_types = list(
		/datum/mil_branch/serbs,
		/datum/mil_branch/marine
	)


/datum/mil_branch/serbs
	name = "Srpska Svemirska Armija"
	name_short = "SSA"
	email_domain = "srpska.rv.ssa"

	rank_types = list(
		/datum/mil_rank/ssa/r1,
		/datum/mil_rank/ssa/r2,
		/datum/mil_rank/ssa/s1,
		/datum/mil_rank/ssa/k1

	)

	spawn_rank_types = list(
		/datum/mil_rank/ssa/r1,
		/datum/mil_rank/ssa/r2,
		/datum/mil_rank/ssa/s1,
		/datum/mil_rank/ssa/k1

	)

	assistant_job = "Volonter"

	min_skill = list()


/datum/mil_branch/marine
	name = "United States Marine Corps"
	name_short = "USMC"
	email_domain = "usmc.us"

	rank_types = list(
		/datum/mil_rank/us/r1,
		/datum/mil_rank/us/s1,
		/datum/mil_rank/us/k1

	)

	spawn_rank_types = list(
		/datum/mil_rank/us/r1,
		/datum/mil_rank/us/s1,
		/datum/mil_rank/us/k1

	)

	assistant_job = "Provisionist"

	min_skill = list()

/datum/mil_rank/ssa/r1
	name = "Razvodnik"
	name_short = "RV"
//	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 1

/datum/mil_rank/ssa/r2
	name = "Decetar"
	name_short = "DT"
//	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 2

/datum/mil_rank/ssa/s1
	name = "Vodnik"
	name_short = "VD"
//	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 3


/datum/mil_rank/ssa/k1
	name = "Podporucnik"
	name_short = "PP"
//	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 4

//****USMC*****

/datum/mil_rank/us/r1
	name = "Private"
	name_short = "Pvt"
//	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 1

/datum/mil_rank/us/r2
	name = "Lance Corporal"
	name_short = "LCpl"
//	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 1

/datum/mil_rank/us/s1
	name = "Sergeant"
	name_short = "Sgt"
//	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 3


/datum/mil_rank/us/k1
	name = "Sergeant Major"
	name_short = "SgtMaj"
//	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 4
