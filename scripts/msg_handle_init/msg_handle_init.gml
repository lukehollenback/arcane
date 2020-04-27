///
/// @description Registers all message handler scripts. Intended to be called at game initialization time.
///

global.msgHandlers = ds_map_create()

global.msgHandlers[? "Chat"] = "msg_chat_handle"