///
/// @desc                   Appends a new chat message to the chat module. Takes length into
///                         account and appropriately breaks lines if necessary.
/// @param {string} prefix  Prefix of the message (e.g. indentation or a character name).
/// @param {string} msg     The message to append.
/// @param {number} color   The color of the message to append.
///
function chat_append_message(prefix, msg, color) {

	//
	// Build the initial remaining message payload (with the entire message).
	//
	// NOTE: We will manipulate the remainingMessage variable if necessary as we append out individual
	//  lines of the message being appended.
	//
	var remainingMessage = (prefix + chat_clean_message(msg));

	//
	// If the message being appended is multi-line, append the first number lines.
	//
	var prefixLength = string_length(prefix);

	while (string_length(remainingMessage) > oHUD.chatLineCharacterLimit) {
		//
		// Attempt to find a clean location to split the line (e.g. a space character).
		//
		// NOTE: We do not ever want to truncate off the prefix of the line we are going to be appending.
		//
		var splitCount = oHUD.chatLineCharacterLimit;
	
		var i;
		for (i = splitCount; i > prefixLength; i--) {
			if (string_char_at(remainingMessage, i) == " ") {
				splitCount = i;
				break;
			}
		}
	
		//
		// Grab the valid part of the message and append it as a new line.
		//
		var message = string_copy(remainingMessage, 1, splitCount);
	
		chat_append_line(message, color);
	
		//
		// Delete the appeneded part of the message so that we can continue processing the remainder. Now
		// that we have appended at least one line to the chat module, we can also set our prefix as an
		// indentation.
		//
		prefix = "  ";
		prefixLength = string_length(prefix);
		remainingMessage = (prefix + string_delete(remainingMessage, 1, splitCount));
	}

	//
	// Append the final line of the message.
	//
	chat_append_line(remainingMessage, color);
	
}
