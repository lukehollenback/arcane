//
// Since this is for the local player, figure out if any actions are being executed and set/unset the
// appropriate sentinels.
//
if (keyboard_check(vk_right)) {
	actionMoveRight = true
} else {
	actionMoveRight = false
}

if (keyboard_check(vk_up)) {
	actionMoveUp = true
} else {
	actionMoveUp = false
}

if (keyboard_check(vk_left)) {
	actionMoveLeft = true
} else {
	actionMoveLeft = false
}

if (keyboard_check(vk_down)) {
	actionMoveDown = true
} else {
	actionMoveDown = false
}

//
// Execute the basic oCharacter step actions.
//
event_inherited()