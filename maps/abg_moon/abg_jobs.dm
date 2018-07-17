/datum/map/abg
	allowed_jobs = list(/datum/job/serbian_kapitan, /datum/job/serbian_sergeant, /datum/job/serbian_soldier, /datum/job/serbian_doctor,
	/datum/job/usmc_sergeant, /datum/job/usmc_captain, /datum/job/usmc_marine, /datum/job/usmc_medic)
	species_to_job_whitelist = list()

/datum/map/abg/setup_map()
	..()
	for(var/job_type in GLOB.using_map.allowed_jobs)
		var/datum/job/job = decls_repository.get_decl(job_type)
		// Most species are restricted from SCG security and command roles
		if((job.department_flag & (COM)) && job.allowed_branches.len)
			for(var/species_name in list(SPECIES_IPC, SPECIES_TAJARA, SPECIES_SKRELL, SPECIES_UNATHI))
				var/datum/species/S = all_species[species_name]
				var/species_blacklist = species_to_job_blacklist[S.type]
				if(!species_blacklist)
					species_blacklist = list()
					species_to_job_blacklist[S.type] = species_blacklist
				species_blacklist |= job.type

/datum/job/serbian_kapitan
	title = "Srbski Komandant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the USSR Kosmichesky Kod and serbian admirality"
	outfit_type = /decl/hierarchy/mil_uniform/serb
	minimal_player_age = 22
	ideal_character_age = 30
	allowed_branches = list(
		/datum/mil_branch/serbs
	)
	allowed_ranks = list(
		/datum/mil_rank/ssa/k1
	)

	min_skill = list()


/datum/job/serbian_kapitan/get_description_blurb()
	return "You are the Commanding Officer of Serbian Space Forces during this operation. Be resilent and lead your men in a proper way to defend this installation."

/datum/job/serbian_sergeant
	title = "Vodnik"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Komandant"
	outfit_type = /decl/hierarchy/mil_uniform/serb
	minimal_player_age = 22
	ideal_character_age = 30
	allowed_branches = list(
		/datum/mil_branch/serbs
	)
	allowed_ranks = list(
		/datum/mil_rank/ssa/k1
	)

	min_skill = list()

/datum/job/serbian_doctor

/datum/job/serbian_soldier

/datum/job/usmc_captain
	title = "USMC Commander"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the NATO Space Marine Code and NATO General Command"
	outfit_type = /decl/hierarchy/mil_uniform/serb
	minimal_player_age = 24
	ideal_character_age = 30
	allowed_branches = list(
		/datum/mil_branch/marine
	)
	allowed_ranks = list(
		/datum/mil_rank/us/k1
	)

	min_skill = list()


/datum/job/usmc_captain/get_description_blurb()
	return "You are the Commanding Officer of USMC forces during this operation. Make sure to capture the installation without loosing to much men."


/datum/job/usmc_marine

/datum/job/usmc_medic

/datum/job/usmc_sergeant
/*



/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "the Captain"
	department_flag = ENG
	outfit_type = /decl/hierarchy/outfit/job/bearcat/chief_engineer

/datum/job/doctor
	title = "Doc"
	supervisors = "the Captain and your idea of Hippocratic Oath"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/doc
	alt_titles = list(
		"Surgeon")
	total_positions = 1
	spawn_positions = 1
	hud_icon = "hudmedicaldoctor"

/datum/job/hop
	title = "First Mate"
	supervisors = "the Captain and the Merchant Code"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/mate
	hud_icon = "hudheadofpersonnel"

/datum/job/assistant
	title = "Deck Hand"
	supervisors = "literally everyone, you bottom feeder"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/hand
	alt_titles = list(
		"Cook" = /decl/hierarchy/outfit/job/bearcat/hand/cook,
		"Cargo Hand",
		"Passenger")
	hud_icon = "hudcargotechnician"

/datum/job/engineer
	title = "Junior Engineer"
	supervisors = "Chief Engineer"
	total_positions = 2
	spawn_positions = 2
	hud_icon = "hudengineer"

/datum/job/cyborg
	supervisors = "your laws and the Captain"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/hand/engine
	total_positions = 1
	spawn_positions = 1


// OUTFITS
#define BEARCAT_OUTFIT_JOB_NAME(job_name) ("Bearcat - Job - " + job_name)

/decl/hierarchy/outfit/job/bearcat/
	hierarchy_type = /decl/hierarchy/outfit/job/bearcat
	pda_type = /obj/item/device/pda
	pda_slot = slot_l_store
	l_ear = null
	r_ear = null

/decl/hierarchy/outfit/job/bearcat/captain
	name = BEARCAT_OUTFIT_JOB_NAME("Captain")
	uniform = /obj/item/clothing/under/casual_pants/classicjeans
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/device/pda/captain
	r_pocket = /obj/item/device/radio
	id_type = /obj/item/weapon/card/id/gold


/decl/hierarchy/outfit/job/bearcat/captain/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/toggleable/hawaii/random/eyegore = new()
		if(uniform.can_attach_accessory(eyegore))
			uniform.attach_accessory(null, eyegore)
		else
			qdel(eyegore)

/decl/hierarchy/outfit/job/bearcat/chief_engineer
	name = BEARCAT_OUTFIT_JOB_NAME("Chief Engineer")
	uniform = /obj/item/clothing/under/rank/chief_engineer
	glasses = /obj/item/clothing/glasses/welding/superior
	suit = /obj/item/clothing/suit/storage/hazardvest
	gloves = /obj/item/clothing/gloves/thick
	shoes = /obj/item/clothing/shoes/workboots
	pda_type = /obj/item/device/pda/heads/ce
	l_hand = /obj/item/weapon/wrench
	belt = /obj/item/weapon/storage/belt/utility/full
	id_type = /obj/item/weapon/card/id/engineering/head
	r_pocket = /obj/item/device/radio
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/bearcat/doc
	name = BEARCAT_OUTFIT_JOB_NAME("Ship's Doc")
	uniform = /obj/item/clothing/under/det/black
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	pda_type = /obj/item/device/pda/medical

/decl/hierarchy/outfit/job/bearcat/mate
	name = BEARCAT_OUTFIT_JOB_NAME("First Mate")
	uniform = /obj/item/clothing/under/suit_jacket/checkered
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses/big
	pda_type = /obj/item/device/pda/cargo
	l_hand = /obj/item/weapon/clipboard

/decl/hierarchy/outfit/job/bearcat/hand
	name = BEARCAT_OUTFIT_JOB_NAME("Deck Hand")

/decl/hierarchy/outfit/job/bearcat/hand/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(list(/obj/item/clothing/under/overalls,/obj/item/clothing/under/focal,/obj/item/clothing/under/hazard,/obj/item/clothing/under/rank/cargotech,/obj/item/clothing/under/color/black,/obj/item/clothing/under/color/grey,/obj/item/clothing/under/casual_pants/track, ))

/decl/hierarchy/outfit/job/bearcat/hand/cook
	name = BEARCAT_OUTFIT_JOB_NAME("Cook")
	head = /obj/item/clothing/head/chefhat
	suit = /obj/item/clothing/suit/chef/classic

/decl/hierarchy/outfit/job/bearcat/hand/engine
	name = BEARCAT_OUTFIT_JOB_NAME("Junior Engineer")
	head = /obj/item/clothing/head/hardhat
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/bearcat/hand/engine/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(50))
		suit = /obj/item/clothing/suit/storage/hazardvest
*/