///
/// @desc                       Converts a color classification (e.g. from a chat message) into an
///                             actual usable color.
/// @param  {string} colorClass The message classification to obtain a color for.
/// @return {number}            The color associated with the provided classification string.
///
function color_from_classification(colorClass) {

	switch colorClass {
		case "default":
			return cc_white
	
		case "moderator":
			return cc_teal
	
		case "server":
			return cc_red
	
		case "game":
			return cc_yellow
	
		case "system":
			return cc_gray
	
		default:
			return cc_white
	}

}
