/* Utility Closets
 * Contains:
 *		Emergency Closet
 *		Fire Closet
 *		Tool Closet
 *		Radiation Closet
 *		Bombsuit Closet
 *		Hydrant
 *		First Aid
 */

/*
 * Emergency Closet
 */
/obj/structure/closet/emcloset
	name = "emergency closet"
	desc = "It's a storage unit for emergency breathmasks and o2 tanks."
	icon_state = "emergency"
	icon_closed = "emergency"
	icon_opened = "emergencyopen"

/obj/structure/closet/emcloset/PopulateContents()
	new /obj/item/clothing/head/helmet/space/sk(src)
	new /obj/item/clothing/suit/space/sk(src)

	switch (pickweight(list("small" = 55, "aid" = 25, "tank" = 10, "both" = 10, "nothing" = 4)))
		if ("small")
			for (var/i in 1 to 2)
				new /obj/item/weapon/tank/emergency_oxygen(src)
				new /obj/item/clothing/mask/breath(src)
		if ("aid")
			new /obj/item/weapon/tank/emergency_oxygen(src)
			new /obj/item/weapon/storage/toolbox/emergency(src)
			new /obj/item/clothing/mask/breath(src)
			new /obj/item/weapon/storage/firstaid/o2(src)
		if ("tank")
			for (var/i in 1 to 2)
				new /obj/item/weapon/tank/emergency_oxygen/engi(src)
				new /obj/item/clothing/mask/breath(src)
		if ("both")
			new /obj/item/weapon/storage/toolbox/emergency(src)
			new /obj/item/weapon/tank/emergency_oxygen/engi(src)
			new /obj/item/clothing/mask/breath(src)
			new /obj/item/weapon/storage/firstaid/o2(src)
		if ("nothing")
			return

		//If you want to re-add fire, just add "fire" = 15 to the pick list.
		/*if ("fire")
			new /obj/structure/closet/firecloset(src.loc)
			qdel(src)*/

/obj/structure/closet/emcloset/legacy/PopulateContents()
	..()
	new /obj/item/weapon/tank/oxygen(src)
	new /obj/item/clothing/mask/gas/coloured(src)

/*
 * Fire Closet
 */
/obj/structure/closet/firecloset
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	icon_state = "firecloset"
	icon_closed = "firecloset"
	icon_opened = "fireclosetopen"

/obj/structure/closet/firecloset/PopulateContents()
	new /obj/item/clothing/suit/fire/firefighter(src)
	new /obj/item/clothing/mask/gas/coloured(src)
	new /obj/item/weapon/tank/oxygen/red(src)
	new /obj/item/weapon/reagent_containers/spray/extinguisher(src)
	new /obj/item/clothing/head/hardhat/red(src)

