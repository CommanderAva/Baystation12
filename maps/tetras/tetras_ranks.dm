
//Tetras ranks

/datum/map/tetras
	branch_types = list(
		/datum/mil_branch/avalanche,
		/datum/mil_branch/sundowner,
		/datum/mil_branch/mios,
		/datum/mil_branch/chman,
		/datum/mil_branch/josephs,
		/datum/mil_branch/scamp
	)

	spawn_branch_types = list(
		/datum/mil_branch/avalanche,
		/datum/mil_branch/sundowner,
		/datum/mil_branch/mios,
		/datum/mil_branch/chman,
		/datum/mil_branch/josephs,
		/datum/mil_branch/scamp
	)

	species_to_branch_whitelist = list(
		/datum/species/diona   = list(/datum/mil_branch/mios, /datum/mil_branch/sundowner),
		/datum/species/nabber  = list(/datum/mil_branch/mios),
		/datum/species/tajaran = list(/datum/mil_branch/mios, /datum/mil_branch/sundowner, /datum/mil_branch/scamp, /datum/mil_branch/chman),
		/datum/species/skrell  = list(/datum/mil_branch/mios, /datum/mil_branch/scamp),
		/datum/species/unathi  = list(/datum/mil_branch/mios),
		/datum/species/vox     = list(/datum/mil_branch/chman)
	)

	species_to_branch_blacklist = list()
	species_to_rank_whitelist = list()

/datum/mil_branch/avalanche
	name = "Avalanche Concern"
	name_short = "Avalanche"
	email_domain = "tetras.ava.main"

	rank_types = list(
		/datum/mil_rank/ava/o7,
		/datum/mil_rank/ava/o8,
		/datum/mil_rank/ava/o9,
		/datum/mil_rank/ava/o10
	)

	spawn_rank_types = list(
		/datum/mil_rank/ava/o7,
		/datum/mil_rank/ava/o8,
		/datum/mil_rank/ava/o9
	)

	assistant_job = "Crewman"


/datum/mil_rank/ava/o7
	name = "Third Class Supervisor"
	name_short = "TCS"
	accessory = list(/obj/item/clothing/accessory/rank/ava/o7)
	sort_order = 1

/datum/mil_rank/ava/o8
	name = "Second Class Supervisor"
	name_short = "SCS"
	accessory = list(/obj/item/clothing/accessory/rank/ava/o8)
	sort_order = 2

/datum/mil_rank/ava/o9
	name = "First Class Supervisor"
	name_short = "FCS"
	accessory = list(/obj/item/clothing/accessory/rank/ava/o9)
	sort_order = 3

/datum/mil_rank/ava/o10
	name = "Grand Supervisor"
	name_short = "GS"
	accessory = list(/obj/item/clothing/accessory/rank/ava/o10)
	sort_order = 4




/datum/mil_branch/sundowner
	name = "Sundowner Pvt.Sec."
	name_short = "SPS"
	email_domain = "tetras.ava.sps"

	rank_types = list(
		/datum/mil_rank/ss/e1,
		/datum/mil_rank/ss/e2,
		/datum/mil_rank/ss/e3,
		/datum/mil_rank/ss/o1,
		/datum/mil_rank/ss/o2,
		/datum/mil_rank/ss/o3,
		/datum/mil_rank/ss/o4
	)

	spawn_rank_types = list(
		/datum/mil_rank/ss/e1,
		/datum/mil_rank/ss/e2,
		/datum/mil_rank/ss/e3,
		/datum/mil_rank/ss/o1,
		/datum/mil_rank/ss/o2,
		/datum/mil_rank/ss/o3,
		/datum/mil_rank/ss/o4
	)

	assistant_job = "Crewman"

/datum/mil_rank/ss/e1
	name = "Ryadovoy"
	name_short = "Ryadovoy"
	accessory = list(/obj/item/clothing/accessory/rank/ss/e1)
	sort_order = 1

/datum/mil_rank/ss/e2
	name = "Yefreytor"
	name_short = "Yefreytor"
	accessory = list(/obj/item/clothing/accessory/rank/ss/e2)
	sort_order = 2

/datum/mil_rank/ss/e3
	name = "Sergeant"
	name_short = "Sergeant"
	accessory = list(/obj/item/clothing/accessory/rank/ss/e3)
	sort_order = 3

/datum/mil_rank/ss/o1
	name = "Praporshik"
	name_short = "Praporshik"
	accessory = list(/obj/item/clothing/accessory/rank/ss/o1)
	sort_order = 4

/datum/mil_rank/ss/o2
	name = "Leytenant"
	name_short = "Leytenant"
	accessory = list(/obj/item/clothing/accessory/rank/ss/o2)
	sort_order = 5

/datum/mil_rank/ss/o3
	name = "Kapitan"
	name_short = "Kapitan"
	accessory = list(/obj/item/clothing/accessory/rank/ss/o3)
	sort_order = 6

