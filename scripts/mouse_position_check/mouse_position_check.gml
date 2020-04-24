///
/// @description Checks to see if the mouse is currently within the specified position.
///
/// @param x1 {number}
/// @param y1 {number}
/// @param x2 {number}
/// @param y2 {number}
///
/// @return {bool} True if the mouse is within the specified position, or false otherwise.
///

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var mouseX = window_mouse_get_x();
var mouseY = window_mouse_get_y();

return (
	mouseX >= x1 && mouseX <= x2
	&& mouseY >= y1 && mouseY <= y2
);