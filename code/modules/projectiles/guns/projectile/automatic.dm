/obj/item/weapon/gun/projectile/automatic //Hopefully someone will find a way to make these fire in bursts or something. --Superxpdude //Except burstfire isn't fit for an rp server --Mark
	name = "prototype SMG"
	desc = "A protoype lightweight, fast firing gun. Uses 9mm rounds."
	icon_state = "saber"	//ugly
	w_class = 3
	load_method = SPEEDLOADER //yup. until someone sprites a magazine for it.
	max_shells = 22
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/c9mm
	multi_aim = 1
	burst_delay = 2

//	requires_two_hands = 1
	one_handed_penalty = 1

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0))
//		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1,-2,-2), dispersion=list(0.6, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/c20r
	name = "submachine gun"
	desc = "The C-20r is a lightweight and rapid firing SMG, for when you REALLY need someone dead. Uses 10mm rounds. Has a 'Scarborough Arms - Per falcis, per pravitas' buttstamp."
	icon_state = "c20r"
	item_state = "c20r"
	w_class = 3
	force = 10
	caliber = "10mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	slot_flags = SLOT_BELT|SLOT_BACK
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a10mm
	allowed_magazines = list(/obj/item/ammo_magazine/a10mm)
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

//	requires_two_hands = 1
	one_handed_penalty = 2

/obj/item/weapon/gun/projectile/automatic/c20r/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "c20r-[round(ammo_magazine.stored_ammo.len,4)]"
	else
		icon_state = "c20r"
	return

/obj/item/weapon/gun/projectile/automatic/sts35
	name = "assault rifle"
	desc = "The rugged STS-35 is a durable automatic weapon of a make popular on the frontier worlds. Uses 7.62mm rounds. This one is unmarked."
	icon_state = "arifle"
	item_state = null
	w_class = 4
	force = 10
	caliber = "a762"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c762
	allowed_magazines = list(/obj/item/ammo_magazine/c762, /obj/item/ammo_magazine/s762)

	one_handed_penalty = 4

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=6,    burst_accuracy=list(0,-1,-2), dispersion=list(0.0, 0.6, 0.6))
//		list(mode_name="short bursts", 	burst=5, fire_delay=null, move_delay=6,    burst_accuracy=list(0,-1,-2,-2,-3), dispersion=list(0.6, 1.0, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/sts35/update_icon(var/ignore_inhands)
	..()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/s762))
		icon_state = "arifle-small"
	else
		icon_state = (ammo_magazine)? "arifle" : "arifle-empty"
	if(!ignore_inhands) update_held_icon()

/obj/item/weapon/gun/projectile/automatic/wt550
	name = "machine pistol"
	desc = "The WT550 Saber is a cheap self-defense weapon mass-produced by Ward-Takahashi for paramilitary and private use. Uses 9mm rounds."
	icon_state = "wt550"
	item_state = "wt550"
	w_class = 3
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = "/obj/item/ammo_casing/c9mmr"
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc9mmt/rubber
	allowed_magazines = list(/obj/item/ammo_magazine/mc9mmt)

/obj/item/weapon/gun/projectile/automatic/wt550/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "wt550-[round(ammo_magazine.stored_ammo.len,4)]"
	else
		icon_state = "wt550"
	return

/obj/item/weapon/gun/projectile/automatic/z8
	name = "designated marksman rifle"
	desc = "The Z8 Bulldog is an older model designated marksman rifle, made by the now defunct Zendai Foundries. Makes you feel like a space marine when you hold it, even though it can only hold 10 round magazines. Uses 5.56mm rounds and has an under barrel grenade launcher."
	icon_state = "carbine" // This isn't a carbine. :T
	item_state = "z8carbine"
	w_class = 4
	force = 10
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 3)
	ammo_type = "/obj/item/ammo_casing/a556" // Is this really needed anymore?
	fire_sound = 'sound/weapons/Gunshot.ogg'
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a556
	allowed_magazines = list(/obj/item/ammo_magazine/a556)
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

	one_handed_penalty = 4

	burst_delay = 4
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2,    fire_delay=null, move_delay=6,    use_launcher=null, burst_accuracy=list(0,-1), dispersion=list(0.0, 0.6)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/weapon/gun/launcher/grenade/underslung/launcher

/obj/item/weapon/gun/projectile/automatic/z8/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/z8/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z8/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z8/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes(user) //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z8/update_icon(var/ignore_inhands)
	..()
	if(ammo_magazine)
		icon_state = "carbine-[round(ammo_magazine.stored_ammo.len,2)]"
	else
		icon_state = "carbine"
	if(!ignore_inhands) update_held_icon()
	return

