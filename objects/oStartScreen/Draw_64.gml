//
// Set the font and the opacity (these will remain the same for the whole start screen).
//
var originalAlpha = draw_get_alpha();

draw_set_alpha(alpha_strong);
draw_set_font(fNovember);

//
// Draw the "login" button.
//
draw_set_color(cc_black);
draw_roundrect(loginButtonX1, loginButtonY1, loginButtonX2, loginButtonY2, false);

if (mouse_position_check(loginButtonX1, loginButtonY1, loginButtonX2, loginButtonY2)) {
	draw_set_color(cc_red);
} else {
	draw_set_color(cc_white);
}


draw_set_halign(fa_middle);
draw_text(loginButtonX1 + (loginButtonWidth / 2), (loginButtonY1 + 4), "Login");
draw_set_halign(fa_left);

//
// Reset the opacity.
//
draw_set_alpha(originalAlpha);