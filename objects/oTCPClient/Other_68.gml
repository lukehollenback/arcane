/// @description Handle incoming data.

//
// Check to see if the data came from our expected connection. If so, handle it.
//
var msgSockID = ds_map_find_value(async_load, "id")

if sock == msgSockID {
	var msgBuff = ds_map_find_value(async_load, "buffer")

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
				var author = ds_map_find_value(msgData, "Author")
				var content = ds_map_find_value(msgData, "Content")
				var colorClass = ds_map_find_value(msgData, "Color")
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
}