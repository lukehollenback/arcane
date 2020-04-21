//
// Obtain the current size of the window.
//
// NOTE: Remember that the Draw GUI event allows us to draw based on the window size, without any
//  concern for the view size or scale.
//
var windowWidth  = window_get_width();
var windowHeight = window_get_height();

//
// Calculate the position of the "login" button.
//
loginButtonX1 = ((windowWidth / 2) - (loginButtonWidth / 2));
loginButtonY1 = ((windowHeight / 2) - (loginButtonHeight / 2));
loginButtonX2 = (loginButtonX1 + loginButtonWidth);
loginButtonY2 = (loginButtonY1 + loginButtonHeight);