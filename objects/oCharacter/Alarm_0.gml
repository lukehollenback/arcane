//
// Move to the next frame in the animation.
//
if (speed > 0) {
	animFrameIndex++;

	if (animFrameIndex > (animFrameCount - 1)) {
		animFrameIndex = 0;
	}
} else {
	animFrameIndex = 0;
}

//
// Reset this alarm.
//
alarm_set(0, animSpeed);