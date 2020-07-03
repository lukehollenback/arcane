///
/// @description Execute Publish After Step (if necessary)
///

//
// If any synced variables were updated, publish a synchronization message.
//
if (publishAfterStep) {
	event_user(15)
	
	publishAfterStep = false
}