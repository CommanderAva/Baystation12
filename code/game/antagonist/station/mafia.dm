var/datum/antagonist/mafia/mafs

/datum/antagonist/mafia
	id = MODE_MAFIA
	role_text = "Godfather"
	role_text_plural = "Mafia"
	feedback_tag = "maf_objective"
	antag_indicator = "hudmaf"
	welcome_text = "Money. Power. Blackjack and whores."
	victory_text = "Mafia has completed their objectives!"
	loss_text = "Crew has managed to root out the mafia!"
	loss_feedback_tag = "loss - godfather killed"
	flags = ANTAG_SUSPICIOUS | ANTAG_VOTABLE
	antaghud_indicator = "hudmaf"

	hard_cap = 1
	hard_cap_round = 1
	initial_spawn_req = 1
	initial_spawn_target = 1

	//Inround revs.
	faction_role_text = "Mafioso"
	faction_descriptor = "Mafia"
	faction_verb = /mob/living/proc/convert_to_maf
	faction_welcome = "Help the Godfather achieve his objectives at all costs and try to stay alive."
	faction_indicator = "hudmafi"
	faction_invisible = 1
	faction = "Mafia"

	blacklisted_jobs = list(/datum/job/ai, /datum/job/cyborg)
	restricted_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/hos, /datum/job/chief_engineer, /datum/job/rd, /datum/job/cmo, /datum/job/lawyer)


/datum/antagonist/mafia/New()
	..()
	mafs = src

/datum/antagonist/mafia/create_global_objectives(var/datum/mind/mafia)
	if(!..())
		return
	else
		for(var/i in 1 to 10)
			switch(rand(1,100))
				if(1 to 33)
					var/datum/objective/assassinate/kill_objective = new
					kill_objective.owner = mafia
					kill_objective.find_target()
					mafia.objectives += kill_objective
				if(34 to 50)
					var/datum/objective/brig/brig_objective = new
					brig_objective.owner = mafia
					brig_objective.find_target()
					mafia.objectives += brig_objective
				if(51 to 66)
					var/datum/objective/harm/harm_objective = new
					harm_objective.owner = mafia
					harm_objective.find_target()
					mafia.objectives += harm_objective
				else
					var/datum/objective/steal/steal_objective = new
					steal_objective.owner = mafia
					steal_objective.find_target()
					mafia.objectives += steal_objective



/mob/living/proc/convert_to_maf(mob/M as mob in able_mobs_in_oview(src))
	set name = "Invite to family"
	set category = "Abilities"
	if(!M.mind || !M.client)
		return
	convert_to_faction(M.mind, mafs)

/datum/game_mode/mafia
	name = "Mafia"
	config_tag = "mafia"
	round_description = "Some crewmembers are members of mafioso family."
	extended_round_description = "Mafiso, you're in the family ruled by your Godfather. Protect him and do his bidding."
	required_players = 6
	required_enemies = 0
	auto_recall_shuttle = 0
	end_on_antag_death = 0
	shuttle_delay = 2
	antag_tags = list(MODE_MAFIA)
	require_all_templates = 1
