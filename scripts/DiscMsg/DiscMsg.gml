///
/// @desc Constructs a Force Disconnect/Kick-type message. Note that these types of messages are
///  never created by the client – they are only ever created by the server. Thus, this constructor
///  simply initializes all members to "undefined".
///
function DiscMsg() constructor {

	Reason = undefined;
	
	static Handle = function() {
		show_debug_message("The server forced disconnection. (Reason: " + Reason + ")")
			
		oClient.state = ClientStates.DISC
			
		room_goto(rLogin)
	}
	
	static Pack = function() {
		return new Msg("Disc", self)
	}
	
}

//
// Ensure that the Message Service is initialized and then register the above-defined message type
// with the service.
//
MsgSvc_Init()

global.MsgSvc.Register(
	new MsgType(
		"Disc",
		function(data) {
			var struct = new DiscMsg()
	
			struct_coerce(data, struct)
	
			return struct
		},
		false
	)
)