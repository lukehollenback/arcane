//
// Determine if the character is locked to the grid.
//
var xIsAligned = ((x % grid_size) == 0);
var yIsAligned = ((y % grid_size) == 0);

isAligned = (xIsAligned && yIsAligned);
//
// Run any actions are triggered.
//
if (isAligned) {
	//
	// If the player is celebrating, spawn some confetti.
	//
	if (isCelebrating) {
		repeat(2 + random(3)) {
			effect_create_above(ef_firework, (x + random(grid_size)), (y + random(grid_size)), choose(0, 1), choose(cc_yellow, cc_green, cc_teal, cc_white, cc_purple))
		}
		
		isCelebrating = false
		publishAfterStep = true
	}
}