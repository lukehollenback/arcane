///
/// @desc                          Constructs a Ping-type message.
/// @param {number} sentTimeMillis A unix epoch timestamp (in milliseconds) of the ping
///  transimssion time that the constructed message should hold.
///
function PingMsg(sentTimeMillis) constructor {
	
	SentTime = sentTimeMillis;
	
	static Handle = function() {
		// NOTE: Unfortunately, GameMaker cannot actually provide a millisecond timestamp, so we
		//  cannot calculate accurate pings off of the timestamps sent to and received from the
		//  server. However, we do use other tricks to calculate the roundtrip latency when we send
		//  a ping and subsequently receive a pong back.
	
		oClient.lastRxPingMicros = get_timer()
		oClient.currentLatencyRountripMicros = (oClient.lastRxPingMicros - oClient.lastTxPingMicros)
	}
	
	static Pack = function() {
		return new Msg("Ping", self)
	}
	
}

//
// Ensure that the Message Service is initialized and then register the above-defined message type
// with the service.
//
MsgSvc_Init()

global.MsgSvc.Register(
	new MsgType(
		"Ping",
		function(data) {
			var struct = new PingMsg()
	
			struct_coerce(data, struct)
	
			return struct
		},
		false
	)
)