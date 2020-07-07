///
/// @desc Constructs a Object Creation-type message. Note that these types of messages are never
///  created by the client – they are only ever created by the server. Thus, this constructor
///  simply initializes all members to "undefined".
///
function ObjCreateMsg() constructor {
	
	ObjectID = undefined
	AreaID = undefined
	Type = undefined
	X = undefined
	Y = undefined
	Depth = undefined
	
	static Handle = function() {
		//
		// Make sure that the area that the object is to be created in is the current synchronized area.
		//
		if (AreaID != oSyncedArea.areaID) {
			show_debug_message(
				"Ignoring \"ObjCreate\" message for area \"" + string(AreaID) + "\" because it is not the " +
					"currently-synchronized area (\"" + oSyncedArea.areaID + "\")."
			)
	
			return undefined
		}

		//
		// Create the actual instance and tell it who it is.
		//
		var objectTypeIndex = asset_get_index(Type)
		var inst = instance_create_depth(X, Y, Depth, objectTypeIndex)

		inst.objectID = ObjectID
		inst.areaID = AreaID

		//
		// Add a reference to the instance to the client table. This will allow us to later handle messages
		// coming from the server targeting this instance.
		//
		ds_map_add(oSyncedArea.objects, ObjectID, inst)
	}
	
	static Pack = function() {
		return new Msg("ObjCreate", self)
	}
	
}

//
// Ensure that the Message Service is initialized and then register the above-defined message type
// with the service.
//
MsgSvc_Init()

global.MsgSvc.Register(
	new MsgType(
		"ObjCreate",
		function(data) {
			var struct = new ObjCreateMsg()
	
			struct_coerce(data, struct)
	
			return struct
		},
		false
	)
)