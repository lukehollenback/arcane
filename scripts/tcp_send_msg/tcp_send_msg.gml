/// @description Encodes and sends the provided message to the server over the
///  established TCP/IP connection.

var msg = argument0

//
// Make sure that we are in a valid state for sending messages.
//
if (
	oTCPClient.state == TCPClientStates.CONN ||
	oTCPClient.state == TCPClientStates.DISC ||
	oTCPClient.state == TCPClientStates.FAILED
) {
	show_debug_message(
		"Cannot send message to the server over TCP/IP! (Message: " + msg + ") (State: " +
			oTCPClient.state + ")"
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

network_send_raw(oTCPClient.sock, buff, buffer_tell(buff))

buffer_delete(buff)