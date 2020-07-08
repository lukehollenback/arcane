///
/// @desc              Encodes and sends the provided message to the server over the
///                    established TCP/IP connection.
/// @param {index} msg A reference to the map holding the constructed message payload.
///
function oClient_Send(msg) {

	//
	// Make sure that we are in a valid state for sending messages.
	//
	if (
		state == ClientStates.CONN ||
		state == ClientStates.DISC ||
		state == ClientStates.FAILED
	) {
		show_debug_message(
			"Cannot send message to the server over TCP/IP! (Message: " + msg + ") (State: " +
				state + ")"
		)
	
		exit
	}

	//
	// Encode the message and send it to the server over the established TCP/IP connection.
	//
	// NOTE: We explicitly use the buffer_string buffer type so that a null character gets appended
	//  to the end of our message. The server expects a null character to be the terminating
	//  delimiter of all received messages.
	//
	var msgEncoded = snap_to_json(msg)
	
	if (global.debugMode) {
		show_debug_message("server ↜ " + msgEncoded)
	}
	
	var buff = buffer_create(256, buffer_grow, 1)

	buffer_seek(buff, buffer_seek_start, 0)
	buffer_write(buff, buffer_string, msgEncoded);

	network_send_raw(sock, buff, buffer_tell(buff))

	buffer_delete(buff)

}