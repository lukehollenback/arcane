///
/// @description Deserialize Synchronized Variables
///

//
// Inherit the parent event.
//
// NOTE: In this particular case, the aSyncedObject.UserEvent14 takes care of deserializing the
//  object's current x and y coordinates.
//
event_inherited()

//
// Unpack the other synced variables of the object from the variables structure.
//
destX = syncedVars.destX
destY = syncedVars.destY
movementSpeed = syncedVars.movementSpeed
isCelebrating = syncedVars.isCelebrating
