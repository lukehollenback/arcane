///
/// @desc Handles the "network_type_data" async networking event.
///
function oClient_HandleDataEvent() {

	var ip = async_load[?"ip"]
	var port = async_load[?"port"]
	var buff = async_load[?"buffer"]

	//
	// Iterate through all of the messages that were sent as part of the received packet. Each will be
	// delimited by a null character (because they are sent as serialized JSON strings).
	//
	while (buffer_peek(buff, buffer_tell(buff), buffer_u8) != undefined) {
		//
		// Read the message out of the buffer up to the first null character.
		//
		var msgRaw = buffer_read(buff, buffer_string)

		//
		// If necessary, print out the message to the debug console.
		//
		if (global.debugMode) {
			show_debug_message(string(ip) + ":" + string(port) + " ↝ " + msgRaw)
		}
	
		//
		// Deserialize the message into a structure and handle it.
		//
		var msg = snap_from_json(msgRaw)
	
		global.MsgSvc.Handle(msg)
	}

}