/obj/item/weapon/gun/projectile/automatic/z8/examine(mob/user)
	..()
	if(launcher.chambered)
		user << "\The [launcher] has \a [launcher.chambered] loaded."
	else
		user << "\The [launcher] is empty."

/obj/item/weapon/gun/projectile/automatic/l6_saw
	name = "light machine gun"
	desc = "A rather traditionally made L6 SAW with a pleasantly lacquered wooden pistol grip. Has 'Aussec Armoury- 2531' engraved on the reciever"
	icon_state = "l6closed100"
	item_state = "l6closed"
	w_class = 4
	force = 10
	slot_flags = 0
	max_shells = 50
	caliber = "a762"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	slot_flags = SLOT_BACK
	ammo_type = "/obj/item/ammo_casing/a762" // Is this really needed anymore?
	fire_sound = 'sound/weapons/machinegun.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a762
	allowed_magazines = list(/obj/item/ammo_magazine/a762, /obj/item/ammo_magazine/c762)

	one_handed_penalty = 6

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
		)

	var/cover_open = 0

/obj/item/weapon/gun/projectile/automatic/l6_saw/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/l6_saw/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/l6_saw/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/l6_saw/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/l6_saw/update_icon()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/c762))
		icon_state = "l6[cover_open ? "open" : "closed"]mag"
		item_state = icon_state
	else
		icon_state = "l6[cover_open ? "open" : "closed"][ammo_magazine ? round(ammo_magazine.stored_ammo.len, 25) : "-empty"]"
		item_state = "l6[cover_open ? "open" : "closed"][ammo_magazine ? "" : "-empty"]"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/l6_saw/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/l6_saw/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/as24
	name = "automatic shotgun"
	desc = "The AS-24 is a durable, rugged looking automatic weapon of a make popular on the frontier worlds. Uses 12 gauge shells. It is unmarked."
	icon_state = "ashot"
	item_state = null
	w_class = 4
	force = 10
	caliber = "shotgun"
	fire_sound = 'sound/weapons/shotgun.ogg'
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/g12
	allowed_magazines = list(/obj/item/ammo_magazine/g12)

	one_handed_penalty = 4

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.0, 0.6, 0.6))
//		list(mode_name="6-round bursts", burst=6, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/as24/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ashot-[round(ammo_magazine.stored_ammo.len,12)]"
	else
		icon_state = "ashot"
	return

/obj/item/weapon/gun/projectile/automatic/mini_uzi
	name = "\improper Uzi"
	desc = "A lightweight, compact, fast firing gun, for when you want someone really dead. Uses .45 rounds."
	icon_state = "mini-uzi"
	w_class = 3
	load_method = MAGAZINE
	caliber = ".45"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 5)
	magazine_type = /obj/item/ammo_magazine/c45uzi
	allowed_magazines = list(/obj/item/ammo_magazine/c45uzi)

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, burst_delay=1, fire_delay=4, move_delay=4, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/mini_uzi/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "mini-uzi"
	else
		icon_state = "mini-uzi-empty"

/obj/item/weapon/gun/projectile/automatic/p90
	name = "personal defense weapon"
	desc = "The H90K is a compact, high capacity submachine gun produced by Hephaistos Industries. Despite its fierce reputation, it still manages to feel like a toy. Uses 9mm rounds."
	icon_state = "p90smg"
	item_state = "p90"
	w_class = 3
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT // ToDo: Belt sprite.
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/p90
	allowed_magazines = list(/obj/item/ammo_magazine/p90, /obj/item/ammo_magazine/mc9mmt) // ToDo: New sprite for the different mag.

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/p90/update_icon()
	icon_state = "p90smg-[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 6) : "empty"]"

/obj/item/weapon/gun/projectile/automatic/tommygun
	name = "\improper Tommygun"
	desc = "This weapon was made famous by gangsters in the 20th century. Cybersun Industries is currently reproducing these for a target market of historic gun collectors and classy criminals. Uses .45 rounds."
	icon_state = "tommygun"
	w_class = 3
	caliber = ".45"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 5)
	slot_flags = SLOT_BELT // ToDo: Belt sprite.
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/tommymag
	allowed_magazines = list(/obj/item/ammo_magazine/tommymag, /obj/item/ammo_magazine/tommydrum)

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/tommygun/update_icon()
	..()
	icon_state = (ammo_magazine)? "tommygun" : "tommygun-empty"
