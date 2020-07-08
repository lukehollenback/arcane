///
/// @desc Registers custom macros for calculating things like movement speed. Most assume that FPS
///       does not change.
///

#macro grid_size 32
#macro dt_ratio (delta_time / 1000000)
#macro speed_pixels (grid_size * dt_ratio)