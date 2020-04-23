/// @description Converts a color classification (e.g. from a chat message) into an actual usable
///  color.

var colorClass = argument0

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