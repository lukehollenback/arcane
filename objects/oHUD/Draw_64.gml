scribble_draw(128, 128, "Hello [b]okay![/b].")

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
var chatX = margin;
var chatY = (windowHeight - margin - chatHeight - chatMessageHeight - padding);
var chatContentX = (chatX + 4);
var chatContentY = (chatY + 4);

var chatMessageX = margin;
var chatMessageY = (windowHeight - margin - chatMessageHeight);
var chatMessageContentX = (chatMessageX + 4)
var chatMessageContentY = (chatMessageY + 4)

//
// Figure out if the mouse is hovering over the upper area of the screen (likely indicating that
// the user is trying to interact with the HUD.)
//
var darkenInterface = false;
var modulesUpperBound = ((margin * 2) + quickStatsHeight);
var modulesLowerBound = (chatY - margin);

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
draw_text_transformed((quickStatsContentX + (sprite_get_width(sCharacterAvatarBase) / 2)), (quickStatsContentY + padding + sprite_get_height(sCharacterAvatarBase)), "Lvl 34", 1, 1, 0);
draw_set_halign(fa_left);

//
// Draw the debug info module (if turned on).
//
if (global.debugMode) {
	draw_set_color(cc_black);
	draw_text_outlined(chatX, (chatY - padding - lineHeight), ("FPS: " + string(fps)), 1, 1, 0, cc_white, cc_black, true);
	draw_text_outlined(chatX, (chatY - padding - (2 * lineHeight)), ("FPS (real): " + string(fps_real)), 1, 1, 0, cc_white, cc_black, true);
	draw_text_outlined(chatX, (chatY - padding - (3 * lineHeight)), ("Delta Time (microseconds): " + string(delta_time)), 1, 1, 0, cc_white, cc_black, true);
	draw_text_outlined(chatX, (chatY - padding - (4 * lineHeight)), ("Delta Ratio: " + string(dt_ratio)), 1, 1, 0, cc_white, cc_black, true);
	draw_text_outlined(chatX, (chatY - padding - (5 * lineHeight)), ("Speed (pixels/frame): " + string(speed_pixels)), 1, 1, 0, cc_white, cc_black, true);
	draw_text_outlined(chatX, (chatY - padding - (6 * lineHeight)), ("Latency (roundtrip) (microseconds): " + string(oClient.currentLatencyRountripMicros)), 1, 1, 0, cc_white, cc_black, true);
}

//
// Draw the info module.
//
draw_roundrect_color((windowWidth - margin - 256), chatY, (windowWidth - margin), (windowHeight - margin), cc_black, cc_black, false);

if (currentInfoModule == InfoModules.ATTRIBUTES) {
	draw_text_outlined((windowWidth - margin - 256 + padding), (chatY - lineHeight), "Attributes", 1, 1, 0, cc_white, cc_black, true);

	draw_set_color(cc_white)

	draw_set_halign(fa_left)
	draw_text_special((windowWidth - margin - 256 + padding), (chatY + padding), " :strength: Strength", true)
	draw_set_halign(fa_right)
	draw_text((windowWidth - margin - padding), (chatY + padding), "12")

	draw_set_halign(fa_left)
	draw_text_special((windowWidth - margin - 256 + padding), (chatY + padding + lineHeight), " :heart: Constitution", true)
	draw_set_halign(fa_right)
	draw_text((windowWidth - margin - padding), (chatY + padding + lineHeight), "6")

	draw_set_halign(fa_left)
	draw_text_special((windowWidth - margin - 256 + padding), (chatY + padding + (2 * lineHeight)), " :dexterity: Dexterity", true)
	draw_set_halign(fa_right)
	draw_text((windowWidth - margin - padding), (chatY + padding + (2 * lineHeight)), "36")

	draw_set_halign(fa_left)
	draw_text_special((windowWidth - margin - 256 + padding), (chatY + padding + (3 * lineHeight)), " :intelligence: Intelligence", true)
	draw_set_halign(fa_right)
	draw_text((windowWidth - margin - padding), (chatY + padding + (3 * lineHeight)), "24")

	draw_set_halign(fa_left)
	draw_text_special((windowWidth - margin - 256 + padding), (chatY + padding + (4 * lineHeight)), " :wisdom: Wisdom", true)
	draw_set_halign(fa_right)
	draw_text((windowWidth - margin - padding), (chatY + padding + (4 * lineHeight)), "1")

	draw_set_halign(fa_left)
	draw_text_special((windowWidth - margin - 256 + padding), (chatY + padding + (5 * lineHeight)), " :charisma: Charisma", true)
	draw_set_halign(fa_right)
	draw_text((windowWidth - margin - padding), (chatY + padding + (5 * lineHeight)), "1")

	draw_set_halign(fa_left)
	draw_text_special((windowWidth - margin - 256 + padding), (chatY + (4 * padding) + (6 * lineHeight)), " :luck: Daily Luck", true)
	draw_set_halign(fa_right)
	draw_text((windowWidth - margin - padding), (chatY + (4 * padding) + (6 * lineHeight)), "60")

	draw_set_halign(fa_left)
} if (currentInfoModule == InfoModules.SKILLS) {
	draw_text_outlined((windowWidth - margin - 256 + padding), (chatY - lineHeight), "Skills", 1, 1, 0, cc_white, cc_black, true);
} if (currentInfoModule == InfoModules.INVENTORY) {
	draw_text_outlined((windowWidth - margin - 256 + padding), (chatY - lineHeight), "Inventory", 1, 1, 0, cc_white, cc_black, true);
} if (currentInfoModule == InfoModules.QUESTS) {
	draw_text_outlined((windowWidth - margin - 256 + padding), (chatY - lineHeight), "Quests", 1, 1, 0, cc_white, cc_black, true);
}

//
// Draw the chat module.
//
draw_roundrect_color(chatX, chatY, (chatX + chatWidth), (chatY + chatHeight), cc_black, cc_black, false);

var i;
for (i = 0; i < ds_list_size(chatLines); i++) {
	var message = ds_list_find_value(chatLines, i);
	var color = ds_list_find_value(chatLineColors, i);
	
	draw_set_color(color);
	draw_text_special(chatContentX, (chatContentY + (i * lineHeight)), message);
}

//
// Draw the chat entry module.
//
var chatMessageLength = string_length(chatMessage);
var chatMessageTail = string_copy(chatMessage, (chatMessageLength - chatLineCharacterLimit + 1), chatLineCharacterLimit);

draw_roundrect_color(chatMessageX, chatMessageY, (chatMessageX + chatWidth), (chatMessageY + chatMessageHeight), cc_black, cc_black, false);

draw_set_color(cc_white);
draw_text_special(chatMessageContentX, chatMessageContentY, chatMessageTail);

//
// Draw the heart and mana indicators.
//
var i;

for (i = 0; i < 10; i++) {
	draw_sprite(sHeartIcon, 0, (heartLevelX + ((margin + padding) * i)), heartLevelY);
	draw_sprite(sHeartIcon, 1, (heartLevelX + ((margin + padding) * i)), heartLevelY);
}

for (i = 0; i < 7; i++) {
	draw_sprite(sManaIcon, 0, (manaLevelX + ((margin + padding) * i)), manaLevelY);
	draw_sprite(sManaIcon, 1, (manaLevelX + ((margin + padding) * i)), manaLevelY);
}

//
// Reset the draw opacity.
//
draw_set_alpha(originalAlpha)