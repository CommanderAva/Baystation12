#define HOLOGRAM_1					(1<<12) //idk for what does this goes, but it was in TG code. Muh kostyl.

/mob/living/proc/OpenCraftingMenu()
	return

/mob/living/carbon/human/OpenCraftingMenu()
	handcrafting.tg_ui_interact(src)

/datum/reagent/proc/on_update(atom/A)
	return

/datum/reagents/proc/conditional_update(atom/A)
	var/list/cached_reagents = reagent_list
	for(var/reagent in cached_reagents)
		var/datum/reagent/R = reagent
		R.on_update (A)
	update_total()

/mob/proc/transferItemToLoc(obj/item/I, newloc = null, force = FALSE)
	return unEquip(I, newloc)

#define CAT_NONE	""
#define CAT_WEAPONS	"Weapons"
#define CAT_MELEE	"Melee"
#define CAT_RANGED	"Ranged"
#define CAT_AMMO	"Ammo"
#define CAT_FOOD	"Food"
#define CAT_MEAT	"Meat"
#define CAT_VEGGIE	"Veggie"
#define CAT_GRAIN	"Grain"
#define CAT_CLOTHING "Clothing"
#define CAT_CLOTH	"Cloth"
#define CAT_LEATHER "Leather"
#define CAT_ARMOR	"Armor"
#define CAT_OTHER "Other"

/atom/proc/CheckParts(list/parts_list)
	for(var/A in parts_list)
		if(istype(A, /datum/reagent))
			if(!reagents)
				reagents = new()
			reagents.reagent_list.Add(A)
			reagents.conditional_update()
		else if(ismovable(A))
			var/atom/movable/M = A
			if(isliving(M.loc))
				var/mob/living/L = M.loc
				L.transferItemToLoc(M, src)
			else
				M.forceMove(src)

/datum/personal_crafting
	var/busy
	var/viewing_category = 1 //typical powergamer starting on the Weapons tab
	var/viewing_subcategory = 1
	var/list/categories = list(
				CAT_WEAPONS,
				CAT_FOOD,
				CAT_CLOTHING,
				CAT_OTHER
				)
	var/list/subcategories = list(
						list(
							CAT_MELEE,
							CAT_RANGED,
							CAT_AMMO),
						list(
							CAT_MEAT,
							CAT_VEGGIE,
							CAT_GRAIN),
                        list(
                        	CAT_CLOTH,
                        	CAT_LEATHER,
                        	CAT_ARMOR),
                        CAT_NONE
                       			 )

	var/datum/action/innate/crafting/button
	var/display_craftable_only = FALSE
	var/display_compact = TRUE

/datum/personal_crafting/proc/check_contents(datum/crafting_recipe/R, list/contents)
	contents = contents["other"]
	main_loop:
		for(var/A in R.reqs)
			var/needed_amount = R.reqs[A]
			for(var/B in contents)
				if(ispath(B, A))
					if(contents[B] >= R.reqs[A])
						continue main_loop
					else
						needed_amount -= contents[B]
						if(needed_amount <= 0)
							continue main_loop
						else
							continue
			return 0
	for(var/A in R.chem_catalysts)
		if(contents[A] < R.chem_catalysts[A])
			return 0
	return 1

/datum/personal_crafting/proc/get_environment(mob/user)
	. = list()
	for(var/obj/item/I in user.l_hand)
		. += I
	for(var/obj/item/I in user.r_hand)
		. += I
	if(!isturf(user.loc))
		return

/datum/personal_crafting/proc/get_surroundings(mob/user)
	. = list()
	.["tool_ability"] = list()
	.["other"] = list()
	for(var/obj/item/I in get_environment(user))
		if(istype(I, /obj/item/stack))
			var/obj/item/stack/S = I
			.["other"][I.type] += S.amount
		else if(I.tool_ability)
			.["tool_ability"] += I.tool_ability
			.["other"][I.type] += 1
		else
			if(istype(I, /obj/item/weapon/reagent_containers/))
				var/obj/item/weapon/reagent_containers/RC = I
				for(var/datum/reagent/A in RC.reagents.reagent_list)
					.["other"][A.type] += A.volume
			.["other"][I.type] += 1




