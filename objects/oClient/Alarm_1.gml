///
/// @description Ping the Server
///

//
// Ping the server.
//
var now = (date_current_epoch_seconds() * 1000)
var msg = msg_ping_create(now)

lastTxPingMicros = get_timer()

tcp_send_msg(msg)

//
// Schedule the next ping.
//
alarm_set(1, (30 * fps))