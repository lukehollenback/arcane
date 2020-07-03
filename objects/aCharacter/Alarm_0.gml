///
/// @description Run Animations
///

//
// Move to the next frame in the animation.
//
if (isMoving) {
	animFrameIndex++

	if (animFrameIndex > (animFrameCount - 1)) {
		animFrameIndex = 0
	}
} else {
	animFrameIndex = 0
}

//
// Reset this alarm.
//
alarm_set(0, animSpeed)