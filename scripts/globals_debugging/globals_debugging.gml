///
/// @description Instantiates global variables related to debugging.
///

//
// Instantiate global variables to default values.
//
global.debugMode = true;

//
// Instantiate the global icon lookup table.
//
draw_text_special_init()

//
// Output one-liner that can be used to start a second instance of the game to the console.
//
var openShellCmd = "open -n -a ${GMS2_BETA_RUNTIME} --args " + parameter_string(0) + " " + parameter_string(1)

show_debug_message("Open Another Instance Command ↝ " + openShellCmd)
clipboard_set_text(openShellCmd)
show_debug_message("Copied to clipboard!")