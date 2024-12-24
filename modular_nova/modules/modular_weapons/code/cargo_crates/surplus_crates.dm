#define ITEM_WEIGHT_CLOTHING 3
#define ITEM_WEIGHT_ARMOR 2
#define ITEM_WEIGHT_MISC 3
#define ITEM_WEIGHT_MISC_BUT_RARER 2
#define ITEM_WEIGHT_AMMO_SINGLE 3
#define ITEM_WEIGHT_AMMO_BULK 2
#define ITEM_WEIGHT_GUN_COMMON 2
#define ITEM_WEIGHT_GUN_RARE 1

#define WEIGHT_COMMON 3
#define WEIGHT_UNCOMMON 2
#define WEIGHT_RARE 1

// used in budget calculation
#define CRATE_ITEM_WEIGHT_MAX 3

#define CRATE_BUDGET_MINIMUM 20
#define CRATE_BUDGET_MAXIMUM 35

// Special basically locks it out of appearing literally ever unless an admin VV's the cargo subsystem
/datum/supply_pack/imports/russian
	special = TRUE

/// base type that uses paxil's crate budgeting system. contains stuff from the CIN
/datum/supply_pack/imports/budgeted
	name = "CIN Surplus Equipment Crate"
	desc = "A collection of surplus equipment sourced from the Coalition of Independent Nations' military stockpiles. \
	Likely to contain old and outdated equipment, as is the nature of surplus."
	contraband = TRUE
	cost = CARGO_CRATE_VALUE * 20
	contains = list(
		// Clothing
		/obj/item/clothing/under/syndicate/rus_army/cin_surplus/random_color = ITEM_WEIGHT_CLOTHING,
		/obj/item/storage/belt/military/cin_surplus/random_color = ITEM_WEIGHT_CLOTHING,
		/obj/item/storage/backpack/industrial/cin_surplus/random_color = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/under/colonial/nri_police = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/neck/cloak/colonial/nri_police = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/head/hats/colonial/nri_police = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/mask/gas/nri_police = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/mask/balaclavaadjust = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/gloves/tackler/combat = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/shoes/jackboots = ITEM_WEIGHT_CLOTHING,
		// Armors
		/obj/item/clothing/head/helmet/cin_surplus_helmet/random_color = ITEM_WEIGHT_ARMOR,
		/obj/item/clothing/suit/armor/vest/cin_surplus_vest = ITEM_WEIGHT_ARMOR,
		/obj/item/clothing/head/helmet/nri_police = ITEM_WEIGHT_ARMOR,
		/obj/item/clothing/suit/armor/vest/nri_police = ITEM_WEIGHT_ARMOR,
		// Weapons
		/obj/item/gun/ballistic/revolver/shotgun_revolver = ITEM_WEIGHT_GUN_COMMON,
		/obj/item/gun/ballistic/automatic/pistol/plasma_thrower = ITEM_WEIGHT_GUN_COMMON,
		/obj/item/gun/ballistic/automatic/pistol/plasma_marksman = ITEM_WEIGHT_GUN_COMMON,
		/obj/item/storage/toolbox/guncase/soviet/sakhno = ITEM_WEIGHT_GUN_COMMON,
		/obj/item/gun/ballistic/automatic/miecz = ITEM_WEIGHT_GUN_RARE,
		/obj/item/gun/ballistic/automatic/lanca = ITEM_WEIGHT_GUN_RARE,
		/obj/item/gun/ballistic/automatic/wylom = ITEM_WEIGHT_GUN_RARE,
		// Ammo
		/obj/item/storage/toolbox/ammobox/strilka310 = ITEM_WEIGHT_AMMO_BULK,
		/obj/item/storage/toolbox/ammobox/strilka310/surplus = ITEM_WEIGHT_AMMO_BULK,
		/obj/item/ammo_box/c27_54cesarzowa = ITEM_WEIGHT_AMMO_BULK,
		/obj/item/ammo_box/c27_54cesarzowa/rubber = ITEM_WEIGHT_AMMO_BULK,
		/obj/item/ammo_box/c310_cargo_box = ITEM_WEIGHT_AMMO_BULK,
		/obj/item/ammo_box/c310_cargo_box/rubber = ITEM_WEIGHT_AMMO_BULK,
		/obj/item/ammo_box/c310_cargo_box/piercing = ITEM_WEIGHT_AMMO_BULK,
		/obj/item/ammo_box/magazine/recharge/plasma_battery = ITEM_WEIGHT_AMMO_SINGLE,
		/obj/item/ammo_box/magazine/miecz/spawns_empty = ITEM_WEIGHT_AMMO_SINGLE,
		/obj/item/ammo_box/strilka310 = ITEM_WEIGHT_AMMO_SINGLE,
		/obj/item/ammo_box/magazine/lanca/spawns_empty = ITEM_WEIGHT_AMMO_SINGLE,
		/obj/item/ammo_box/magazine/wylom = ITEM_WEIGHT_AMMO_SINGLE,
		// Other items
		/obj/item/sign/flag/nri = ITEM_WEIGHT_MISC,
		/obj/item/trench_tool = ITEM_WEIGHT_MISC,
		/obj/item/binoculars = ITEM_WEIGHT_MISC,
		/obj/item/storage/box/nri_flares = ITEM_WEIGHT_MISC,
		/obj/item/pen/screwdriver = ITEM_WEIGHT_MISC_BUT_RARER,
		/obj/item/storage/box/colonial_rations = ITEM_WEIGHT_MISC_BUT_RARER,
		/obj/item/storage/toolbox/maint_kit = ITEM_WEIGHT_MISC_BUT_RARER,
	)
	/// lower bound of random crate budget
	var/item_budget_min = CRATE_BUDGET_MINIMUM
	/// upper bound of random crate budget
	var/item_budget_max = CRATE_BUDGET_MAXIMUM
	/// maximum number of contents
	var/max_contents = 20

