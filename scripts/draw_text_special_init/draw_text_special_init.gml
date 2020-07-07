///
/// @desc Singleton script that will create the global icon lookup table if it has not yet been
///       created. The intention of the table is to provide a fast way for finding sprite resources
///       that correlate to various text interpolations (e.g. to support emoticons).
///
function draw_text_special_init() {

	if (!variable_global_exists("iconLookupTable")) {
		global.iconLookupTable = ds_map_create()
		global.iconLookupTableKeys =  array_create(0)
	
		ds_map_add(global.iconLookupTable, " :heart: ", sHeartIcon)
		array_set(global.iconLookupTableKeys, 0, " :heart: ")
	
		ds_map_add(global.iconLookupTable, " <3 ", sHeartIcon)
		array_set(global.iconLookupTableKeys, 1, " <3 ")
	
		ds_map_add(global.iconLookupTable, " :mana: ", sManaIcon)
		array_set(global.iconLookupTableKeys, 2, " :mana: ")
	
		ds_map_add(global.iconLookupTable, " :strength: ", sStrengthIcon)
		array_set(global.iconLookupTableKeys, 3, " :strength: ")
	
		ds_map_add(global.iconLookupTable, " :dexterity: ", sDexterityIcon)
		array_set(global.iconLookupTableKeys, 4, " :dexterity: ")
	
		ds_map_add(global.iconLookupTable, " :intelligence: ", sIntelligenceIcon)
		array_set(global.iconLookupTableKeys, 5, " :intelligence: ")
	
		ds_map_add(global.iconLookupTable, " :wisdom: ", sWisdomIcon)
		array_set(global.iconLookupTableKeys, 6, " :wisdom: ")
	
		ds_map_add(global.iconLookupTable, " :charisma: ", sCharismaIcon)
		array_set(global.iconLookupTableKeys, 7, " :charisma: ")
	
		ds_map_add(global.iconLookupTable, " :luck: ", sLuckIcon)
		array_set(global.iconLookupTableKeys, 8, " :luck: ")
	
		ds_map_add(global.iconLookupTable, " :int: ", sIntelligenceIcon)
		array_set(global.iconLookupTableKeys, 9, " :int: ")
	
		ds_map_add(global.iconLookupTable, " :wis: ", sWisdomIcon)
		array_set(global.iconLookupTableKeys, 10, " :wis: ")
	}

}
