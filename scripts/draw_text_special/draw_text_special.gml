///
/// @desc                            Draws text with interpolated images registered into the global
///                                  icon lookup table.
/// @param {number}  xx              The x coordinate to draw the text at.
/// @param {number}  yy              The y coordinate to draw the text at.
/// @param {string}  text            The text to draw (optionally w/interpolated images).
/// @param {boolean} _skipFirstSpace (Optional) Whether or not to skip the preceeding space on
///                                  interpolated image. Defaults to false.
/// @param {boolean} _skipLastSpace  (Optional) Whether or not to skip the succeeding space on
///                                  interpolated image. Defaults to false.
///
function draw_text_special(xx, yy, text, _skipFirstSpace, _skipLastSpace) {
	
	var skipFirstSpace = is_undefined(_skipFirstSpace) ? false : _skipFirstSpace
	var skipLastSpace = is_undefined(_skipLastSpace) ? false : _skipLastSpace

	//
	// Initialize some variables that will be re-used in the loop below.
	//
	var spaceWidth = string_width(" ")
	var txtRem = text
	var imgFound = string_pos_many(global.iconLookupTableKeys, txtRem)
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
		xx = (imgX + imgWidth)
		
		if (!skipLastSpace) {
			xx += spaceWidth	
		}
	
		//
		// Determine if there is another image that needs to be drawn.
		//
		imgFound = string_pos_many(global.iconLookupTableKeys, txtRem)
		imgStart = imgFound[0]
		imgKey = imgFound[1]
	}
	
	//
	// Draw the final piece of the text.
	//
	draw_text(xx, yy, txtRem)


}
