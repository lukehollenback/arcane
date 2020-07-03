///
/// @description Publish Synchronized Variables – This event must be manually invoked at least
///  once before regular synchronization will be begin at the configured publishInterval (because
///  this event primes the alarm).
///

//
// Perform pre-publish processing.
//
event_user(14);

//
// Create and send the synchronization message.
//
var msg = msg_objsync_create(self);

tcp_send_msg(msg);

//
// Schedule next publish interval.
//
// NOTE ~> The publishInterval is defined as the number of seconds between regular synchronized
//  variable and state publishing.
//
alarm_set(11, (publishInterval * fps))