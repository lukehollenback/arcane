//
// Process chat message creation.
//
if (keyboard_key == vk_enter) {
	if (chatMessageActivated) {
		//
		// Remove the prefix from the chat message and process it.
		//
		var message = string_delete(chatMessage, 1, chatMessagePrefixLength);
		
		if (string_length(message) > 0) {
			chat_command_process(message);
		}
		
		//
		// Clean and deactivate the chat message.
		//
		chatMessage = "";
		chatMessageActivated = false;
	} else {		
		//
		// Activate the chat message and seed it with the default prefix.
		//
		chatMessageActivated = true;
		chatMessage = chatMessagePrefix;
	}
} else if (keyboard_key == vk_backspace) {
	if (chatMessageActivated && string_length(chatMessage) > chatMessagePrefixLength) {
		//
		// Delete the last character of the chat message currently in draft.
		//
		var chatMessageLength = string_length(chatMessage);
	
		chatMessage = string_delete(chatMessage, chatMessageLength, 1)
	}
} else if (keyboard_string != "" && chatMessageActivated) {
	//
	// Append the buffer of printable characters typed to the chat message currently in draft.
	//
	chatMessage = (chatMessage + keyboard_string);
}

//
// Now that we have handled the buffered printable characters, clear the buffer.
//
keyboard_string = "";