///
/// @desc               Checks to see if the mouse is currently within the specified position.
/// @param  {number} x1 The top-left x coordinate of the bounding box to check.
/// @param  {number} y1 The top-left y coordinate of the bounding box to check.
/// @param  {number} x2 The bottom-right x coordinate of the bounding box to check.
/// @param  {number} y2 The bottom-right y coordinate of the bounding box to check.
/// @return {bool}      True if the mouse is within the specified position, or false otherwise.
///
function mouse_position_check(x1, y1, x2, y2) {

	var mouseX = window_mouse_get_x();
	var mouseY = window_mouse_get_y();

	return (
		mouseX >= x1 && mouseX <= x2
		&& mouseY >= y1 && mouseY <= y2
	);

}
