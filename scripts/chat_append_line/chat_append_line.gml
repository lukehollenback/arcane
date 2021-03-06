///
/// @desc                 Appends an individual line to the chat module.
/// @param {string} msg   The message to append.
/// @param {number} color The color of the message to append.
///
function chat_append_line(msg, color) {

	//
	// Clear out the oldest line if we already have our maximum number of lines.
	//
	if (ds_list_size(oHUD.chatLines) >= oHUD.chatLineCount) {
		ds_list_delete(oHUD.chatLines, 0);
		ds_list_delete(oHUD.chatLineColors, 0);
	}

	//
	// Add the new chat line to the bottom.
	//
	ds_list_add(oHUD.chatLines, msg);
	ds_list_add(oHUD.chatLineColors, color);

}