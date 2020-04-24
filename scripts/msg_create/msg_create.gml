///
/// @description Generates a full message payload with the provided key and data payload.
///
/// @param {string} key  The key representing the message type. For example, "Auth" or "Chat".
/// @param {number} data The index of the map holding the messages data payload.
///
/// @return {number} The index of the map holding the constructed message payload.
///

var key = argument0
var data = argument1
var msg = ds_map_create()

ds_map_add(msg, "Key", key)
ds_map_add_map(msg, "Data", data)

return msg