/datum/personal_crafting/proc/check_tools(mob/user, datum/crafting_recipe/R, list/contents)
	if(!R.tools.len)
		return TRUE
	var/list/possible_tools = list()
	var/list/present_qualities = list()
	present_qualities |= contents["tool_behaviour"]
	for(var/obj/item/I in user.contents)
		if(istype(I, /obj/item/weapon/storage))
			for(var/obj/item/SI in I.contents)
				possible_tools += SI.type
				if(SI.tool_ability)
					present_qualities.Add(SI.tool_ability)

		possible_tools += I.type

		if(I.tool_ability)
			present_qualities.Add(I.tool_ability)

	possible_tools |= contents["other"]

	main_loop:
		for(var/A in R.tools)
			if(A in present_qualities)
				continue
			else
				for(var/I in possible_tools)
					if(ispath(I, A))
						continue main_loop
			return FALSE
	return TRUE


/datum/personal_crafting/proc/construct_item(mob/user, datum/crafting_recipe/R)
	var/list/contents = get_surroundings(user)
	if(check_contents(R, contents))
		if(check_tools(user, R, contents))
			if(do_after(user, R.time, target = user))
				contents = get_surroundings(user)
				if(!check_contents(R, contents))
					return ", missing component."
				if(!check_tools(user, R, contents))
					return ", missing tool."
				var/list/parts = del_reqs(R, user)
				var/atom/movable/I = new R.result (get_turf(user.loc))
				I.CheckParts(parts, R)
				return 0
			return "."
		return ", missing tool."
	return ", missing component."

/datum/personal_crafting/proc/del_reqs(datum/crafting_recipe/R, mob/user)
	var/list/surroundings
	var/list/Deletion = list()
	. = list()
	var/data
	var/amt
	main_loop:
		for(var/A in R.reqs)
			amt = R.reqs[A]
			surroundings = get_environment(user)
			surroundings -= Deletion
			if(ispath(A, /datum/reagent))
				var/datum/reagent/RG = new A
				var/datum/reagent/RGNT
				while(amt > 0)
					var/obj/item/weapon/reagent_containers/RC = locate() in surroundings
					RG = RC.reagents.get_reagent_amount(A)
					if(RG)
						if(!locate(RG.type) in Deletion)
							Deletion += new RG.type()
						if(RG.volume > amt)
							RG.volume -= amt
							data = RG.data
							RC.reagents.conditional_update(RC)
							RG = locate(RG.type) in Deletion
							RG.volume = amt
							RG.data += data
							continue main_loop
						else
							surroundings -= RC
							amt -= RG.volume
							RC.reagents.reagent_list -= RG
							RC.reagents.conditional_update(RC)
							RGNT = locate(RG.type) in Deletion
							RGNT.volume += RG.volume
							RGNT.data += RG.data
							qdel(RG)
						RC.on_reagent_change()
					else
						surroundings -= RC
			else if(ispath(A, /obj/item/stack))
				var/obj/item/stack/S
				var/obj/item/stack/SD
				while(amt > 0)
					S = locate(A) in surroundings
					if(S.amount >= amt)
						if(!locate(S.type) in Deletion)
							SD = new S.type()
							Deletion += SD
						S.use(amt)
						SD = locate(S.type) in Deletion
						SD.amount += amt
						continue main_loop
					else
						amt -= S.amount
						if(!locate(S.type) in Deletion)
							Deletion += S
						else
							data = S.amount
							S = locate(S.type) in Deletion
							S.add(data)
						surroundings -= S
			else
				var/atom/movable/I
				while(amt > 0)
					I = locate(A) in surroundings
					Deletion += I
					surroundings -= I
					amt--
	var/list/partlist = list(R.parts.len)
	for(var/M in R.parts)
		partlist[M] = R.parts[M]
	for(var/A in R.parts)
		if(istype(A, /datum/reagent))
			var/datum/reagent/RG = locate(A) in Deletion
			if(RG.volume > partlist[A])
				RG.volume = partlist[A]
			. += RG
			Deletion -= RG
			continue
		else if(istype(A, /obj/item/stack))
			var/obj/item/stack/ST = locate(A) in Deletion
			if(ST.amount > partlist[A])
				ST.amount = partlist[A]
			. += ST
			Deletion -= ST
			continue
		else
			while(partlist[A] > 0)
				var/atom/movable/AM = locate(A) in Deletion
				. += AM
				Deletion -= AM
				partlist[A] -= 1
	while(Deletion.len)
		var/DL = Deletion[Deletion.len]
		Deletion.Cut(Deletion.len)
		qdel(DL)

/datum/personal_crafting/tg_ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = 0, datum/tgui/master_ui = null, datum/ui_state/state = tg_default_state)
	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	world << "Crafting UI clicked"
	if(!ui)
		ui = new(user, src, ui_key, "personal_crafting", "Crafting Menu", 700, 800, master_ui)
		world << "UI should appear now"
		ui.open()

