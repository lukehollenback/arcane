/// @description Establish network connection.

//
// Attempt to establish a TCP/IP connection to the server.
//
conn = network_connect_raw(sock, "127.0.0.1", 6543)
if conn < 0 {
	//
	// Log some debug info.
	//
	show_debug_message("Attempt #" + connAttemptCnt + " failed to connect to server over TCP/IP.")
	
	//
	// Increment our count of conneciton attempts and make sure we have not maxed out yet.
	//
	connAttemptCnt++
	
	if connAttemptCnt < connAttemptMax {
		show_debug_message("Will retry.")
		
		alarm_set(0, connAttemptInt)
	} else {
		show_debug_message("Failed to connect to many times. Will not retry.")
		
		state = ClientStates.FAILED
	}
} else {
	//
	// Log some debug info.
	//
	show_debug_message("Connected to server over TCP/IP!")
	
	//
	// Move the state machine into the "authenticating" state, which indicates that we have
	// successfully established a connection and are now in the process of completing the initial
	// handshake.
	//
	state = ClientStates.AUTH
	
	//
	// Generate and send our initial auth message to kick off the authentication handshake.
	//
	var payload = new AuthMsg("12345")
	
	Send(payload.Pack())
	
	//
	// Begin the ping tracking loop.
	//
	alarm_set(1, fps)
}