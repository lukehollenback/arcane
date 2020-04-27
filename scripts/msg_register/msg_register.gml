///
/// @description Adds the provided message handler script and its properties to the associated
///  lookup tables.
///
/// @param msgType {string} The key of the message that indicates that the provided handler
///  should be used.
/// @param script {number} The ID of the script that should be registered to handle the message
///  type.
/// @param requiresAuth {bool} Whether or not the message can only be handled once authentication
///  has successfully occurred.
///

global.msgHandlers[? argument0] = argument1
global.msgHandlersAuthReqs[? argument0] = argument2

show_debug_message("Registered handler for \"" + argument0 + "\"-type messages.")