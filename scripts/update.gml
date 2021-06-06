
//Biggest Brain DrawHUD Script
// x = view_get_xview();
// y = view_get_yview();
depth = -20;
with oPlayer {
	if down_down down_held++;
	else down_held = 0;
	if up_down up_held++;
	else up_held = 0;
	if left_down left_held++;
	else left_held = 0;
	if right_down right_held++;
	else right_held = 0;
	if taunt_down taunt_held++;
	else taunt_held = 0;
	if attack_down attack_held++;
	else attack_held = 0;
	if special_down special_held++;
	else special_held = 0;
	if god {
		invincible = true;
		invince_time = 2;
	}
	// if freeze state = PS_SPAWN;
	if freeze {
		x = freeze_x;
		y = freeze_y;
        hitstop = 2;
        hitpause = true;
        clear_button_buffer(PC_LEFT_HARD_PRESSED);
		clear_button_buffer(PC_RIGHT_HARD_PRESSED);
		clear_button_buffer(PC_UP_HARD_PRESSED);
		clear_button_buffer(PC_DOWN_HARD_PRESSED);
		clear_button_buffer(PC_LEFT_STRONG_PRESSED);
		clear_button_buffer(PC_RIGHT_STRONG_PRESSED);
		clear_button_buffer(PC_UP_STRONG_PRESSED);
		clear_button_buffer(PC_DOWN_STRONG_PRESSED);
		clear_button_buffer(PC_LEFT_STICK_PRESSED);
		clear_button_buffer(PC_RIGHT_STICK_PRESSED);
		clear_button_buffer(PC_UP_STICK_PRESSED);
		clear_button_buffer(PC_DOWN_STICK_PRESSED);
	}
}

if string_count("`",keyboard_string) { //Toggle Debug View
	cmd_toggle = !cmd_toggle;
	if cmd_toggle {
		keyboard_string = "";
		array_push(active_win,[[cmd_x-view_get_xview(),cmd_y-view_get_yview(),noone,0],array_clone_deep(win_data[0])]);
		win_active = array_length_1d(active_win)-1;
		active_win[@win_active][@1][@3][@1] = cmd_output;
	}
}
win_call = 2;
user_event(2);

#define array_clone_deep(_array)
var _array_d_clone = [];
for(var _i = 0;_i < array_length_1d(_array);_i++) {
	if array_length_1d(_array[_i]) > 0 array_push(_array_d_clone,array_clone_deep(_array[_i]));
	else array_push(_array_d_clone,_array[_i]);
}
return _array_d_clone;