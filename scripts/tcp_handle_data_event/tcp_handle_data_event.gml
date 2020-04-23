/// @description Handles the "network_type_data" async networking event.

var msgBuff = async_load[?"buffer"]

while (buffer_peek(msgBuff, buffer_tell(msgBuff), buffer_u8) != undefined) {
	var msgRaw = buffer_read(msgBuff, buffer_string)
		
	show_debug_message("server ~> " + msgRaw)
	
	var msgDecoded = json_decode(msgRaw)
	var msgKey = ds_map_find_value(msgDecoded, "Key")
	var msgData = ds_map_find_value(msgDecoded, "Data")
	
	switch msgKey {
		case "Auth":
			show_debug_message("Authentication was successful.")
		
			state = TCPClientStates.READY
			
			break
			
		case "Chat":
			var author = msgData[?"Author"]
			var content = msgData[?"Content"]
			var colorClass = msgData[?"Color"]
			var color = color_from_classification(colorClass)
			
			chat_append_message((author + ": "), content, color)
			
			break
			
		default:
			if state == TCPClientStates.READY {
				// TODO: Invoke generic message handling.
			}
			
			break
	}
}