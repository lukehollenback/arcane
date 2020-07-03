//
// Inherit the parent event.
//
event_inherited()

//
// Since this is for the local player, figure out if any actions are being triggered or need to be
// executed. Synchronized actions should always happen during the step after they are triggered so
// that proper synchronization can occur.
//
if (isAligned) {
	//
	// Check for movement actions.
	//
	if (keyboard_check(vk_right)) {
		destX = (x + grid_size)
		publishAfterStep = true
	} else if (keyboard_check(vk_up)) {
		destY = (y - grid_size)
		publishAfterStep = true
	} else if (keyboard_check(vk_left)) {
		destX = (x - grid_size)
		publishAfterStep = true
	} else if (keyboard_check(vk_down)) {
		destY = (y + grid_size)
		publishAfterStep = true
	}
	
	//
	// Check for auxiliary actions.
	//
	if (canEmote && keyboard_check(ord("Z"))) {
		isCelebrating = true
		canEmote = false
		publishAfterStep = true
	}
}

//
// Verify that the destination does not collide with anything that will prevent the character from
// being able to move. If it does, cancel the destination.
//
// TODO ~> This.