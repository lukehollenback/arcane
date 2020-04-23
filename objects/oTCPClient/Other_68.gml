/// @description Handle incoming data.

//
// Check to see if the data came from our expected connection. If so, handle it.
//
var type = async_load[?"type"]
var sockID = async_load[?"id"]

if sock == sockID {
	switch type {
		case network_type_data:
			tcp_handle_data_event()
			break
	}
}