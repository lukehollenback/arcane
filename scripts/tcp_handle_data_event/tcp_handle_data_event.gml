///
/// @description Handles the "network_type_data" async networking event.
///

var ip = async_load[?"ip"]
var port = async_load[?"port"]
var msgBuff = async_load[?"buffer"]

while (buffer_peek(msgBuff, buffer_tell(msgBuff), buffer_u8) != undefined) {
	var msgRaw = buffer_read(msgBuff, buffer_string)
		
	show_debug_message(string(ip) + ":" + string(port) + " ↝ " + msgRaw)
	
	var msgDecoded = json_decode(msgRaw)
	
	msg_handle(msgDecoded)
}