//	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/carbine
	name = "assault carbine"
	desc = "The bullpup configured GP3000 is a lightweight, compact, military-grade assault rifle produced by Gurov Projectile Weapons LLC. It is sold almost exclusively to standing armies. The serial number on this one has been scratched off. Uses 5.56mm rounds."
	icon_state = "bullpupm"
	item_state = "bullpup"
	w_class = 4
	force = 10
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a556m
	allowed_magazines = list(/obj/item/ammo_magazine/a556, /obj/item/ammo_magazine/a556m)

	one_handed_penalty = 4

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=6,    burst_accuracy=list(0,-1,-2), dispersion=list(0.0, 0.6, 0.6))
		)

/obj/item/weapon/gun/projectile/automatic/carbine/update_icon(var/ignore_inhands)
	..()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/a556m))
		icon_state = "bullpupm"
	else
		icon_state = (ammo_magazine)? "bullpup" : "bullpup-empty"
	item_state = (ammo_magazine)? "bullpup" : "bullpup-empty"
	if(!ignore_inhands) update_held_icon()


/obj/item/weapon/gun/projectile/automatic/impulsepdw
	name = "impulse PDW"
	desc = "The Ares SM-3 is a compact impulse submachine gun. Despite its fierce reputation, it still manages to feel like a toy. Uses 5.7x28mm rounds."
	icon_state = "impulsepdw"
	item_state = "pdw"
	w_class = 3
	caliber = "5.7x28"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	fire_sound = 'sound/weapons/fireimpulsesmg.wav'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a57x28pdw
	allowed_magazines = list(/obj/item/ammo_magazine/a57x28pdw)
	fire_delay = 0

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/impulsepdw/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "impulsepdw"
	else
		icon_state = "impulsepdw-empty"

/obj/item/weapon/gun/projectile/automatic/impulsecarbine
	name = "impulse carbine"
	desc = "The Diemaco Sentinel is an reliable assault carbine. Perfect for CQB. Uses 7.5x54mm rounds."
	icon_state = "impulsecarbine"
	item_state = "carbine"
	w_class = 4
	caliber = "7.5x54"
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 5)
	slot_flags = SLOT_BACK
	fire_sound = 'sound/weapons/fireimpulserifle.wav'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a75x54
	allowed_magazines = list(/obj/item/ammo_magazine/a75x54)
	fire_delay = 3
	accuracy = 2

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="2-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/impulsecarbine/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "impulsecarbine"
	else
		icon_state = "impulsecarbine-empty"

/obj/item/weapon/gun/projectile/automatic/alsu68
	name = "AL-68SU"
	desc = "no desc."
	icon_state = "al-su68"
	item_state = "carbine"
	w_class = 4
	caliber = "a762"
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 5)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/ar762
	allowed_magazines = list(/obj/item/ammo_magazine/ar762)
	fire_delay = 0
	accuracy = 1

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts", burst=5, fire_delay=null, move_delay=2,    burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.0, 0.6, 0.6, 0.6, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/alsu68/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "al-su68"
	else
		icon_state = "al-su68-empty"

/obj/item/weapon/gun/projectile/automatic/al68marksman
	name = "scoped AL-68"
	desc = "no desc."
	icon_state = "al68marksman"
	item_state = "carbine"
	w_class = 5
	caliber = "a762"
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 5)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/r762
	allowed_magazines = list(/obj/item/ammo_magazine/r762)
	fire_delay = 4
	accuracy = 2
	scoped_accuracy = 4

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0)
		)

/obj/item/weapon/gun/projectile/automatic/al68marksman/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "al68marksman"
	else
		icon_state = "al68marksman-empty"

/obj/item/weapon/gun/projectile/automatic/al68marksman/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(1.3)

/obj/item/weapon/gun/projectile/automatic/m8
	name = "M8 carbine"
	desc = "no desc."
	icon_state = "m8"
	item_state = "carbine"
	w_class = 4
	caliber = "a556"
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/ar556
	allowed_magazines = list(/obj/item/ammo_magazine/ar556)
	fire_delay = 0
	accuracy = 1

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts", burst=5, fire_delay=null, move_delay=2,    burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.0, 0.6, 0.6, 0.6, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/m8/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m8"
	else
		icon_state = "m8-empty"


/obj/item/weapon/gun/projectile/automatic/m27marksman
	name = "scoped M27"
	desc = "no desc."
	icon_state = "m27marksman"
	item_state = "carbine"
	w_class = 5
	caliber = "a556"
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/r556
	allowed_magazines = list(/obj/item/ammo_magazine/r556)
	fire_delay = 4
	accuracy = 2
	scoped_accuracy = 4

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=0)
		)

