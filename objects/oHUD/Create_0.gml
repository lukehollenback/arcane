//
// Instantiate the data structures that will hold chat messages that need to be drawn.
//
chatLines = ds_list_create();
chatLineColors = ds_list_create();

//
// Add a few test chat messages.
//
chat_append_message("Game: ", "Type !help to learn about available chat commands.", cc_gray);
chat_append_message("Server: ", "Welcome to Arcane, Zaedaux!", cc_red);
chat_append_message("Zaedaux: ", "Hell yeah! Let's do this.", cc_white);
chat_append_message("Zaedaux: ", "Where is everyone?", cc_white);
chat_append_message("Server: ", "We will be restarting the world in 25 minutes. Please log out before hand.", cc_red);