/datum/supply_pack/imports/budgeted/fill(obj/structure/closet/crate/we_are_filling_this_crate)
	var/item_budget = rand(item_budget_min, item_budget_max)
	for(var/iterator in 1 to max_contents) // 20 items max, but we have a budget too
		var/new_thing = pick_weight(contains)
		// We don't want to go too far over budget
		if(item_budget <= 0)
			return
		new new_thing(we_are_filling_this_crate)
		// Basically inverts the weight before subtracting it from the budget
		item_budget -= ((CRATE_ITEM_WEIGHT_MAX + 1) - contains[new_thing])

/// contains stuff from the vanguard expeditionary corps
/datum/supply_pack/imports/budgeted/vanguard_surplus
	name = "Vanguard Expeditionary Corps Surplus"
	desc = "Contains an assortment of surplus equipment from the now-defunct Vanguard Expeditionary Corps. May or may not just be things they stole from other stations."
	cost = CARGO_CRATE_VALUE * 20
	contraband = FALSE
	// note: weights are entirely arbitrary. also arbitrarily sorted by weight
	contains = list(
		// clothes incl. storage
		/obj/item/clothing/under/rank/expeditionary_corps = ITEM_WEIGHT_CLOTHING,
		/obj/item/storage/belt/military/expeditionary_corps = ITEM_WEIGHT_CLOTHING,
		/obj/item/storage/backpack/duffelbag/expeditionary_corps = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/gloves/color/black/expeditionary_corps = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/shoes/combat/expeditionary_corps = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/gloves/latex/nitrile/expeditionary_corps = ITEM_WEIGHT_CLOTHING,
		// armor
		/obj/item/clothing/head/helmet/expeditionary_corps = ITEM_WEIGHT_CLOTHING,
		/obj/item/clothing/suit/armor/vest/expeditionary_corps = ITEM_WEIGHT_CLOTHING,
		// misc goodies?
		/obj/item/storage/box/expeditionary_survival = ITEM_WEIGHT_MISC,
		/obj/item/melee/tomahawk = ITEM_WEIGHT_MISC_BUT_RARER,
		// the stuff they probably just stole from the station before going
		/obj/item/storage/medkit/regular = ITEM_WEIGHT_MISC_BUT_RARER,
		/obj/item/trench_tool = ITEM_WEIGHT_MISC,
		/obj/item/binoculars = ITEM_WEIGHT_MISC,
		/obj/item/storage/box/nri_flares = ITEM_WEIGHT_MISC,
		/obj/item/storage/pouch/medical/firstaid/loaded = ITEM_WEIGHT_MISC_BUT_RARER,
		/obj/item/storage/pouch/medical/firstaid/advanced = ITEM_WEIGHT_MISC_BUT_RARER,
		// maybe not junk
		/obj/item/knife/combat/throwing = ITEM_WEIGHT_MISC_BUT_RARER,
		/obj/item/storage/medkit/expeditionary/surplus = ITEM_WEIGHT_MISC_BUT_RARER,
		/obj/item/pointman_broken = ITEM_WEIGHT_GUN_RARE, // diy project for a shield that you can wield for 75 blockchance + beat people to death with
		/obj/item/clothing/gloves/chief_engineer/expeditionary_corps = ITEM_WEIGHT_MISC_BUT_RARER, // congratulations you won (it's basically combat gloves but not quite)
		/obj/item/modular_computer/pda/expeditionary_corps = ITEM_WEIGHT_MISC_BUT_RARER, // except for when you didn't (scammed)
	)
	// lowered values because of smaller loot pool
	item_budget_min = CRATE_BUDGET_MINIMUM - 15
	item_budget_max = CRATE_BUDGET_MAXIMUM - 20
	max_contents = 10
	crate_name = "vanguard surplus crate"
	crate_type = /obj/structure/closet/crate/cargo


