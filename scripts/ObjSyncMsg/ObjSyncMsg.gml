///
/// @desc               Constructs an Object Variable Synchronization-type message.
/// @param {index} inst A reference to the oSyncedObject instance for which a variable
///  synchronization message should be constructed.
///
function ObjSyncMsg(inst) constructor {
	
	// NOTE: Since we expect an actual reference to an instance to sync, rather than individual
	//  components of the message payload, we must perform optional/undefined checks below so that
	//  we can use the same constructor to coerce arbitrary message payloads into this structure.
	
	ObjectID = is_undefined(inst) ? undefined : inst.objectID
	AreaID = is_undefined(inst) ? undefined : inst.areaID
	Variables = is_undefined(inst) ? undefined : inst.syncedVars
	
	static Handle = function() {
		//
		// Make sure that the object is known by the current synchronized area.
		//
		if (AreaID != oSyncedArea.areaID) {
			show_debug_message(
				"Ignoring \"ObjSync\" message for object \"" + string(ObjectID) + "\" in area \"" +
					string(AreaID) + "\" because it is not the currently-synchronized area (\"" + 
					oSyncedArea.areaID + "\")."
			)
	
			return undefined
		}

		var object = ds_map_find_value(oSyncedArea.objects, ObjectID)

		if (is_undefined(object)) {
			show_debug_message(
				"Ignoring \"ObjSync\" message for object \"" + string(ObjectID) + "\" in area \"" +
					string(AreaID) + "\" because the synchronized area does not currently know " +
					"about this object."
			)

			return undefined
		}

		//
		// Deserialize the vars into the synchronized object's vars structure.
		//
		// NOTE: Because anonymouse functions are bound to an instance at call-time, the one below
		//  has no direct access to our "object" variable. Thus, we must create a temporary
		//  instance variable – which it will have access to.
		//
		__object = object
		
		foreach(Variables, function(val, _, name) {
			variable_struct_set(__object.syncedVars, name, val)
		})
		
		__object = undefined

		//
		// Execute the object's post-synchronization processing.
		//
		with (object) {
			event_user(13)
		}
	}
	
	static Pack = function() {
		return new Msg("ObjSync", self)
	}
	
}

//
// Ensure that the Message Service is initialized and then register the above-defined message type
// with the service.
//
MsgSvc_Init()

global.MsgSvc.Register(
	new MsgType(
		"ObjSync",
		function(data) {
			var struct = new ObjSyncMsg()
	
			struct_coerce(data, struct)
	
			return struct
		},
		false
	)
)