/datum/personal_crafting/ui_data(mob/user)
	var/list/data = list()
	var/list/subs = list()
	var/cur_subcategory = CAT_NONE
	var/cur_category = categories[viewing_category]
	if (islist(subcategories[viewing_category]))
		subs = subcategories[viewing_category]
		cur_subcategory = subs[viewing_subcategory]
	data["busy"] = busy
	data["prev_cat"] = categories[prev_cat()]
	data["prev_subcat"] = subs[prev_subcat()]
	data["category"] = cur_category
	data["subcategory"] = cur_subcategory
	data["next_cat"] = categories[next_cat()]
	data["next_subcat"] = subs[next_subcat()]
	data["display_craftable_only"] = display_craftable_only
	data["display_compact"] = display_compact

	var/list/surroundings = get_surroundings(user)
	var/list/can_craft = list()
	var/list/cant_craft = list()
	for(var/rec in crafting_recipes)
		var/datum/crafting_recipe/R = rec
		if((R.category != cur_category) || (R.subcategory != cur_subcategory))
			continue
		if(check_contents(R, surroundings))
			can_craft += list(build_recipe_data(R))
		else
			cant_craft += list(build_recipe_data(R))
	data["can_craft"] = can_craft
	data["cant_craft"] = cant_craft
	return data



/datum/personal_crafting/ui_act(action, params)
	if(..())
		return
	switch(action)
		if("make")
			var/datum/crafting_recipe/TR = locate(params["recipe"])
			busy = TRUE
			ui_interact(usr) //explicit call to show the busy display
			var/fail_msg = construct_item(usr, TR)
			if(!fail_msg)
				to_chat(usr, "<span class='notice'>[TR.name] constructed.</span>")
			else
				to_chat(usr, "<span class='warning'>Construction failed[fail_msg]</span>")
			busy = FALSE
			ui_interact(usr)
		if("forwardCat") //Meow
			viewing_category = next_cat(FALSE)
			. = TRUE
		if("backwardCat")
			viewing_category = prev_cat(FALSE)
			. = TRUE
		if("forwardSubCat")
			viewing_subcategory = next_subcat()
			. = TRUE
		if("backwardSubCat")
			viewing_subcategory = prev_subcat()
			. = TRUE
		if("toggle_recipes")
			display_craftable_only = !display_craftable_only
			. = TRUE
		if("toggle_compact")
			display_compact = !display_compact
			. = TRUE








//Next works nicely with modular arithmetic
/datum/personal_crafting/proc/next_cat(readonly = TRUE)
	if (!readonly)
		viewing_subcategory = 1
	. = viewing_category % categories.len + 1

/datum/personal_crafting/proc/next_subcat()
	if(islist(subcategories[viewing_category]))
		var/list/subs = subcategories[viewing_category]
		. = viewing_subcategory % subs.len + 1


//Previous can go fuck itself
/datum/personal_crafting/proc/prev_cat(readonly = TRUE)
	if (!readonly)
		viewing_subcategory = 1
	if(viewing_category == categories.len)
		. = viewing_category-1
	else
		. = viewing_category % categories.len - 1
	if(. <= 0)
		. = categories.len

/datum/personal_crafting/proc/prev_subcat()
	if(islist(subcategories[viewing_category]))
		var/list/subs = subcategories[viewing_category]
		if(viewing_subcategory == subs.len)
			. = viewing_subcategory-1
		else
			. = viewing_subcategory % subs.len - 1
		if(. <= 0)
			. = subs.len
	else
		. = null


/datum/personal_crafting/proc/build_recipe_data(datum/crafting_recipe/R)
	var/list/data = list()
	data["name"] = R.name
	var/req_text = ""
	var/tool_text = ""
	var/catalyst_text = ""

	for(var/a in R.reqs)
		//We just need the name, so cheat-typecast to /atom for speed (even tho Reagents are /datum they DO have a "name" var)
		//Also these are typepaths so sadly we can't just do "[a]"
		var/atom/A = a
		req_text += " [R.reqs[A]] [initial(A.name)],"
	req_text = replacetext(req_text,",","",-1)
	data["req_text"] = req_text

	for(var/a in R.chem_catalysts)
		var/atom/A = a //cheat-typecast
		catalyst_text += " [R.chem_catalysts[A]] [initial(A.name)],"
	catalyst_text = replacetext(catalyst_text,",","",-1)
	data["catalyst_text"] = catalyst_text

	for(var/a in R.tools)
		if(ispath(a, /obj/item))
			var/obj/item/b = a
			tool_text += " [initial(b.name)],"
		else
			tool_text += " [a],"
	tool_text = replacetext(tool_text,",","",-1)
	data["tool_text"] = tool_text

	return data
