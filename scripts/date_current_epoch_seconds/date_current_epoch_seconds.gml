///
/// @desc            Generates a Unix Epoch-style timestamp for the current instant in time.
/// @return {number} The number of seconds that the current instant in time is from the Unix Epoch.
///
function date_current_epoch_seconds() {

	var unixEpoch = date_create_datetime(1970, 1, 1, 0, 0, 0)
	var now = date_current_datetime()

	return date_second_span(unixEpoch, now)

}
