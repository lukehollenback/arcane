//
// Figure out which direction we are moving (if at all).
//
// NOTE: We lock ourselves into a 32x32 tile-based grid here. This means that we will always move
//  at least 32 pixels (a.k.a. one tile) in the specified direction when a movement action is
//  specified.
//
var movementIsTriggered = false;
var xIsAligned = ((x % 32) == 0);
var yIsAligned = ((y % 32) == 0);


if (actionMoveRight && yIsAligned) {
	direction = 0;
	movementIsTriggered = true;
}

if (actionMoveUp && xIsAligned) {
	direction = 90;
	movementIsTriggered = true;
}

if (actionMoveLeft && yIsAligned) {
	direction = 180;
	movementIsTriggered = true;
}

if (actionMoveDown && xIsAligned) {
	direction = 270;
	movementIsTriggered = true;
}

if (movementIsTriggered) {
	speed = 2;
} else if (xIsAligned && yIsAligned) {
	speed = 0;
}