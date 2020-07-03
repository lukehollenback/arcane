///
/// @description Handles "Disc"-type messages.
///
/// @param msg {number} The index of the map representing the full decoded message.
///

var msgData = argument0[? "Data"]

show_debug_message("The server forced disconnection. (Reason: " + msgData[?"Reason"] + ")")
			
oClient.state = ClientStates.DISC
			
room_goto(rLogin)