/obj/structure/closet/firecloset/full/PopulateContents()
	new /obj/item/clothing/suit/fire/firefighter(src)
	new /obj/item/clothing/mask/gas/coloured(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/weapon/tank/oxygen/red(src)
	new /obj/item/weapon/reagent_containers/spray/extinguisher(src)
	new /obj/item/clothing/head/hardhat/red(src)

/obj/structure/closet/firecloset/update_icon()
	if(!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened


/*
 * Tool Closet
 */
/obj/structure/closet/toolcloset
	name = "tool closet"
	desc = "It's a storage unit for tools."
	icon_state = "toolcloset"
	icon_closed = "toolcloset"
	icon_opened = "toolclosetopen"

/obj/structure/closet/toolcloset/PopulateContents()
	if(prob(40))
		new /obj/item/clothing/suit/storage/hazardvest(src)
	if(prob(70))
		new /obj/item/device/flashlight(src)
	if(prob(70))
		new /obj/item/weapon/screwdriver(src)
	if(prob(70))
		new /obj/item/weapon/wrench(src)
	if(prob(70))
		new /obj/item/weapon/weldingtool(src)
	if(prob(70))
		new /obj/item/weapon/crowbar(src)
	if(prob(70))
		new /obj/item/weapon/wirecutters(src)
	if(prob(70))
		new /obj/item/device/t_scanner(src)
	if(prob(20))
		new /obj/item/weapon/storage/belt/utility(src)
	for (var/i in 1 to 3)
		if(prob(30))
			new /obj/item/stack/cable_coil/random(src)
	if(prob(20))
		new /obj/item/device/multitool(src)
	if(prob(5))
		new /obj/item/clothing/gloves/insulated(src)
	if(prob(5))
		new /obj/item/weapon/storage/pouch/engineering_tools(src)
	if(prob(1))
		new /obj/item/weapon/storage/pouch/engineering_supply(src)
	if(prob(40))
		if(prob(75))
			new /obj/item/clothing/head/hardhat/yellow(src)
		else
			new /obj/item/clothing/head/hardhat/yellow/visor(src)


/*
 * Radiation Closet
 */
/obj/structure/closet/radiation
	name = "radiation suit closet"
	desc = "It's a storage unit for rad-protective suits."
	icon_state = "radsuitcloset"
	icon_opened = "toolclosetopen"
	icon_closed = "radsuitcloset"

/obj/structure/closet/radiation/PopulateContents()
	for (var/i in 1 to 2)
		new /obj/item/clothing/suit/radiation(src)
		new /obj/item/clothing/head/radiation(src)

/*
 * Bombsuit closet
 */
/obj/structure/closet/bombcloset
	name = "EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	icon_state = "bombsuit"
	icon_closed = "bombsuit"
	icon_opened = "bombsuitopen"

/obj/structure/closet/bombcloset/PopulateContents()
	new /obj/item/clothing/suit/bomb_suit(src)
	new /obj/item/clothing/under/color/black(src)
	new /obj/item/clothing/shoes/black(src)
	new /obj/item/clothing/head/bomb_hood(src)


/obj/structure/closet/bombclosetsecurity
	name = "EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	icon_state = "bombsuitsec"
	icon_closed = "bombsuitsec"
	icon_opened = "bombsuitsecopen"

/obj/structure/closet/bombclosetsecurity/PopulateContents()
	new /obj/item/clothing/suit/bomb_suit/security(src)
	new /obj/item/clothing/under/rank/security(src)
	new /obj/item/clothing/shoes/brown(src)
	new /obj/item/clothing/head/bomb_hood/security(src)

/*
 * Hydrant
 */
/obj/structure/closet/hydrant //wall mounted fire closet
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	icon_state = "hydrant"
	icon_closed = "hydrant"
	icon_opened = "hydrant_open"
	anchored = TRUE
	density = FALSE
	wall_mounted = TRUE

/obj/structure/closet/hydrant/PopulateContents()
	new /obj/item/clothing/suit/fire/firefighter(src)
	new /obj/item/clothing/mask/gas/coloured(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/weapon/reagent_containers/spray/extinguisher(src)
	new /obj/item/weapon/tank/oxygen/red(src)
	new /obj/item/clothing/head/hardhat/red(src)


/*
 * Emergency closet
 */
/obj/structure/closet/emergency_wall
	name = "emergency closet"
	desc = "A wall mounted closet with emergency supplies."
	icon_state = "emergency_wall"
	icon_closed = "emergency_wall"
	icon_opened = "emergency_wall_open"
	anchored = TRUE
	density = FALSE
	wall_mounted = TRUE

/obj/structure/closet/emergency_wall/PopulateContents()
	new /obj/item/weapon/tank/emergency_oxygen(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/weapon/crowbar/red(src)
	new /obj/item/weapon/tank/emergency_oxygen(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/weapon/crowbar/red(src)

/*
 * First Aid
 */
/obj/structure/closet/medical_wall //wall mounted medical closet
	name = "first-aid closet"
	desc = "It's wall-mounted storage unit for first aid supplies."
	icon_state = "medicalwall"
	icon_closed = "medicalwall"
	icon_opened = "medicalwall_open"
	anchored = TRUE
	density = FALSE
	wall_mounted = TRUE

/obj/structure/closet/medical_wall/update_icon()
	if(!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened
