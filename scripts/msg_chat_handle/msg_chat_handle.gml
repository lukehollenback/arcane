///
/// @description Handles "Chat"-type messages.
///
/// @param msg {number} The index of the map representing the full decoded message.
///

var msgData = argument0[? "Data"]
var author = msgData[?"Author"]
var content = msgData[?"Content"]
var colorClass = msgData[?"Color"]
var color = color_from_classification(colorClass)
			
chat_append_message((author + ": "), content, color)