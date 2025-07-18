/datum/armament_entry/company_import/donk
	category = DONK_CO_NAME
	company_bitflag = CARGO_COMPANY_DONK

// Donk Co foods, like donk pockets and ready donk

/datum/armament_entry/company_import/donk/food
	subcategory = "Microwave Foods"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/donk/food/ready_donk
	item_type = /obj/item/food/ready_donk

/datum/armament_entry/company_import/donk/food/ready_donkhiladas
	item_type = /obj/item/food/ready_donk/donkhiladas

/datum/armament_entry/company_import/donk/food/ready_donk_n_cheese
	item_type = /obj/item/food/ready_donk/mac_n_cheese

/datum/armament_entry/company_import/donk/food/pockets
	item_type = /obj/item/storage/box/donkpockets

/datum/armament_entry/company_import/donk/food/berry_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpocketberry

/datum/armament_entry/company_import/donk/food/honk_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpockethonk

/datum/armament_entry/company_import/donk/food/pizza_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpocketpizza

/datum/armament_entry/company_import/donk/food/spicy_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpocketspicy

/datum/armament_entry/company_import/donk/food/teriyaki_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpocketteriyaki

/datum/armament_entry/company_import/donk/pet_food
	subcategory = "Pet Food"
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/donk/pet_food/void
	item_type = /obj/item/pet_food/pet_space_treat

// Random donk toy items, fake jumpsuits, balloons, so on

// Donk merch gives you more interest than other items, buy donk bling and get company interest faster!

/datum/armament_entry/company_import/donk/merch
	subcategory = "Donk Co. Merchandise"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/donk/merch/vendors
	item_type = /obj/item/summon_beacon/vendors
	cost = PAYCHECK_CREW * 12

/datum/armament_entry/company_import/donk/merch/donk_carpet
	item_type = /obj/item/stack/tile/carpet/donk/thirty

/datum/armament_entry/company_import/donk/merch/tacticool_turtleneck
	item_type = /obj/item/clothing/under/syndicate/tacticool

/datum/armament_entry/company_import/donk/merch/tacticool_turtleneck_skirt
	item_type = /obj/item/clothing/under/syndicate/tacticool/skirt

/datum/armament_entry/company_import/donk/merch/fake_centcom_turtleneck
	item_type = /obj/item/clothing/under/rank/centcom/officer/replica

/datum/armament_entry/company_import/donk/merch/fake_centcom_turtleneck_skirt
	item_type = /obj/item/clothing/under/rank/centcom/officer_skirt/replica

/datum/armament_entry/company_import/donk/merch/snack_rig
	item_type = /obj/item/storage/belt/military/snack
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/merch/fake_syndie_suit
	item_type = /obj/item/storage/box/fakesyndiesuit

/datum/armament_entry/company_import/donk/merch/valid_bloon
	item_type = /obj/item/toy/balloon/arrest

/datum/armament_entry/company_import/donk/merch/neuroware
	subcategory = "Donk Co. Neuroware Chips"
	cost = PAYCHECK_CREW * 0.8 // Equal to the cost of a cheeseburger.

/datum/armament_entry/company_import/donk/merch/neuroware/blastoff
	item_type = /obj/item/disk/neuroware/blastoff

/datum/armament_entry/company_import/donk/merch/neuroware/mindbreaker
	item_type = /obj/item/disk/neuroware/mindbreaker

/datum/armament_entry/company_import/donk/merch/neuroware/mushroomhallucinogen
	item_type = /obj/item/disk/neuroware/mushroomhallucinogen

/datum/armament_entry/company_import/donk/merch/neuroware/space_drugs
	item_type = /obj/item/disk/neuroware/space_drugs

/datum/armament_entry/company_import/donk/merch/neuroware/thc
	item_type = /obj/item/disk/neuroware/thc

// Donksoft weapons

/datum/armament_entry/company_import/donk/foamforce
	subcategory = "Foam Force (TM) Blasters"

/datum/armament_entry/company_import/donk/foamforce/foam_pistol
	item_type = /obj/item/gun/ballistic/automatic/pistol/toy
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/foamforce/foam_shotgun
	item_type = /obj/item/gun/ballistic/shotgun/toy/riot
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/foamforce/foam_smg
	item_type = /obj/item/gun/ballistic/automatic/toy
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/donk/foamforce/foam_c20
	item_type = /obj/item/gun/ballistic/automatic/c20r/toy/unrestricted
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/donk/foamforce/foam_turret
	item_type = /obj/item/storage/toolbox/emergency/turret/mag_fed/toy/pre_filled
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/donk/foamforce/foam_lmg
	item_type = /obj/item/gun/ballistic/automatic/l6_saw/toy/unrestricted
	cost = PAYCHECK_COMMAND * 5


/datum/armament_entry/company_import/donk/foamforce_ammo
	subcategory = "Foam Force (TM) Dart Accessories"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/donk/foamforce_ammo/darts
	item_type = /obj/item/ammo_box/foambox
	cost = PAYCHECK_CREW * 0.5

/datum/armament_entry/company_import/donk/foamforce_ammo/riot_darts
	item_type = /obj/item/ammo_box/foambox/riot
	cost = PAYCHECK_COMMAND * 1.5

/datum/armament_entry/company_import/donk/foamforce_ammo/pistol_mag
	item_type = /obj/item/ammo_box/magazine/toy/pistol

/datum/armament_entry/company_import/donk/foamforce_ammo/smg_mag
	item_type = /obj/item/ammo_box/magazine/toy/smg

/datum/armament_entry/company_import/donk/foamforce_ammo/smgm45_mag
	item_type = /obj/item/ammo_box/magazine/toy/smgm45

/datum/armament_entry/company_import/donk/foamforce_ammo/m762_mag
	item_type = /obj/item/ammo_box/magazine/toy/m762
