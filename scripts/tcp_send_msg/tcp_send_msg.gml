///
/// @description Encodes and sends the provided message to the server over the
///  established TCP/IP connection.
///
/// @param {number} The index of the map holding the constructed message payload.
///

var msg = argument0

//
// Make sure that we are in a valid state for sending messages.
//
if (
	oClient.state == ClientStates.CONN ||
	oClient.state == ClientStates.DISC ||
	oClient.state == ClientStates.FAILED
) {
	show_debug_message(
		"Cannot send message to the server over TCP/IP! (Message: " + msg + ") (State: " +
			oClient.state + ")"
	)
	
	exit
}

//
// Encode the message and send it to the server over the established TCP/IP connection.
//
// NOTE: We explicitly use the buffer_string buffer type so that a null character gets appended to
//  the end of our message. The server expects a null character to be the terminating delimiter of
//  all received messages.
//
var msgEncoded = json_encode(msg)
var buff = buffer_create(256, buffer_grow, 1)

buffer_seek(buff, buffer_seek_start, 0)
buffer_write(buff, buffer_string, msgEncoded);

network_send_raw(oClient.sock, buff, buffer_tell(buff))

buffer_delete(buff)