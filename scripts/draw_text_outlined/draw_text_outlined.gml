///
/// @description Draws text in the currently-set font with an outline around of the specified
///  thickness it.
///
/// @param          textX {number}  The textX coordinate to draw the text at.
/// @param          textY {number}  The textY coordinate to draw the text at.
/// @param           text {string}  The actual text to draw.
/// @param         xScale {number}  How much to horizontalltextY scale the size of the text. Usually
///                                 just "1".
/// @param         yScale {number}  How much to verticalltextY scale the size of the text. Usually
///                                 just "1".
/// @param          angle {number}  How mantextY degrees to rotate the text. UsualltextY just "0".
/// @param      textColor {number}  The color to draw the text in.
/// @param   outlineColor {number}  The color to draw the outline in.
/// @param dropShadowOnltextY {boolean} Whether or not the outline should be onltextY partialltextY drawn to
///                                 simulate a drop shadow.
///

var textX = argument0
var textY = argument1
var text = argument2
var xScale = argument3
var yScale = argument4
var angle = argument5
var textColor = argument6
var outlineColor = argument7
var dropShadowOnly = argument8

//
// Draw the outline or the drop shadow.
//
draw_set_color(outlineColor)

if (dropShadowOnly) {
	draw_text_transformed((textX + 1), textY, text, xScale, yScale, angle);
  draw_text_transformed((textX + 1), (textY + 1), text, xScale, yScale, angle);
  draw_text_transformed(textX, (textY + 1), text, xScale, yScale, angle);
} else {
	draw_text_transformed((textX - 1), textY, text, xScale, yScale, angle);
	draw_text_transformed((textX - 1), (textY - 1), text, xScale, yScale, angle);
	draw_text_transformed(textX, (textY - 1), text, xScale, yScale, angle);
	draw_text_transformed((textX + 1), (textY - 1), text, xScale, yScale, angle);
	draw_text_transformed((textX + 1), textY, text, xScale, yScale, angle);
	draw_text_transformed((textX + 1), (textY + 1), text, xScale, yScale, angle);
	draw_text_transformed((textX + 1), textY, text, xScale, yScale, angle);
	draw_text_transformed((textX - 1), (textY - 1), text, xScale, yScale, angle);
}

//
// Draw the text.
//
draw_set_color(textColor)
draw_text_transformed(textX, textY, text, xScale, yScale, angle);
