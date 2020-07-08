///
/// @desc                Cleans dangerous characters (e.g. line breaks) in the provided message.
/// @param  {string} msg The message to clean.
/// @return {string}     The cleaned message.
///
function chat_clean_message(msg) {

	var cleanMessage = msg;

	cleanMessage = string_replace_all(cleanMessage, "\n", "\\n");
	cleanMessage = string_replace_all(cleanMessage, "\t", "\\t");

	return cleanMessage;

}