/datum/mil_rank/ss/o4
	name = "Major"
	name_short = "Major"
	accessory = list(/obj/item/clothing/accessory/rank/ss/o4)
	sort_order = 7




/datum/mil_branch/mios
	name = "Mio's Services"
	name_short = "MS"
	email_domain = "tetras.ava.ms"

	rank_types = list(
		/datum/mil_rank/ms/e1,
		/datum/mil_rank/ms/e2,
		/datum/mil_rank/ms/e3,
		/datum/mil_rank/ms/e4,
		/datum/mil_rank/ms/w1,
		/datum/mil_rank/ms/o1
	)

	spawn_rank_types = list(
		/datum/mil_rank/ms/e1,
		/datum/mil_rank/ms/e2,
		/datum/mil_rank/ms/e3,
		/datum/mil_rank/ms/e4,
		/datum/mil_rank/ms/w1,
		/datum/mil_rank/ms/o1
	)

	assistant_job = "Crewman"

/datum/mil_rank/ms/e1
	name = "Trial Serviceman"
	name_short = "TLS"
	accessory = list(/obj/item/clothing/accessory/rank/ms/e1)
	sort_order = 1

/datum/mil_rank/ms/e2
	name = "Junior Serviceman"
	name_short = "JRS"
	accessory = list(/obj/item/clothing/accessory/rank/ms/enlisted)
	sort_order = 2

/datum/mil_rank/ms/e3
	name = "Serviceman"
	name_short = "S"
	accessory = list(/obj/item/clothing/accessory/rank/ms/enlisted)
	sort_order = 3

/datum/mil_rank/ms/e4
	name = "Major Serviceman"
	name_short = "MJS"
	accessory = list(/obj/item/clothing/accessory/rank/ms/enlisted)
	sort_order = 4

/datum/mil_rank/ms/w1
	name = "Overseer"
	name_short = "OS"
	accessory = list(/obj/item/clothing/accessory/rank/ms/overseer)
	sort_order = 5

/datum/mil_rank/ms/o1
	name = "Manager"
	name_short = "HO"
	accessory = list(/obj/item/clothing/accessory/rank/ms/overseer)
	sort_order = 6



/datum/mil_branch/chman
	name = "ChMan Industries and Mining"
	name_short = "CIM"
	email_domain = "tetras.ava.cIm"

	rank_types = list(
		/datum/mil_rank/cm/e1,
		/datum/mil_rank/cm/e2,
		/datum/mil_rank/cm/e3,
		/datum/mil_rank/cm/e4,
		/datum/mil_rank/cm/w1,
		/datum/mil_rank/cm/o1
	)

	spawn_rank_types = list(
		/datum/mil_rank/cm/e1,
		/datum/mil_rank/cm/e2,
		/datum/mil_rank/cm/e3,
		/datum/mil_rank/cm/e4,
		/datum/mil_rank/cm/w1,
		/datum/mil_rank/cm/o1
	)

	assistant_job = "Crewman"

/datum/mil_rank/cm/e1
	name = "Cooperator"
	name_short = "CP"
	accessory = list(/obj/item/clothing/accessory/rank/cm/e1)
	sort_order = 1

/datum/mil_rank/cm/e2
	name = "Junior Worker"
	name_short = "JW"
	accessory = list(/obj/item/clothing/accessory/rank/cm/enlisted)
	sort_order = 2

/datum/mil_rank/cm/e3
	name = "Worker"
	name_short = "W"
	accessory = list(/obj/item/clothing/accessory/rank/cm/enlisted)
	sort_order = 3

/datum/mil_rank/cm/e4
	name = "Major Worker"
	name_short = "MW"
	accessory = list(/obj/item/clothing/accessory/rank/cm/enlisted)
	sort_order = 4

/datum/mil_rank/cm/w1
	name = "Head Overseer"
	name_short = "HOS"
	accessory = list(/obj/item/clothing/accessory/rank/cm/inspector)
	sort_order = 5

/datum/mil_rank/cm/o1
	name = "Technical Inspector and Manager"
	name_short = "TIM"
	accessory = list(/obj/item/clothing/accessory/rank/cm/inspector)
	sort_order = 6



/datum/mil_branch/josephs
	name = "Dr.Josephs Med&Genetics"
	name_short = "Josephs"
	email_domain = "tetras.ava.jose"

	rank_types = list(
		/datum/mil_rank/jose/e1,
		/datum/mil_rank/jose/e2,
		/datum/mil_rank/jose/e3,
		/datum/mil_rank/jose/o1,
		/datum/mil_rank/jose/o2,
		/datum/mil_rank/jose/o3,
		/datum/mil_rank/jose/o4
	)

	spawn_rank_types = list(
		/datum/mil_rank/jose/e1,
		/datum/mil_rank/jose/e2,
		/datum/mil_rank/jose/e3,
		/datum/mil_rank/jose/o1,
		/datum/mil_rank/jose/o2,
		/datum/mil_rank/jose/o3,
		/datum/mil_rank/jose/o4
	)

	assistant_job = "Crewman"

