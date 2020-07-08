///
/// @desc                   Constructs a new Chat Message-type message. Note that clients never
///                         fully create these types of messages – they are always populated and
///                         fully-constructed server-side if-and-only-if the relevant client is
///                         verified. Thus, the constructor does not expose all fields of this
///                         type – and it initializes them instead to "undefined".
/// @param {string} content The content of the chat message.
///
function ChatMsg(content) constructor {
	
	Author = undefined
	Content = content;
	Color = undefined
	
	static Handle = function() {
		// NOTE: The "Color" provided in Chat-type messages is actually an enum refering to a
		//  "color classification". It is up to the client to derive an actual color from its theme
		//  based on said classification.
		
		var actualColor = color_from_classification(Color)
			
		chat_append_message((Author + ": "), Content, actualColor)
	}
	
	static Pack = function() {
		return new Msg("Chat", self)
	}
	
}

//
// Ensure that the Message Service is initialized and then register the above-defined message type
// with the service.
//
MsgSvc_Init()

global.MsgSvc.Register(
	new MsgType(
		"Chat",
		function(data) {
			var struct = new ChatMsg()
	
			struct_coerce(data, struct)
	
			return struct
		},
		false
	)
)