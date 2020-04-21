/// @description Establish network connection.

conn = network_connect_raw(sock, "127.0.0.1", 6543)
if conn < 0 {
	show_debug_message("Attempt #" + connAttemptCnt + " failed to connect to server over TCP/IP.")
	
	connAttemptCnt++
	
	if connAttemptCnt < connAttemptMax {
		show_debug_message("Will retry.")
		
		alarm_set(0, connAttemptInt)
	} else {
		show_debug_message("Failed to connect to many times. Will not retry.")
		
		state = TCPClientStates.FAILED
	}
} else {
	show_debug_message("Connected to server over TCP/IP!")
	
	state = TCPClientStates.AUTH
}