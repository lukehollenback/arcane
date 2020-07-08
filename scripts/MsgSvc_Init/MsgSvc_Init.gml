///
/// @desc Creates an service structure in the global scope to hold references to message structure
///  constructors and handle message processing for them.
///
function MsgSvc_Init() {
	
	if (!variable_global_exists("MsgSvc")) {
		global.MsgSvc = {
	
			///
			/// @desc Map holding registered message types.
			///
			registeredMsgs: ds_map_create(),
		
			///
			/// @desc                  Registers a new message type so that it can be handled.
			/// @param {index} coercer A reference to a function that can coerce the data payload
			///                        of a received message into its proper structure type (w/a
			///                        valid Handle method).
			///
			Register: function(msgType) {
				ds_map_add(registeredMsgs, msgType.Key, msgType)
				
				show_debug_message(
					"Registered the \"" + msgType.Key + "\" message type with the Message Service."
				)
			},
		
			///
			/// @desc Handles a message.
			/// @param {index} payload A reference to a structure that contains the full payload of
			///                        the message that should be handled. Usually this will come
			///                        from deserializing a raw message buffer into a struct with a
			///                        library like SNAP.
			///
			Handle: function(payload) {
				var msgType = registeredMsgs[? payload.Key]
				var reqAuth = msgType.RequiresAuth
				var isAuthed = (oClient.state == ClientStates.READY)
				
				if (!reqAuth || (reqAuth && isAuthed)) {
					var msg = msgType.Coercer(payload.Data)
					
					msg.Handle()
				} else {
					show_debug_message(
						"Refusing to handle message of type \"" + msgType.Key + "\" as it requires " +
							"authentication, which has not yet occurred."
					)
				}
			}
	
		}
	}

}