//Hookie's

/datum/supply_pack/imports/budgeted/redsec
	name = "Armadyne Security Surplus Crate"
	desc = "A crate of outdated equipment previously worn by Lopland securities, thoroughly vetted for security risks \
	and ready for the surplus market. Security forces are sternly reminded that 'redsec' equipment is not compliant \
	with Lopland's strict uniform policy or guaranteed to meet Armadyne's modern standard of efficacy."
	cost = CARGO_CRATE_VALUE * 15
	contraband = TRUE

	contains = list(
		// normal ass clothes
		/obj/item/clothing/suit/hooded/wintercoat/security/redsec = WEIGHT_COMMON,
		/obj/item/clothing/under/rank/security/warden/redsec = WEIGHT_COMMON,
		/obj/item/clothing/under/rank/security/officer/redsec = WEIGHT_COMMON,
		/obj/item/clothing/under/rank/security/nova/utility/redsec = WEIGHT_COMMON,

		/obj/item/clothing/head/helmet/sec/redsec = WEIGHT_UNCOMMON,
		/obj/item/clothing/suit/armor/vest/alt/sec/redsec = WEIGHT_UNCOMMON,
		/obj/item/storage/backpack/security/redsec = WEIGHT_UNCOMMON,
		/obj/item/storage/belt/security/redsec = WEIGHT_UNCOMMON,

		/obj/item/clothing/suit/armor/hos/trenchcoat/armadyne = WEIGHT_RARE,
		/obj/item/clothing/glasses/hud/security/sunglasses/redsec = WEIGHT_RARE,
		/obj/item/clothing/glasses/hud/security/night/redsec = WEIGHT_RARE,
		/obj/item/clothing/under/rank/security/head_of_security/parade/redsec = WEIGHT_RARE,
		/obj/item/clothing/under/rank/security/head_of_security/parade/female/redsec = WEIGHT_RARE,
	)

	item_budget_min = CRATE_BUDGET_MINIMUM - 8
	item_budget_max = CRATE_BUDGET_MAXIMUM - 12
	max_contents = 8
	crate_name = "armadyne surplus crate"
	crate_type = /obj/structure/closet/crate/cargo

