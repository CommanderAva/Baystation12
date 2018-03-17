#if !defined(using_map_DATUM)

	#include "tetras_announcements.dm"
	#include "tetras_areas.dm"
	#include "tetras_elevator.dm"
	#include "tetras_holodecks.dm"
	#include "tetras_overmap.dm"
	#include "tetras_presets.dm"
	#include "tetras_ranks.dm"
	#include "tetras_shuttles.dm"
	#include "tetras_unit_testing.dm"
	#include "tetras_gamemodes.dm"
	#include "tetras_antagonism.dm"

	#include "datums/uniforms.dm"
	#include "datums/uniforms_expedition.dm"
	#include "datums/uniforms_fleet.dm"
	#include "datums/uniforms_marine.dm"
	#include "datums/supplypacks/security.dm"

	#include "items/cards_ids.dm"
	#include "items/clothing.dm"
	#include "items/encryption_keys.dm"
	#include "items/headsets.dm"
	#include "items/items.dm"
	#include "items/machinery.dm"
	#include "items/manuals.dm"
	#include "items/stamps.dm"
	#include "items/uniform_vendor.dm"

	#include "job/access.dm"
	#include "job/jobs.dm"
	#include "job/outfits.dm"

	#include "structures/closets.dm"
	#include "structures/signs.dm"
	#include "structures/closets/command.dm"
	#include "structures/closets/engineering.dm"
	#include "structures/closets/medical.dm"
	#include "structures/closets/misc.dm"
	#include "structures/closets/research.dm"
	#include "structures/closets/security.dm"
	#include "structures/closets/services.dm"
	#include "structures/closets/supply.dm"
	#include "structures/closets/exploration.dm"

	#include "loadout/_defines.dm"
	#include "loadout/loadout_accessories.dm"
	#include "loadout/loadout_eyes.dm"
	#include "loadout/loadout_gloves.dm"
	#include "loadout/loadout_head.dm"
	#include "loadout/loadout_shoes.dm"
	#include "loadout/loadout_suit.dm"
	#include "loadout/loadout_uniform.dm"
	#include "loadout/loadout_xeno.dm"
	#include "loadout/~defines.dm"


	#include "tetras1.dmm"

	#include "../../code/modules/lobby_music/chasing_time.dm"
	#include "../../code/modules/lobby_music/absconditus.dm"
	#include "../../code/modules/lobby_music/clouds_of_fire.dm"
	#include "../../code/modules/lobby_music/endless_space.dm"
	#include "../../code/modules/lobby_music/dilbert.dm"
	#include "../../code/modules/lobby_music/space_oddity.dm"
	#include "../../code/modules/lobby_music/Torch.dm"
	#include "../../code/modules/lobby_music/title1.dm"

	#define using_map_DATUM /datum/map/tetras

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tetras

#endif
