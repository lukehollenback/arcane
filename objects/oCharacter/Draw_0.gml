//
// Figure out the animation frame that we are on.
//
var tileIndex;

     if (direction == 0)   tileIndex = walkingRightAnimIndex;
else if (direction == 90)  tileIndex = walkingUpAnimIndex;
else if (direction == 180) tileIndex = walkingLeftAnimIndex;
else if (direction == 270) tileIndex = walkingDownAnimIndex;

var tileData = tileIndex;

//
// Draw each layer of the character.
//
draw_tile(baseTileset, tileData, animFrameIndex, x, y);
