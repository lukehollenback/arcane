///
/// @description Ping the Server
///

//
// Ping the server.
//
var now = (date_current_epoch_seconds() * 1000)
var msg = new PingMsg(now)

lastTxPingMicros = get_timer()

Send(msg.Pack())

//
// Schedule the next ping.
//
alarm_set(1, (30 * fps))