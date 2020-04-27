///
/// @description Generates the data payload for an Auth-type message.
///
/// @param {string} token The authentication token for the payload.
///
/// @return {number} The index of the map holding the constructed message payload.
///

var token = argument0
var data = ds_map_create()

ds_map_add(data, "Token", token)

return msg_create("Auth", data)