/**
 * @desc Processes a raw chat message that was entered by the user.
 *
 * @arg0 message The raw message to process.
 */
 
var message = argument0;

//
// If the command starts with a bang, process it as an actual command. Otherwise, assume it is just
// a regular chat message to be sent to the world.
//
var firstChar = string_char_at(message, 1);
var isCommand = (firstChar == "!" || firstChar == "/");

if (isCommand) {
	//
	// Split the message up into its command and its arguments. If there are no arguments, then treat
	// the entire message (less the bang character) as the command.
	//
	var command = string_copy(message, 2, string_length(message));
	var commandLen = string_length(command);
	var commandSplitPos = string_pos(" ", command);
	
	if (commandSplitPos == 0) {
		commandSplitPos = (commandLen + 1);
	}
	
	var commandVerb = string_copy(command, 1, (commandSplitPos - 1));
	var commandVerbLen = string_length(commandVerb);
	var commandArgsLen = (string_length(command) - commandVerbLen - 1);
	var commandArgs = string_copy(command, (commandSplitPos + 1), commandArgsLen);
	
	show_debug_message("Processing command (commandVerb = " + commandVerb + ", commandArgs = " + commandArgs + ").");
	
	//
	// Actually process the command.
	//
	if (commandVerb == "help") {
		chat_append_message("Game: ", "The following commands are allowed...", cc_gray);
		chat_append_message("  - ", "!list  Lists the currently-online players.", cc_gray);
		chat_append_message("  - ", "!msg [player] [message]  Sends a private message.", cc_gray);
		chat_append_message("  - ", "!morehelp  Shows even more available commands.", cc_gray)
	} else if (commandVerb == "morehelp") {
		chat_append_message("Game: ", "The following commands are allowed...", cc_ltgray);
		chat_append_message("  - ", "!kick [player]  Moderator only. Kicks a player.", cc_gray);
		chat_append_message("  - ", "!ban [player]  Moderator only. Bans a player.", cc_gray);
		chat_append_message("  - ", "!help  Shows even more available commands.", cc_gray)
	} else {
		chat_append_message("Game: ", "An unknown command was specified.", cc_gray);
	}
} else {
	var messagePrefix = "Zaedaux: ";
		
	chat_append_message(messagePrefix, message, cc_white);
}