/datum/mil_rank/jose/e1
	name = "Aspirant"
	name_short = "A"
	accessory = list(/obj/item/clothing/accessory/rank/jose/e1)
	sort_order = 1

/datum/mil_rank/jose/e2
	name = "Nurse"
	name_short = "N"
	accessory = list(/obj/item/clothing/accessory/rank/jose/nurse)
	sort_order = 2

/datum/mil_rank/jose/e3
	name = "Head Nurse"
	name_short = "HN"
	accessory = list(/obj/item/clothing/accessory/rank/jose/nurse)
	sort_order = 3

/datum/mil_rank/jose/o1
	name = "Doctor"
	name_short = "D"
	accessory = list(/obj/item/clothing/accessory/rank/jose/doctor)
	sort_order = 4

/datum/mil_rank/jose/o2
	name = "Head Doctor"
	name_short = "HD"
	accessory = list(/obj/item/clothing/accessory/rank/jose/doctor)
	sort_order = 5

/datum/mil_rank/jose/o3
	name = "First-professional"
	name_short = "FP"
	accessory = list(/obj/item/clothing/accessory/rank/jose/o3)
	sort_order = 6

/datum/mil_rank/jose/o4
	name = "Doctor of Medical Sciences"
	name_short = "DMS"
	accessory = list(/obj/item/clothing/accessory/rank/jose/o4)
	sort_order = 7



/datum/mil_branch/scamp
	name = "SCA-MP R&D"
	name_short = "SCAMP"
	email_domain = "tetras.ava.scamp"

	rank_types = list(
		/datum/mil_rank/sc/e1,
		/datum/mil_rank/sc/e2,
		/datum/mil_rank/sc/e3,
		/datum/mil_rank/sc/e4,
		/datum/mil_rank/sc/e5,
		/datum/mil_rank/sc/e6,
		/datum/mil_rank/sc/w1,
		/datum/mil_rank/sc/w2,
		/datum/mil_rank/sc/w3,
		/datum/mil_rank/sc/w4,
		/datum/mil_rank/sc/o1,
		/datum/mil_rank/sc/o2
	)

	spawn_rank_types = list(
		/datum/mil_rank/sc/e2,
		/datum/mil_rank/sc/e3,
		/datum/mil_rank/sc/e4,
		/datum/mil_rank/sc/e5,
		/datum/mil_rank/sc/w1,
		/datum/mil_rank/sc/w2,
		/datum/mil_rank/sc/o1
	)

	assistant_job = "Crewman"

/datum/mil_rank/sc/e1
	name = "Abiturient"
	name_short = "ABT"
	accessory = list(/obj/item/clothing/accessory/rank/sc/e1)
	sort_order = 1

/datum/mil_rank/sc/e2
	name = "Student"
	name_short = "ST"
	accessory = list(/obj/item/clothing/accessory/rank/sc/e1)
	sort_order = 2

/datum/mil_rank/sc/e3
	name = "Associate"
	name_short = "ASSC"
	accessory = list(/obj/item/clothing/accessory/rank/sc/e2)
	sort_order = 3

/datum/mil_rank/sc/e4
	name = "Major Associate"
	name_short = "MASSC"
	accessory = list(/obj/item/clothing/accessory/rank/sc/e2)
	sort_order = 4

/datum/mil_rank/sc/e5
	name = "Bachelor"
	name_short = "BAC"
	accessory = list(/obj/item/clothing/accessory/rank/sc/e3)
	sort_order = 5

/datum/mil_rank/sc/e6
	name = "Major Bachelor"
	name_short = "MBAC"
	accessory = list(/obj/item/clothing/accessory/rank/sc/e3)
	sort_order = 6

/datum/mil_rank/sc/w1
	name = "Master of Arts"
	name_short = "MAS"
	accessory = list(/obj/item/clothing/accessory/rank/sc/w1)
	sort_order = 7

/datum/mil_rank/sc/w2
	name = "Master of Sciences"
	name_short = "MoS"
	accessory = list(/obj/item/clothing/accessory/rank/sc/w1)
	sort_order = 1

/datum/mil_rank/sc/w3
	name = "Doctor of Arts"
	name_short = "D"
	accessory = list(/obj/item/clothing/accessory/rank/sc/w1)
	sort_order = 2

/datum/mil_rank/sc/w4
	name = "Doctor of Sciences"
	name_short = "DS"
	accessory = list(/obj/item/clothing/accessory/rank/sc/w1)
	sort_order = 3

/datum/mil_rank/sc/o1
	name = "Head of Sciences Candidate"
	name_short = "HoSSC"
	accessory = list(/obj/item/clothing/accessory/rank/sc/o1)
	sort_order = 4

/datum/mil_rank/sc/o2
	name = "Head of Sciences"
	name_short = "HoSS"
	accessory = list(/obj/item/clothing/accessory/rank/sc/o2)
	sort_order = 5


//AVALANCHE
