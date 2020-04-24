/// @description Handle incoming data.

//
// Check to see if the data came from our expected connection. If so, handle it.
//
var type = async_load[?"type"]
var ip = async_load[?"ip"]
var port = async_load[?"port"]
var sockID = async_load[?"id"]

show_debug_message(
	"Async networking event triggered. (Event: " + string(type) + ") (Addr: " + string(ip) + ":" +
		string(port) + ")"
)

if sock == sockID {
	switch type {
		case network_type_data:
			tcp_handle_data_event()
			break
	}
}