/// @description Generates the data payload for an Auth-type message.

var token = argument0
var data = ds_map_create()

ds_map_add(data, "Token", token)

return msg_create("Auth", data)