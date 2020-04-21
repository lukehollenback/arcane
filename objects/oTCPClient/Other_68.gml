/// @description Handle incoming data.

//
// Check to see if the data came from our expected connection. If so, handle it.
//
var msgSockID = ds_map_find_value(async_load, "id")

if sock == msgSockID {
	var msgBuff = ds_map_find_value(async_load, "buffer")
	var msgRaw = buffer_read(msgBuff, buffer_string)
	
	show_debug_message("server ~> " + msgRaw)
	
	var msgJSON = json_decode(msgRaw)
	var msgKey = ds_map_find_value(msgJSON, "Key")
	var msgData = ds_map_find_value(msgJSON, "Data")
	
	switch msgKey {
		case "Auth":
			show_debug_message("Authentication was successful.")
		
			state = TCPClientStates.READY
			
			break
			
		case "Chat":
			var author = ds_map_find_value(msgData, "Author")
			var content = ds_map_find_value(msgData, "Content")
			var color = ds_map_find_value(msgData, "Color")
			
			chat_append_message((author + ": "), content, c_red)
			
			break
			
		default:
			if state == TCPClientStates.READY {
				// TODO: Invoke generic message handling.
			}
			
			break
	}
}