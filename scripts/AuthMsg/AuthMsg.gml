///
/// @desc                 Constructs an Authentication-type message.
/// @param {string} token The authentication token that was recieved from the authentication
///                       service at login.
///
function AuthMsg(token) constructor {
	
	Token = token;
	
	static Handle = function() {
		show_debug_message("Authentication was successful.")
		
		oClient.state = ClientStates.READY
	}
	
	static Pack = function() {
		return new Msg("Auth", self)
	}
	
}

//
// Ensure that the Message Service is initialized and then register the above-defined message type
// with the service.
//
MsgSvc_Init()

global.MsgSvc.Register(
	new MsgType(
		"Auth",
		function(data) {
			var struct = new AuthMsg()
	
			struct_coerce(data, struct)
	
			return struct
		},
		false
	)
)