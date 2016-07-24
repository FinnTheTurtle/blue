// Eyes
/datum/gear/eyes
	display_name = "eyepatch"
	path = /obj/item/clothing/glasses/eyepatch
	slot = slot_glasses
	sort_category = "Glasses and Eyewear"

/datum/gear/eyes/glasses
	display_name = "Glasses, prescription"
	path = /obj/item/clothing/glasses/regular

/datum/gear/eyes/glasses/green
	display_name = "Glasses, green"
	path = /obj/item/clothing/glasses/gglasses

/datum/gear/eyes/glasses/prescriptionhipster
	display_name = "Glasses, hipster"
	path = /obj/item/clothing/glasses/regular/hipster

/datum/gear/eyes/glasses/monocle
	display_name = "Monocle"
	path = /obj/item/clothing/glasses/monocle

/datum/gear/eyes/scanning_goggles
	display_name = "scanning goggles"
	path = /obj/item/clothing/glasses/regular/scanners

/datum/gear/eyes/sciencegoggles
	display_name = "Science Goggles"
	path = /obj/item/clothing/glasses/science
/datum/gear/eyes/medical
	display_name = "Medical HUD (Medical)"
	path = /obj/item/clothing/glasses/hud/health
	allowed_roles = list("Medical Doctor","Chief Medical Officer","Chemist","Paramedic","Geneticist")

/datum/gear/eyes/medical/prescriptionmed
	display_name = "Medical HUD, prescription (Medical)"
	path = /obj/item/clothing/glasses/hud/health/prescription

/datum/gear/eyes/shades
	display_name = "Sunglasses, fat (Security/Command)"
	path = /obj/item/clothing/glasses/sunglasses/big
	allowed_roles = list("Colonial Officer", "Colonial Senior Officer","Security Commissioner","Brig Overseer","Captain","Head of Personnel","Quartermaster","Internal Affairs Agent","Investigator")

/datum/gear/eyes/glasses/fakesun
	display_name = "Sunglasses, stylish"
	path = /obj/item/clothing/glasses/fakesunglasses

/datum/gear/eyes/shades/prescriptionsun
	display_name = "sunglasses, presciption (Security/Command)"
	path = /obj/item/clothing/glasses/sunglasses/prescription
	cost = 2
	allowed_roles = list("Colonial Officer", "Colonial Senior Officer","Security Commissioner","Brig Overseer","Captain","Head of Personnel","Quartermaster","Internal Affairs Agent","Investigator")