// Weaker syndicate items rarely seen in play. Like buying an entire crate of the mostly useless junk from the black market
/datum/supply_pack/imports/budgeted/syndicate_weighted
	name = "Operative Surplus Crate"
	desc = "(*!&@#SOME OF OUR OTHER OPERATIVES HAVE BEEN UNABLE - OR UNWILLING - TO COMPLETE \
	THE TASKS LAID OUT BEFORE THEM. IT WON'T BE CHEAP, BUT WE COULD REDRISTRIBUTE SOME OF THEIR GEAR YOUR WAY, OPERATIVE!!#@*$"
	cost = CARGO_CRATE_VALUE * 100 // Pricy by neccessity. Shouldn't be able to buy too many, and should be a noticeable expenditure
	hidden = TRUE

	contains = list(
		// Filler equipment.
		/obj/item/clothing/mask/neck_gaiter/syndicate = WEIGHT_COMMON,
		/obj/item/clothing/mask/gas/syndicate = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/bloodred = WEIGHT_COMMON,
		/obj/item/storage/fancy/cigarettes/cigpack_syndicate = WEIGHT_COMMON,
		/obj/item/climbing_hook/syndicate = WEIGHT_COMMON,
		/obj/item/reagent_containers/spray/syndicate = WEIGHT_COMMON, // spawns empty
		/obj/item/sticker/syndicate = WEIGHT_COMMON,
		/obj/item/sign/flag/syndicate = WEIGHT_COMMON,
		/obj/item/storage/box/syndie_kit/cutouts = WEIGHT_COMMON,
		/obj/item/toy/figure/syndie = WEIGHT_COMMON,
		/obj/item/toy/balloon/syndicate = WEIGHT_COMMON,
		/obj/item/soap/syndie = WEIGHT_COMMON,
		/obj/item/stamp/chameleon = WEIGHT_COMMON,
		/obj/item/clothing/neck/chameleon = WEIGHT_COMMON,
		/obj/item/clothing/glasses/chameleon = WEIGHT_COMMON, // chameleon gear that's useless but not found in any other crates

		// Syndicate trinkets. Falls under 'cool' but not really 'useful'
		/obj/item/toy/cards/deck/syndicate = WEIGHT_UNCOMMON,
		/obj/item/storage/toolbox/syndicate = WEIGHT_UNCOMMON,
		/obj/item/syndicate_contacts = WEIGHT_UNCOMMON,
		/obj/item/clothing/shoes/magboots/syndie = WEIGHT_UNCOMMON,
		/obj/item/storage/box/syndie_kit/throwing_weapons = WEIGHT_UNCOMMON,
		/obj/item/storage/box/syndieshotglasses = WEIGHT_UNCOMMON,
		/obj/item/lipstick/syndie = WEIGHT_UNCOMMON,
		/obj/item/syndie_glue = WEIGHT_UNCOMMON,
		/obj/item/storage/backpack/chameleon = WEIGHT_UNCOMMON,
		/obj/item/computer_disk/syndicate/camera_app = WEIGHT_UNCOMMON,
		/obj/item/gun/syringe/syndicate/prototype = WEIGHT_UNCOMMON,
		/obj/item/clothing/suit/hooded/explorer/syndicate = WEIGHT_UNCOMMON,

		// Mostly really cool stuff, and a little bit of dangerous stuff
		/obj/item/gun/energy/laser/chameleon = WEIGHT_RARE, // absolutely harmless, but can look like any firearm
		/obj/item/reagent_containers/hypospray/medipen/stimulants = WEIGHT_RARE, // makes you very fast. probably addicts you, too.
		/obj/item/crowbar/power/syndicate = WEIGHT_RARE, // jaws of death
		/obj/item/chameleon = WEIGHT_RARE, // not the animal, disguises you
		/obj/item/jammer = WEIGHT_RARE, // disables nearby radios
		/obj/item/pen/edagger = WEIGHT_RARE, // weaker than a switchblade, stronger than a hunting knife
		/obj/item/language_manual/codespeak_manual = WEIGHT_RARE,
		/obj/item/mod/module/storage/syndicate = WEIGHT_RARE,
		/obj/item/organ/cyberimp/eyes/hud/security/syndicate = WEIGHT_RARE,
	)
	// the loot pool here is pretty large, but we don't want people stocking up too much here
	item_budget_min = CRATE_BUDGET_MINIMUM - 11
	item_budget_max = CRATE_BUDGET_MAXIMUM - 15
	max_contents = 7
	crate_name = "syndicate gear crate" // generally, make it obvious what this is - high risk item
	crate_type = /obj/structure/closet/crate/secure/syndicate // requires syndicate access to open - or more likely, hacking. obvious at a glance who it came from.

