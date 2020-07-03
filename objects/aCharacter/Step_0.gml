//
// Figure out which direction we are moving (if at all).
//
// NOTE: We lock ourselves into a 32x32 tile-based grid here. This means that we will always move
//  at least 32 pixels (a.k.a. one tile) in the specified direction when a movement action is
//  specified.
//
var pxRegular = (movementSpeed * speed_pixels)

if (x < destX) {
	var diff = (destX - x)
	var px = (diff < pxRegular) ? diff : pxRegular
	
	x += px
	direction = 0
} else if (y > destY) {
	var diff = (y - destY)
	var px = (diff < pxRegular) ? diff : pxRegular
	
	y -= px
	direction = 90
} else if (x > destX) {
	var diff = (x - destX)
	var px = (diff < pxRegular) ? diff : pxRegular
	
	x -= px
	direction = 180
} else if (y < destY) {
	var diff = (destY - y)
	var px = (diff < pxRegular) ? diff : pxRegular
	
	y += px
	direction = 270
}

if (x != destX || y != destY) {
	isMoving = true
} else {
	isMoving = false
}