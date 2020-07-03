///
/// @description Handles the "whatis" chat command.
///
/// @param noun {string} The first (and only) argument of the command specifying the noun that
///  should be described.
///

var noun = argument0

if (noun == "intelligence" || noun == "intellect" || noun == "int") {
	chat_append_message(
		"Game: ",
		"Intelligence :int: is a measure of what a character has learned (\"book smarts\"), and " + 
			"how fast they learn new things. It influences the available techniques (e.g. spells) " +
			"and the number of points earned at level-up time.",
		cc_gray
	);
} else if (noun == "wisdom" || noun == "wis") {
	chat_append_message(
		"Game: ",
		"Wisdom :wis: is a measure of what a character has experienced (\"street smarts\"). It " +
			"influences the potency of available techniques (e.g. spells), the amount of energy " +
			"consumed (e.g. mana), and the ability to navigate difficult social interactions.",
		cc_gray
	);
} else {
	chat_append_message(
		"Game: ",
		"Unfortunately, no information is available about " + string(noun) + ".",
		cc_gray
	);
}