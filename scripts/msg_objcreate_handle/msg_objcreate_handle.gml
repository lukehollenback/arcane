///
/// @description Handles "CharacterCreate"-type messages.
///
/// @param msg {number} The index of the map representing the full decoded message.
///

var data = argument0[? "Data"]

//
// Make sure that the area that the object is to be created in is the current synchronized area.
//
var areaID = data[? "AreaID"]

if (areaID != oSyncedArea.areaID) {
	show_debug_message(
		"Ignoring \"ObjCreate\" message for area \"" + string(areaID) + "\" because it is not the " +
			"currently-synchronized area (\"" + oSyncedArea.areaID + "\")."
	)
	
	return
}

//
// Create the actual instance and tell it who it is.
//
var objectID = data[? "ObjectID"]
var objectType = data[? "Type"]
var objectTypeIndex = asset_get_index(objectType)
var instID = instance_create_depth(data[? "X"], data[? "Y"], data[? "Depth"], objectTypeIndex)

instID.objectID = objectID
instID.areaID = areaID

//
// Add a reference to the instance to the client table. This will allow us to later handle messages
// coming from the server targeting this instance.
//
ds_map_add(oSyncedArea.objects, objectID, instID)