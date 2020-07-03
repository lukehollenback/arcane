///
/// @description Handles "Ping"-type messages. Unfortunately, GameMaker cannot actually provide a
///  millisecond timestamp, so we cannot calculate accurate pings off of the timestamps sent to and
///  received from the server. However, we do use other tricks to calculate the roundtrip latency
///  when we send a ping and subsequently receive a pong back.
///

oClient.lastRxPingMicros = get_timer()
oClient.currentLatencyRountripMicros = (oClient.lastRxPingMicros - oClient.lastTxPingMicros)