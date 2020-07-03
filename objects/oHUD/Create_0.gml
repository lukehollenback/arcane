//
// Declare a "info modules" enum with possible modules that can be displayed in the bottom-right
// corner of the user interface.
//
enum InfoModules {
	ATTRIBUTES,
	SKILLS,
	INVENTORY,
	QUESTS
}

//
// Instantiate the data structures that will hold chat messages that need to be drawn.
//
chatLines = ds_list_create()
chatLineColors = ds_list_create()

//
// Add a few test chat messages.
//
chat_append_message("Game: ", "Type !help to learn about available chat commands.", cc_gray)