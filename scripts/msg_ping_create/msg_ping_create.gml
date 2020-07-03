///
/// @description Generates the data payload for an Ping-type message.
///
/// @param {number} The Unix Epoch-style timestamp to put as the "sent time" in the message.
///
/// @return {number} The index of the map holding the constructed message payload.
///

var sentTime = argument0

var data = ds_map_create()

ds_map_add(data, "SentTime", sentTime)

return msg_create("Ping", data)