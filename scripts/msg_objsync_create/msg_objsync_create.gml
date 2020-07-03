///
/// @description Generates the data payload for an Object Sync-type message.
///
/// @param {number} Index of the aSyncedObject child for which a message should be created.
///
/// @return {number} The index of the map holding the constructed message payload.
///

var syncedObject = argument0

var data = ds_map_create()

ds_map_add(data, "ObjectID", syncedObject.objectID)
ds_map_add(data, "AreaID", syncedObject.areaID)
ds_map_add_map(data, "Variables", syncedObject.syncedVars)

return msg_create("ObjSync", data)