// Syndicate Spacesuit Variety Crate! Can be obtained much cheaper, and more easily, with a black market uplink.
/datum/supply_pack/imports/budgeted/syndicate_spacesuits
	name = "Space Suit Variety Crate"
	desc = "(*!&@#WE'VE MADE WAY MORE SPACESUITS THAN WE NEEDED! GOT A COLOR YOU LIKE? IT'S PROBABLY IN HERE!\
	NO GUARANTEES ANY OF THEM WILL MATCH. WE WERE GOING TO SEND THEM TO SPACE GOODWILL, BUT IF YOU'LL BUY A BOX, WE'LL SEND IT TO YOU!!#@*$"
	cost = CARGO_CRATE_VALUE * 8 // just suits, no jetpacks. stats similar to voskhod, which is cheap as dirt
	hidden = TRUE

	contains = list(
		// base colors
		/obj/item/clothing/suit/space/syndicate = WEIGHT_COMMON,
		/obj/item/clothing/head/helmet/space/syndicate = WEIGHT_COMMON,
		/obj/item/clothing/suit/space/syndicate/green = WEIGHT_COMMON,
		/obj/item/clothing/head/helmet/space/syndicate/green = WEIGHT_COMMON,
		/obj/item/clothing/suit/space/syndicate/green/dark = WEIGHT_COMMON,
		/obj/item/clothing/head/helmet/space/syndicate/green/dark = WEIGHT_COMMON,
		/obj/item/clothing/suit/space/syndicate/orange = WEIGHT_COMMON,
		/obj/item/clothing/head/helmet/space/syndicate/orange = WEIGHT_COMMON,
		/obj/item/clothing/suit/space/syndicate/blue = WEIGHT_COMMON,
		/obj/item/clothing/head/helmet/space/syndicate/blue = WEIGHT_COMMON,
		/obj/item/clothing/suit/space/syndicate/black = WEIGHT_COMMON,
		/obj/item/clothing/head/helmet/space/syndicate/black = WEIGHT_COMMON,

		// striped
		/obj/item/clothing/suit/space/syndicate/black/green = WEIGHT_UNCOMMON,
		/obj/item/clothing/head/helmet/space/syndicate/black/green = WEIGHT_UNCOMMON,
		/obj/item/clothing/suit/space/syndicate/black/blue = WEIGHT_UNCOMMON,
		/obj/item/clothing/head/helmet/space/syndicate/black/blue = WEIGHT_UNCOMMON,
		/obj/item/clothing/suit/space/syndicate/black/white = WEIGHT_UNCOMMON, // this one has no helmet. what was the guy making this many variants on?
		/obj/item/clothing/suit/space/syndicate/black/orange = WEIGHT_UNCOMMON,
		/obj/item/clothing/head/helmet/space/syndicate/black/orange = WEIGHT_UNCOMMON,

		// specialized
		/obj/item/clothing/suit/space/syndicate/black/red = WEIGHT_RARE,
		/obj/item/clothing/head/helmet/space/syndicate/black/red = WEIGHT_RARE,
		/obj/item/clothing/suit/space/syndicate/black/engie = WEIGHT_RARE,
		/obj/item/clothing/head/helmet/space/syndicate/black/engie = WEIGHT_RARE,
		/obj/item/clothing/suit/space/syndicate/black/med = WEIGHT_RARE,
		/obj/item/clothing/head/helmet/space/syndicate/black/med = WEIGHT_RARE,
		/obj/item/clothing/suit/syndicatefake = WEIGHT_RARE, // you've been trolled
		/obj/item/clothing/head/syndicatefake = WEIGHT_RARE,

	)
	item_budget_min = CRATE_BUDGET_MINIMUM - 10
	item_budget_max = CRATE_BUDGET_MAXIMUM - 15
	max_contents = 8
	crate_name = "spacesuit variety crate"
	crate_type = /obj/structure/closet/crate/secure/syndicate/gorlex/weapons/bustedlock

