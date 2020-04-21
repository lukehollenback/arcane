//
// Obtain the current size of the window.
//
// NOTE: Remember that the Draw GUI event allows us to draw based on the window size, without any
//  concern for the view size or scale.
//
var windowWidth  = window_get_width();
var windowHeight = window_get_height();

//
// Calculate the location of the chat module based on the current window size.
//
var chatX = moduleMargin;
var chatY = (windowHeight - moduleMargin - chatHeight - chatMessageHeight - modulePadding);
var chatContentX = (chatX + 4);
var chatContentY = (chatY + 4);

var chatMessageX = moduleMargin;
var chatMessageY = (windowHeight - moduleMargin - chatMessageHeight);
var chatMessageContentX = (chatMessageX + 4)
var chatMessageContentY = (chatMessageY + 4)

//
// Figure out if the mouse is hovering over the upper area of the screen (likely indicating that
// the user is trying to interact with the HUD.)
//
var darkenInterface = false;
var modulesUpperBound = ((moduleMargin * 2) + quickStatsHeight);
var modulesLowerBound = (chatY - moduleMargin);

if (window_mouse_get_y() <= modulesUpperBound || window_mouse_get_y() >= modulesLowerBound) {
	darkenInterface = true;
}

//
// Set the draw opacity.
//
var originalAlpha = draw_get_alpha();

if (darkenInterface || chatMessageActivated) {
	draw_set_alpha(alpha_strong);
} else {
	draw_set_alpha(alpha_weak);
}

//
// Set the draw font.
//
draw_set_font(fNovember);

//
// Draw the quick-stats module.
//
draw_roundrect_color(quickStatsX, quickStatsY, (quickStatsX + quickStatsWidth), (quickStatsY + quickStatsHeight), cc_black, cc_black, false);

draw_sprite(sCharacterAvatarBase, 0, quickStatsContentX, quickStatsContentY);

draw_set_color(cc_white);
draw_set_halign(fa_center);
draw_text_transformed((quickStatsContentX + (sprite_get_width(sCharacterAvatarBase) / 2)), (quickStatsContentY + modulePadding + sprite_get_height(sCharacterAvatarBase)), "Lvl 34", 1, 1, 0);
draw_set_halign(fa_left);

//
// Draw the chat module.
//
draw_roundrect_color(chatX, chatY, (chatX + chatWidth), (chatY + chatHeight), cc_black, cc_black, false);

var i;
for (i = 0; i < ds_list_size(chatLines); i++) {
	var message = ds_list_find_value(chatLines, i);
	var color = ds_list_find_value(chatLineColors, i);
	
	draw_set_color(color);
	draw_text_transformed(chatContentX, (chatContentY + (i * chatLineHeight)), message, 1, 1, 0);
}

//
// Draw the chat entry module.
//
var chatMessageLength = string_length(chatMessage);
var chatMessageTail = string_copy(chatMessage, (chatMessageLength - chatLineCharacterLimit + 1), chatLineCharacterLimit);


draw_roundrect_color(chatMessageX, chatMessageY, (chatMessageX + chatWidth), (chatMessageY + chatMessageHeight), cc_black, cc_black, false);

draw_set_color(cc_white);
draw_text_transformed(chatMessageContentX, chatMessageContentY, chatMessageTail, 1, 1, 0);

//
// Draw the heart and mana indicators.
//
var i;

for (i = 0; i < 10; i++) {
	draw_sprite(sHeartIcon, 0, (heartLevelX + ((moduleMargin + modulePadding) * i)), heartLevelY);
	
}

for (i = 0; i < 7; i++) {
	draw_sprite(sManaIcon, 0, (manaLevelX + ((moduleMargin + modulePadding) * i)), manaLevelY);
}

//
// Reset the draw opacity.
//
draw_set_alpha(originalAlpha)