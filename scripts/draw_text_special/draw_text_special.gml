///
/// @description Draws text with interpolated images registered into the global icon lookup table.
///
/// @param              x {number}  The x coordinate to draw the text at.
/// @param              y {number}  The y coordinate to draw the text at.
/// @param            txt {string}  The text to draw (optionally w/interpolated images).
/// @param skipFirstSpace {boolean} (Optional) Whether or not to skip the preceeding space on
///  interpolated image. Defaults to true.
///

var xx = argument[0]
var yy = argument[1]
var txt = argument[2]
var skipFirstSpace = false

if (argument_count > 3) {
	skipFirstSpace = argument[3]	
}

//
// Initialize some variables that will be re-used in the loop below.
//
var spaceWidth = string_width(" ")
var txtRem = txt
var imgFound = string_pos_ext(global.iconLookupTableKeys, txtRem)
var imgStart = imgFound[0]
var imgKey = imgFound[1]

//
// Parse out all of the images specified in the loop below.
//
while (imgStart != 0) {
	var txtRemLen = string_length(txtRem)
	
	//
	// Draw the text before the image, and the image itself.
	//
	var imgIndex = global.iconLookupTable[? imgKey]
	var imgEnd = (imgStart + string_length(imgKey))
	var imgWidth = sprite_get_width(imgIndex)
	var preImgTxt = string_copy(txtRem, 1, (imgStart - 1))
	var imgX = (xx + string_width(preImgTxt))
	
	if (!skipFirstSpace) {
		imgX += spaceWidth	
	}

	draw_text(xx, yy, preImgTxt)
	draw_sprite(imgIndex, 0, imgX, yy)
	
	//
	// Figure out what is supposed to come after the image.
	//
	txtRem = string_copy(txtRem, imgEnd, txtRemLen)
	xx = (imgX + imgWidth + spaceWidth)
	
	//
	// Determine if there is another image that needs to be drawn.
	//
	imgFound = string_pos_ext(global.iconLookupTableKeys, txtRem)
	imgStart = imgFound[0]
	imgKey = imgFound[1]
}
	
//
// Draw the final piece of the text.
//
draw_text(xx, yy, txtRem)