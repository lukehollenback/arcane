/// @description Generates a full message payload with the provided key and data payload.

var key = argument0
var data = argument1
var msg = ds_map_create()

ds_map_add(msg, "Key", key)
ds_map_add_map(msg, "Data", data)

return msg