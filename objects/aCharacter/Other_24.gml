///
/// @description Serialize Synchronized Variables
///

//
// Inherit the parent event.
//
// NOTE ~> In this particular case, the aSyncedObject.UserEvent14 takes care of serializing the
//  object's current x and y coordinates.
//
event_inherited()

//
// Pack the other synced variables of the object into the synchronized variables structure.
//
syncedVars.destX = destX
syncedVars.destY = destY
syncedVars.movementSpeed = movementSpeed
syncedVars.isCelebrating = isCelebrating
