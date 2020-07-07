/// @desc Network connection cleanup.

//
// Destroy the socket that was used to connect to the server, subsequently disconnecting from it
// if we were connected.
//
network_destroy(sock)

state = ClientStates.DISC
