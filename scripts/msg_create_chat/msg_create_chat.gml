/// @description Generates the data payload for an Auth-type message.

var content = argument0
var data = ds_map_create()

ds_map_add(data, "Content", content)

return msg_create("Chat", data)