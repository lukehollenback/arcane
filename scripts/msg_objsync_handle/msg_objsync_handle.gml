///
/// @description Handles "CharacterCreate"-type messages.
///
/// @param msg {number} The index of the map representing the full decoded message.
///

var data = argument0[? "Data"]

//
// Make sure that the object is known by the current synchronized area.
//
var areaID = data[? "AreaID"]
var objectID = data[? "ObjectID"]
var vars = data[? "Variables"]

if (areaID != oSyncedArea.areaID) {
	show_debug_message(
		"Ignoring \"ObjSync\" message for object \"" + string(objectID) + "\" in area \"" +
			string(areaID) + "\" because it is not the currently-synchronized area (\"" + 
			oSyncedArea.areaID + "\")."
	)
	
	return
}

var object = ds_map_find_value(oSyncedArea.objects, objectID)

if (is_undefined(object)) {
	show_debug_message(
		"Ignoring \"ObjSync\" message for object \"" + string(objectID) + "\" in area \"" +
			string(areaID) + "\" because the synchronized area does not currently know about this object."
	)

	return
}

//
// Deserialize the vars into the synchronized object's vars structure.
//
for (var key = ds_map_find_first(vars); !is_undefined(key); key = ds_map_find_next(vars, key)) {
  var val = vars[? key]
  
	object.syncedVars[? key] = val
}

//
// Execute the object's post-synchronization processing.
//
with (object) {
	event_user(13)
}