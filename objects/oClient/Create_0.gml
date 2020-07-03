/// @description Instantiate variables & start connection attempt loop.

//
// Declare a "client states" enum for our state machine.
//
enum ClientStates {
	CONN,
	AUTH,
	READY,
	FAILED,
	DISC
}

//
// Initialize message handlers.
//
msg_init()

//
// Instantiate some instance variables.
//
clients = ds_map_create() // The client table. Keyed by client ID, and valued with the instance ID of the associated player object.
state = ClientStates.CONN // The current state of the state machine.
sock = network_create_socket(network_socket_tcp) // Handle on the socket used to connect to the server.
conn = 0 // Actual connection to the server. Will be set during connection attempt loop.
connAttemptInt = (fps / 2) // Time between connection attempts.
connAttemptCnt = 0 // Number of connection attempts that have been performed.
connAttemptMax = 1000 // Maximum number of allowed connection attempts before failing.

//
// Begin the connection attempt loop.
//
alarm_set(0, fps)