/obj/item/weapon/gun/projectile/automatic/m27marksman/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m27marksman"
	else
		icon_state = "m27marksman-empty"

/obj/item/weapon/gun/projectile/automatic/m27marksman/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(1.3)

/obj/item/weapon/gun/projectile/automatic/m219
	name = "light machine gun"
	desc = "no desc."
	icon_state = "m219"
	item_state = "l6closed"
	w_class = 4
	force = 15
	slot_flags = 0
	max_shells = 100
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	slot_flags = SLOT_BACK
	ammo_type = "/obj/item/ammo_casing/a556/ap" // Is this really needed anymore?
	fire_sound = 'sound/weapons/machinegun.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/saw556
	allowed_magazines = list(/obj/item/ammo_magazine/saw556)

	one_handed_penalty = 6

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
		)

	var/cover_open = 0

/obj/item/weapon/gun/projectile/automatic/m219/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/m219/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/m219/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/m219/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/m219/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/m219/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/m219/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m219"
	else
		icon_state = "m219-empty"

/obj/item/weapon/gun/projectile/automatic/rpl
	name = "RPL"
	desc = "no desc."
	icon_state = "rpl"
	item_state = "l6closed"
	w_class = 4
	force = 15
	slot_flags = 0
	max_shells = 100
	caliber = "a762"
	slot_flags = SLOT_BACK
	ammo_type = "/obj/item/ammo_casing/a762/ap"
	fire_sound = 'sound/weapons/machinegun.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/saw762
	allowed_magazines = list(/obj/item/ammo_magazine/saw762)

	one_handed_penalty = 6

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
		)

	var/cover_open = 0

/obj/item/weapon/gun/projectile/automatic/rpl/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/rpl/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rpl/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/rpl/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/rpl/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/rpl/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/rpl/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "rpl"
	else
		icon_state = "rpl-empty"

/obj/item/weapon/gun/projectile/automatic/m27grenadier
	name = "M27-GL"
	desc = "no desc."
	icon_state = "m27grenadier"
	item_state = "z8carbine"
	w_class = 4
	force = 15
	caliber = "a556"
	ammo_type = "/obj/item/ammo_casing/a556"
	fire_sound = 'sound/weapons/Gunshot.ogg'
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/ar556
	allowed_magazines = list(/obj/item/ammo_magazine/ar556)
	accuracy = 1

	one_handed_penalty = 5

	burst_delay = 4
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=null, move_delay=3,    use_launcher=null, burst_accuracy=list(1,1,0), dispersion=list(0.0, 0.3, 0.6)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/weapon/gun/launcher/grenade/underslung/launcher

/obj/item/weapon/gun/projectile/automatic/m27grenadier/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/m27grenadier/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m27grenadier/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m27grenadier/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes(user) //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m27grenadier/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m27grenadier"
	else
		icon_state = "m27grenadier-empty"

/obj/item/weapon/gun/projectile/automatic/m27grenadier/examine(mob/user)
	..()
	if(launcher.chambered)
		user << "\The [launcher] has \a [launcher.chambered] loaded."
	else
		user << "\The [launcher] is empty."

/obj/item/weapon/gun/projectile/automatic/al68grenadier
	name = "AL68-GP"
	desc = "no desc."
	icon_state = "al68-grenadier"
	item_state = "z8carbine"
	w_class = 4
	force = 15
	caliber = "a762"
	ammo_type = "/obj/item/ammo_casing/a762"
	fire_sound = 'sound/weapons/Gunshot.ogg'
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/ar762
	allowed_magazines = list(/obj/item/ammo_magazine/ar762)
	accuracy = 1

	one_handed_penalty = 5

	burst_delay = 4
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=null, move_delay=3,    use_launcher=null, burst_accuracy=list(1,1,0), dispersion=list(0.0, 0.3, 0.6)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/weapon/gun/launcher/grenade/underslung/launcher

/obj/item/weapon/gun/projectile/automatic/al68grenadier/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/al68grenadier/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/al68grenadier/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/al68grenadier/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes(user) //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/al68grenadier/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "al68-grenadier"
	else
		icon_state = "al68-grenadier-empty"

/obj/item/weapon/gun/projectile/automatic/al68grenadier/examine(mob/user)
	..()
	if(launcher.chambered)
		user << "\The [launcher] has \a [launcher.chambered] loaded."
	else
		user << "\The [launcher] is empty."