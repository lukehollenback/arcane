///
/// @description Registers all message handler scripts. Intended to be called at game initialization time.
///

global.msgHandlers = ds_map_create()
global.msgHandlersAuthReqs = ds_map_create()

msg_register("Auth", msg_auth_handle, false)
msg_register("Chat", msg_chat_handle, false)
msg_register("Disc", msg_disc_handle, false)