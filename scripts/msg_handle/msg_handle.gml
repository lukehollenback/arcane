///
/// @description Invokes the appropriate handler for the provided message.
///
/// @param msg {number} The index of the map representing the full decoded message.
///

var msgKey = argument0[? "Key"]
var reqAuth = global.msgHandlersAuthReqs[? msgKey]
var isAuthed = (oClient.state == ClientStates.READY)

if !reqAuth || (reqAuth && isAuthed) {
	script_execute(global.msgHandlers[? msgKey], argument0)
} else {
	show_debug_message(
		"Refusing to handle message of type \"" + msgKey + "\" as it requires authentication, which " +
			"has not yet occurred."
	)
}