// A variety syndicate clothing crate - a gambler's choice. Mostly worthless, but you can get maid outfits here.
/datum/supply_pack/imports/budgeted/syndicate_clothing
	name = "'Laundry' Crate"
	desc = "(*!&@#FEELING BARE, AGENT? MISS THE COMFORT OF UNIFORM? \
		DO YOU MISS IT ENOUGH TO PAY US 2K FOR OUR LAUNDRY?!#@*$"
	cost = CARGO_CRATE_VALUE * 10 // cool 2k for dumb clothes
	hidden = TRUE

	contains = list(

		// it's all turtlenecks..? always has been.
		/obj/item/clothing/under/syndicate = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/coldres = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/skirt = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/skirt/coldres = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/tacticool = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/tacticool/skirt = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/tacticool/skirt/long = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/nova/tactical = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/nova/tactical/skirt = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/nova/overalls = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/nova/overalls/skirt = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/unarmoured = WEIGHT_COMMON,
		/obj/item/clothing/under/syndicate/unarmoured/skirt = WEIGHT_COMMON,
		/obj/item/clothing/under/rank/cargo/tech/nova/utility/syndicate = WEIGHT_COMMON,
		/obj/item/clothing/under/rank/medical/doctor/nova/utility/syndicate = WEIGHT_COMMON,
		/obj/item/clothing/under/rank/rnd/scientist/nova/utility/syndicate = WEIGHT_COMMON,
		/obj/item/clothing/under/rank/engineering/engineer/nova/utility/syndicate = WEIGHT_COMMON,

		// non-turtleneck clothing
		/obj/item/clothing/suit/hooded/wintercoat/nova/syndicate = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/bloodred = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/bloodred/sleepytime = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/bloodred = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/sniper = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/camo = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/soviet = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/combat = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/rus_army = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/scrubs = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/syndicate/nova/baseball = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/plasmaman/syndicate = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/rank/prisoner/syndicate = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/rank/prisoner/skirt/syndicate = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/rank/security/nova/utility/redsec/syndicate = WEIGHT_UNCOMMON,
		/obj/item/clothing/under/misc/nova/utility/syndicate = WEIGHT_UNCOMMON,

		// fancy stuff
		/obj/item/clothing/under/rank/captain/nova/utility/syndicate = WEIGHT_RARE,
		/obj/item/clothing/head/hats/hos/beret/syndicate = WEIGHT_RARE,
		/obj/item/clothing/under/syndicate/nova/maid = WEIGHT_RARE, // i legitimately don't know why people like these so much.
		/obj/item/clothing/accessory/maidcorset/syndicate = WEIGHT_RARE,
		/obj/item/clothing/head/costume/maidheadband/syndicate = WEIGHT_RARE,
		/obj/item/clothing/gloves/combat/maid = WEIGHT_RARE,
		/obj/item/clothing/gloves/combat = WEIGHT_RARE,

	)
	item_budget_min = CRATE_BUDGET_MINIMUM - 10
	item_budget_max = CRATE_BUDGET_MAXIMUM - 20
	max_contents = 10
	crate_name = "outfit crate"
	crate_type = /obj/structure/closet/crate/secure/syndicate/gorlex/weapons/bustedlock

#undef ITEM_WEIGHT_CLOTHING
#undef ITEM_WEIGHT_ARMOR
#undef ITEM_WEIGHT_MISC
#undef ITEM_WEIGHT_MISC_BUT_RARER
#undef ITEM_WEIGHT_AMMO_SINGLE
#undef ITEM_WEIGHT_AMMO_BULK
#undef ITEM_WEIGHT_GUN_COMMON
#undef ITEM_WEIGHT_GUN_RARE

#undef WEIGHT_COMMON
#undef WEIGHT_RARE
#undef WEIGHT_UNCOMMON

#undef CRATE_ITEM_WEIGHT_MAX

#undef CRATE_BUDGET_MINIMUM
#undef CRATE_BUDGET_MAXIMUM
