///
/// @description Instantiates global variables.
///

//
// Instantiate global variables to default values.
//
global.debugMode = false;

//
// Instantiate the global icon lookup table.
//
draw_text_special_init()

//
// Output one-liner that can be used to start a second instance of the game to the console.
//
show_debug_message("Second instance command ~>")
show_debug_message(
	"\topen -n -a ${GMS2_RUNTIME} --args " +
	parameter_string(0) +
	" " + parameter_string(1)
)