/mob/living/carbon/human/proc/change_appearance(var/flags = APPEARANCE_ALL_HAIR, var/location = src, var/mob/user = src, var/check_species_whitelist = 1, var/list/species_whitelist = list(), var/list/species_blacklist = list(), var/datum/topic_state/state = default_state)
	var/obj/nano_module/appearance_changer/AC = new(location, src, check_species_whitelist, species_whitelist, species_blacklist)
	AC.flags = flags
	AC.ui_interact(user, state = state)

/mob/living/carbon/human/proc/change_species(var/new_species)
	if(!new_species)
		return

	if(species == new_species)
		return

	if(!(new_species in all_species))
		return

	set_species(new_species)
	reset_hair()
	return 1

/mob/living/carbon/human/proc/change_gender(var/gender)
	if(src.gender == gender)
		return

	src.gender = gender
	reset_hair()
	update_body()
	update_dna()
	return 1

/mob/living/carbon/human/proc/change_hair(var/hair_style)
	if(!hair_style)
		return

	if(h_style == hair_style)
		return

	if(!(hair_style in hair_styles_list))
		return

	h_style = hair_style

	update_hair()
	return 1

/mob/living/carbon/human/proc/change_facial_hair(var/facial_hair_style)
	if(!facial_hair_style)
		return

	if(f_style == facial_hair_style)
		return

	if(!(facial_hair_style in facial_hair_styles_list))
		return

	f_style = facial_hair_style

	update_hair()
	return 1

/mob/living/carbon/human/proc/reset_hair()
	var/list/valid_hairstyles = generate_valid_hairstyles()
	var/list/valid_facial_hairstyles = generate_valid_facial_hairstyles()

	if(valid_hairstyles.len)
		h_style = pick(valid_hairstyles)
	else
		//this shouldn't happen
		h_style = "Bald"

	if(valid_facial_hairstyles.len)
		f_style = pick(valid_facial_hairstyles)
	else
		//this shouldn't happen
		f_style = "Shaved"

	update_hair()

/mob/living/carbon/human/proc/change_eye_color(var/red, var/green, var/blue)
	if(red == eyes_r && green == eyes_g && blue == eyes_b)
		return

	eyes_r = red
	eyes_g = green
	eyes_b = blue

	update_eyes()
	update_body()
	return 1

/*/mob/living/carbon/human/proc/change_lips_color(var/red, var/green, var/blue)
	if(red == lips_r && blue == lips_b && green == lips_g)
		return

	eyes_r = red
	eyes_g = green
	eyes_b = blue

	update_eyes()
	update_body()
	return 1*/

/mob/living/carbon/human/proc/change_hair_color(var/red, var/green, var/blue)
	if(red == hair_r && green == hair_g && blue == hair_b)
		return

	hair_r = red
	hair_g = green
	hair_b = blue

	update_hair()
	return 1

/mob/living/carbon/human/proc/change_facial_hair_color(var/red, var/green, var/blue)
	if(red == facial_r && green == facial_g && blue == facial_b)
		return

	facial_r = red
	facial_g = green
	facial_b = blue

	update_hair()
	return 1

/mob/living/carbon/human/proc/change_skin_color(var/red, var/green, var/blue)
	if(red == skin_r && green == skin_g && blue == skin_b || !(species.flags & HAS_SKIN_COLOR))
		return

	skin_r = red
	skin_g = green
	skin_b = blue

	force_update_limbs()
	return 1

/mob/living/carbon/human/proc/change_skin_tone(var/tone)
	if(s_tone == tone || !(species.flags & HAS_SKIN_TONE))
		return

	s_tone = tone

	force_update_limbs()
	return 1

/mob/living/carbon/human/proc/update_dna()
	check_dna()
	dna.ready_dna(src)

/mob/living/carbon/human/proc/generate_valid_species(var/check_whitelist = 1, var/list/whitelist = list(), var/list/blacklist = list())
	var/list/valid_species = new()
	for(var/current_species_name in all_species)
		var/datum/species/current_species = all_species[current_species_name]

		if(check_whitelist && config.usealienwhitelist && !check_rights(R_ADMIN, 0, src)) //If we're using the whitelist, make sure to check it!
			if(!(current_species.flags & CAN_JOIN))
				continue
			if(whitelist.len && !(current_species_name in whitelist))
				continue
			if(blacklist.len && (current_species_name in blacklist))
				continue
			if((current_species.flags & IS_WHITELISTED) && !is_alien_whitelisted(src, current_species_name))
				continue

		valid_species += current_species_name

	return valid_species

/mob/living/carbon/human/proc/generate_valid_hairstyles(var/check_gender = 1)
	var/list/valid_hairstyles = new()
	for(var/hairstyle in hair_styles_list)
		var/datum/sprite_accessory/S = hair_styles_list[hairstyle]

		if(check_gender && gender == MALE && S.gender == FEMALE)
			continue
		if(check_gender && gender == FEMALE && S.gender == MALE)
			continue
		if(!(species.get_bodytype() in S.species_allowed))
			continue
		valid_hairstyles += hairstyle

	return valid_hairstyles

/mob/living/carbon/human/proc/generate_valid_facial_hairstyles()
	var/list/valid_facial_hairstyles = new()
	for(var/facialhairstyle in facial_hair_styles_list)
		var/datum/sprite_accessory/S = facial_hair_styles_list[facialhairstyle]

		if(gender == MALE && S.gender == FEMALE)
			continue
		if(gender == FEMALE && S.gender == MALE)
			continue
		if(!(species.get_bodytype() in S.species_allowed))
			continue

		valid_facial_hairstyles += facialhairstyle

	return valid_facial_hairstyles

/mob/living/carbon/human/proc/force_update_limbs()
	for(var/obj/item/organ/external/O in organs)
		O.sync_colour_to_human(src)
	update_body(0)
