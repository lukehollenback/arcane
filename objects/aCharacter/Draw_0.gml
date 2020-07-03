//
// Draw a rectangle on the destination tile if debug info is being displayed.
//
if (global.debugMode) {
	draw_set_color(cc_black);
	draw_set_alpha(alpha_strong);
	draw_rectangle(
		destX,
		destY,
		(destX + grid_size),
		(destY + grid_size),
		true
	)
}

//
// Figure out the animation frame that we are on.
//
var tileIndex;

     if (direction == 0)   tileIndex = walkingRightAnimIndex
else if (direction == 90)  tileIndex = walkingUpAnimIndex
else if (direction == 180) tileIndex = walkingLeftAnimIndex
else if (direction == 270) tileIndex = walkingDownAnimIndex

//
// Draw each layer of the character.
//
draw_tile(baseTileset, tileIndex, animFrameIndex, x, y)
