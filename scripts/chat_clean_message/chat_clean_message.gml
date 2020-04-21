/**
 * @desc Cleans dangerous characters (e.g. line breaks) in the provided message.
 
 * @arg0 message – The message to clean.
 * @returns The cleaned message
 */

var cleanMessage = argument0;

cleanMessage = string_replace_all(cleanMessage, "\n", "\\n");
cleanMessage = string_replace_all(cleanMessage, "\t", "\\t");

return cleanMessage;