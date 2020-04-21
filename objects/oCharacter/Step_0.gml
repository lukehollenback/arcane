//
// Figure out which direction we are moving (if at all).
//
// NOTE: We lock ourselves into a 32x32 tile-based grid here. This means that we will always move
//  at least 32 pixels (a.k.a. one tile) in the specified direction when a movement action is
//  specified.
//
var movementKeyIsPressed = false;
var xIsAligned = ((x % 32) == 0);
var yIsAligned = ((y % 32) == 0);


if (keyboard_check(vk_right) && yIsAligned) {
	direction = 0;
	movementKeyIsPressed = true;
}

if (keyboard_check(vk_up) && xIsAligned) {
	direction = 90;
	movementKeyIsPressed = true;
}

if (keyboard_check(vk_left) && yIsAligned) {
	direction = 180;
	movementKeyIsPressed = true;
}

if (keyboard_check(vk_down) && xIsAligned) {
	direction = 270;
	movementKeyIsPressed = true;
}

if (movementKeyIsPressed) {
	speed = 2;
} else if (xIsAligned && yIsAligned) {
	speed = 0;
}