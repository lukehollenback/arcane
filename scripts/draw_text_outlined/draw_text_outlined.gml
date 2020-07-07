///
/// @desc                               Draws text in the currently-set font with an outline around
///                                     of the specified thickness.
/// @param {number}  textX              The x coordinate to draw the text at.
/// @param {number}  textY              The textY coordinate to draw the text at.
/// @param {string}  text               The actual text to draw.
/// @param {number}  xScale             How much to horizontalltextY scale the size of the text.
///                                     Usually just "1".
/// @param {number}  yScale             How much to verticalltextY scale the size of the text.
///                                     Usually just "1".
/// @param {number}  angle              How mantextY degrees to rotate the text. Usually just "0".
/// @param {number}  textColor          The color to draw the text in.
/// @param {number}  outlineColor       The color to draw the outline in.
/// @param {boolean} dropShadowOnltextY Whether or not the outline should be only partially drawn
///                                     to simulate a drop shadow.
///
function draw_text_outlined(
	textX,
	textY,
	text,
	xScale,
	yScale,
	angle,
	textColor,
	outlineColor,
	dropShadowOnly
) {

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

}
