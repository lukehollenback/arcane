///
/// @description Generates the data payload for an Chat-type message.
///
/// @param {string} content The content of the chat message for the payload.
///
/// @return {number} The index of the map holding the constructed message payload.
///

var content = argument0
var data = ds_map_create()

ds_map_add(data, "Content", content)

return msg_create("Chat", data)