sprite_change_offset("idle", 72, 94);
sprite_change_offset("run", 72, 94);
sprite_change_offset("taunt", 72, 94);
sprite_change_offset("wait", 72, 94);
sprite_change_offset("ledge", 72, 94);
sprite_change_offset("turn", 72, 94);

pet_w = 36;			// Default: 36 (The buddy's width)
run_speed = 0;		// Default: 3
max_run_dist = 3000;// Default: 100 (The buddy will follow the player once their distance exceeds this value)


//Console Variables


debug = true;

win_data = [];
active_win = [];

cursor_sprite_i = sprite_get("cursor");
cursor_index = 0;
cursor_visible = true; //Change to true for debug
mb_l_click = false;
mouse_x_i = mouse_x;
mouse_y_i = mouse_y;



//Window Variables

mouse_buffer = 16;
cursor_x_p = 0;
cursor_y_p = 0;
cursor_x = mouse_x - view_get_xview();
cursor_y = mouse_y - view_get_yview();
cursor_drag_offset_x = [];
cursor_drag_offset_y = [];
win_drag = -1;
win_active = -1;
active_thick = 4;

debug_selected = [];
debug_player = noone;
cmd_toggle = false;
cmd_lucid = true; //True for debug purposes, controls whether debug stuff is enabled
cmd_x = 816;
cmd_y = 120;
cmd_w = 280;
// cmd_h = 176;
cmd_h = 416;

cmd_char = '>';
cmd_output = "Type 'help' for command list.
"; //Parsed string for storing command log
cmd_save_output = false; // If the output is saved, or overwritten with every command (VERY LAGGY)
cmd_title = "LUCID DREAM v0.7.1";
cmd_freecam = false;
lucid_obj = self;

select_leniency = 10;
edit_side = 4;
node_select = DIR_NONE;
update_select = true;

old_value_temp = 0;
click_x = 0;
click_y = 0;
sup_out = false;
state_cur = 0;

attack_edit = noone;
attack_edit_init = 0;
attack_edit_player = noone;
attack_index_start = 30;
attack_index_end = 0;

freeze_frame = noone;
freeze_window = 0;

a_length = 80;


//Window Init
win_call = 1;
user_event(2);
player_count = 0;
with oPlayer {
    other.player_count++;
    down_held = 0;
    up_held = 0;
    left_held = 0;
    right_held = 0;
    taunt_held = 0;
    attack_held = 0;
    special_held = 0;
    god = false;
    freeze = false;
    state_array = [];
    hitbox_array = [];
    hurtbox_array = [];
    article1_array = [];
    article2_array = [];
    article3_array = [];
    articlep_array = [];
    articles_array = [];
    freeze_x = x;
	freeze_y = y;
	lucid_obj = other;
    
}

print("You can access the console using the ` key (right above the tab key, next to 1)");

excluded_vars = ["dodge_sound","perfect_dodge_sound",
"roll_forward_active_time","roll_forward_startup_time","roll_forward_recovery_time", "roll_sound",
"roll_back_active_time","roll_back_startup_time","roll_back_recovery_time",
"air_dodge_startup_time","air_dodge_active_time","air_dodge_recovery_time",
"dodge_startup_time","dodge_active_time","dodge_recovery_time",
"techroll_start_frame","techroll_startup_time","techroll_active_time","techroll_recovery_time",
"tech_active_time","tech_recovery_time",
"death_sound",
"char_width",
"width",
"plat_spr"];

//Banned keywords: _active_time, _startup_time, _recovery_time
keyword_ban = ["_active_time","_startup_time","recovery_time",
"dodge_sound","perfect_dodge_sound", "roll_sound",
"techroll_start_frame",
"death_sound",
"char_width",
"width",
"plat_spr"];

