//Window API Data & Draw - By Archytas
/*
Font Types
medFont
fName
roundFont
roaMBLFont
roaLBLFont
tinyFont
*/
enum WIN {
	DEBUG,
	SUBMENU,
	STAT,
	DIALOG_DEFAULT,
	AREATITLE,
	AREAFADE,
	ARCHY_DIALOG,
	POINTOUT,
	QUESTLIST,
	
}

enum GUI {
	SPRITE,
	TEXTBOX,
	DIALOGBOX,
	BUTTON,
	VARCONT,
	SCROLLBOX,
	DIALOGBOX_TRIM,
	LISTBOX,
	EXIT
}

enum SM {
	PROP,
	ADD,
	DEL,
	EXPORT,
	SAVE,
	LOAD,
}

if win_call == 0 { //Draw HUD
	if mouse_x_i != mouse_x || mouse_y_i != mouse_y cursor_visible = true;
	if cursor_visible do_cursor();
	draw_windows(); //Draw Objects
	if cursor_visible {
		if mb_l_click draw_sprite_ext(cursor_sprite_i, cursor_index, cursor_x, cursor_y, 1, 1, 0, c_gray, 1); //Draw cursor over everything
		else draw_sprite_ext(cursor_sprite_i, cursor_index, cursor_x, cursor_y, 1, 1, 0, c_white, 1); //Draw cursor over everything
		logic_cursor();
	}
	if attack_edit != noone { //Attack edit code
		draw_debug_text(attack_edit_player.x,attack_edit_player.y,string(attack_edit_player.window));
		draw_debug_text(attack_edit_player.x,attack_edit_player.y+32,string(attack_edit_player.window_timer));
	}
	exit;
}

if win_call == 1 { //Load Data
	var _i = 0;
	// var _string ="";
	// win_add(i++,[WIN.DEBUG,
	// 	new_varcont([_string,0,0,0,0,0]),
	// 	new_sprite(sprite_get("gui_test"),0,0),
	// 	new_textbox("GUI 2.0 TITLE",4,2,200,16,c_white,asset_get("fName")),
	// 	//new_dialogbox("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",asset_get("mfx_back"),"_",0.4,4,16,200,12,c_white,asset_get("fName"))
	// 	//new_textbox("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",4,18,238,12,c_white,asset_get("fName")),
	// 	new_scrollbox("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",4,18,238,64,16,c_white,asset_get("fName")),
	// 	new_dialogbox(_string,noone,"_",0.4,4,100,238,12,c_white,asset_get("fName"))
	// ]);
	var _string = cmd_output;
	// var _string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
	var _w = cmd_w;
	var _h = cmd_h;
	var _sep = 16;
	var _cmd_char = cmd_char;
	win_add(_i++,[WIN.DEBUG, //0
		new_varcont(["",_string,_w,_h,_sep,_cmd_char]),
		new_sprite(sprite_get("gui_lucid"),0,-1),
		new_scrollbox(_string,8,18,_w,_h,_sep,c_white,asset_get("fName")),
		new_dialogbox(_cmd_char,noone,"_",0.4,4,cmd_h,cmd_w,_sep,c_white,asset_get("fName")),
		new_textbox(cmd_title,8,2,200,16,c_white,asset_get("fName")),
	]);
	var _l = 0;
	var _space = 32;
	win_add(_i++,[WIN.SUBMENU, //1, HitBox submenu
	 	new_varcont([0]),
	 	new_button(SM.EXPORT,sprite_get("submenu"),0,(_l++)*_space,"Export"),
	 	new_button(SM.DEL,sprite_get("submenu"),0,(_l++)*_space,"Delete"),
	]);
	var _l = 0;
	win_add(_i++,[WIN.SUBMENU, //2, Player/Other submenu
	 	new_varcont([0]),
	 	new_button(SM.SAVE,sprite_get("submenu"),0,(_l++)*_space, "Save.."),
	 	new_button(SM.LOAD,sprite_get("submenu"),0,(_l++)*_space, "Load.."),
	 	new_button(SM.ADD,sprite_get("submenu"),0,(_l++)*_space, "New.."),
	]);
	var _l = 0;
	win_add(_i++,[WIN.SUBMENU, //3, Player/Other submenu
	 	new_varcont([0]),
	 	new_button(SM.SAVE,sprite_get("submenu"),0,(_l++)*_space, "Save.."),
	 	new_button(SM.LOAD,sprite_get("submenu"),0,(_l++)*_space, "Load.."),
	]);
	var _str = "DEFAULT \n DEFAULT2";
	win_add(_i++,[WIN.STAT, //4, Properties/Stat box
		new_varcont([]),
		new_sprite(sprite_get("gui_lucid"),0,-1),
		new_textbox(_str,8,2,200,16,c_white,asset_get("fName")),
	]);
	
	// win_add(i++,[WIN.AREATITLE, //1
	// 	new_sprite(sprite_get("area_title"),0,0),
	// 	new_textbox("TITLE_NAME",0,0,200,16,c_white,asset_get("roaLBLFont"))
	// ]);
	
	// win_add(i++,[WIN.AREAFADE, //2
	// 	new_sprite(sprite_get("area_title"),4,12),
	// 	new_textbox("TITLE_NAME",2,2,700,32,c_black,asset_get("roaLBLFont")),
	// 	new_varcont([0,0,0,0,0]),
	// 	new_textbox("TITLE_NAME",0,0,700,32,c_white,asset_get("roaLBLFont")),
	// ]);
	// var _pos = [32,26];
	// var _string ="Test";
	// var _sound = asset_get("sfx_may_arc_talk");
	// var _w = 176;
	// win_add(i++,[WIN.ARCHY_DIALOG, //3
	// 	new_varcont([_string,120,0,0,0,0]),
	// 	new_sprite(sprite_get("archy_dialog"),0,16),
	// 	new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1]+2,_w,16,c_black,asset_get("fName")),
	// 	new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1]-2,_w,16,c_black,asset_get("fName")),
	// 	new_dialogbox(_string,_sound,"_",0.4,_pos[0]-2,_pos[1],_w,16,c_black,asset_get("fName")),
	// 	new_dialogbox(_string,_sound,"_",0.4,_pos[0]+2,_pos[1],_w,16,c_black,asset_get("fName")),
	// 	new_dialogbox(_string,_sound,"_",0.4,_pos[0]-2,_pos[1]+2,_w,16,c_black,asset_get("fName")),
	// 	new_dialogbox(_string,_sound,"_",0.4,_pos[0]+2,_pos[1]-2,_w,16,c_black,asset_get("fName")),
	// 	new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1],_w,16,$d252ff,asset_get("fName")) //$ff00ff $ea00ea $d252ff
	// ]);
	// var _string ="Test";
	// //var _sound = asset_get("sfx_propeller_dagger_loop");
	// var _sound = asset_get("sfx_shop_move");
	// var _w = 400;
	// win_add(i++,[WIN.POINTOUT, //4
	// 	new_varcont([_string,120,0,0,0,0]),
	// 	new_trim_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1],_w,16,c_white,asset_get("roaLBLFont")) //$ff00ff $ea00ea $d252ff
	// ]);
	
	// win_add(i++,[WIN.QUESTLIST, //5 //Expansive Custom Window, Shows Quest List
	// 	new_varcont([1,16,300,42,sprite_get("Quest Logo")]), //alpha, sep, w, sep_things
	// 	//new_sprite(sprite_get("gui_test"),0,0),
	// 	// new_textbox("QUEST_NAME",0,0,200,16,c_white,asset_get("fName")),
	// 	// new_textbox("QUEST_DESCRIPTION",0,16,200,16,c_white,asset_get("roaLBLFont")),
	// ]);
	// var _pos = [144,8];
	// var _string ="Init";
	// var _sound = noone;
	// // var _sound = asset_get("empty_sprite");
	// var _w = 500;
	// win_add(i++,[WIN.DIALOG_DEFAULT, //6
	// 	new_varcont([1,1]), //ID, Progress
	// 	new_sprite(sprite_get("talk_gui"),0,0), //Dialog Background Sprite
	// 	new_sprite(sprite_get("face_default"),0,0), //Dialog Picture
	// 	new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1]+2,_w,18,c_white,asset_get("medFont")), //Main Text
	// 	// new_sprite(sprite_get("response_gui"),0,0), //Response Sprite
	// 	// new_listbox(["Response 1","Response 2"],asset_get("empty_sprite"),_sound,_pos[0],_pos[1]+2,_w,18,c_white,asset_get("medFont")), //Listbox new_listbox(_choices,_select_sprite,_sound,_x,_y,_w,_sep,_color,_font)
	// ]);
	exit;
}

if win_call == 2 {//Update Call
	logic_windows();
	if freeze_frame != noone { //Freeze code
		if freeze_window != noone {
			var _i = 0;
			repeat array_length_1d(debug_selected) {
				if debug_selected[_i].window == freeze_window && debug_selected[_i].window_frame == freeze_frame {
					freeze_obj(debug_selected[_i]);
					freeze_frame = noone;
					freeze_window = noone;
					cmd_print("","Frozen <"+string(debug_selected)+">:"+string(debug_selected.object_index));
				}
				_i++;
			}
		} else {
			// print(freeze_frame);
			var _i = 0;
			repeat array_length_1d(debug_selected) {
				if (debug_selected[_i].state == PS_ATTACK_AIR || debug_selected[_i].state == PS_ATTACK_GROUND) && debug_selected[_i].state_timer == freeze_frame {
					freeze_obj(debug_selected[_i]);
					freeze_frame = noone;
					cmd_print("","Frozen <"+string(debug_selected[_i])+">:"+string(debug_selected[_i].object_index));
				}
				_i++;
			}
		}
	}
	if attack_edit != noone { //Attack edit code
		if !attack_edit_init {
			if attack_edit_player.state == PS_ATTACK_AIR || attack_edit_player.state == PS_ATTACK_GROUND {
				cmd_command(["f"],"",true);
				cmd_command(["s_state",string(attack_index_start+attack_edit_player.state_timer)],"",true);
				cmd_command(["f"],"",true);
				attack_index_end = attack_index_start+attack_edit_player.state_timer-1;
			} else {
				state_cur = attack_index_start;
				
				cmd_command(["l_state",string(state_cur)],"",true);
				attack_edit_init = 1;
			}
			
		} else { //After Indexing
			if keyboard_has("a") {
				if state_cur > attack_index_start state_cur -= 1;
				cmd_print("","To Frame "+string(state_cur-attack_index_start));
				cmd_command(["l_state",string(state_cur)],"",true);
			}
			if keyboard_has("d") {
				if state_cur < attack_index_end state_cur += 1;
				cmd_print("","To Frame "+string(state_cur-attack_index_start));
				cmd_command(["l_state",string(state_cur)],"",true);
			}
			if keyboard_has("q") {
				attack_edit = noone;
				cmd_print("","Exiting Edit Mode...");
				cmd_command(["f"],"",true);
			}
		}
	}
	exit;
	
}
#define logic_windows() //Update Call
var _x = 0;
var _y = 0;
var _param = [];
var _element = [];
win_alpha = 1;
var alive_time = 0;
for (var _i = 0; _i < array_length_1d(active_win); _i++) {
	_x = active_win[_i][0][0]+view_get_xview();
	_y = active_win[_i][0][1]+view_get_yview();
	_element = active_win[_i][1];
	active_win[@_i][@0][@3] += 1;
	alive_time = active_win[_i][0][3];
	
	win_alpha = 1;
	switch _element[0] {
		case WIN.DEBUG:
			if string_count("`",keyboard_string) {
				cmd_x = _x;
				cmd_y = _y;
				keyboard_string = "";
				end_window(_i);
				_i--;
			}
			if attack_edit == noone {
				if string_count("/",keyboard_string) {
					console_parse = string_parse(_element[4][1]," ");
					if console_parse != [] {
						cmd_command(console_parse,_element[4][1],false);
						// if !cmd_save_output cmd_output = parse_lines(cmd_output,_element[3][4],_element[3][5],16,-1);
						_element[@4][@1] = cmd_char;
					}
					keyboard_string = "";
				}
				if string_count("\",keyboard_string) {
					_element[@4][@1] = string_delete(_element[4][1],string_length(_element[4][1]),2);
					keyboard_string = "";
				}
				if keyboard_string != "" {
					_element[@4][@1] += keyboard_string;
					keyboard_string = "";
				}
			}
			_element[@3][@1] = cmd_output;
			break;
		case WIN.SUBMENU:
			if alive_time == 1 {
				update_select = false;
				_element[@1][@0] = collision_point(mouse_x,mouse_y,pHitBox,true,true);
				if _element[1][0] == noone _element[@1][@0] = collision_point(mouse_x,mouse_y,oPlayer,true,true);
			// 	with debug_selected[0] { //Add buttons depending on selected type
			// 		switch object_index {
			// 			case pHitBox:
			// 				// array_push(_element[1],SM.PROP);
			// 				// array_push(_element[1],SM.DEL);
			// 				var _l = 0;
			// 				array_push(_element,new_button(SM.PROP,sprite_get("empty_sprite"),0,(_l++)*sprite_get_height()));
			// 				array_push(_element,new_button(SM.DEL,sprite_get("empty_sprite"),0,0));
			// 				break;
			// 			default: //Aka None
			// 				// array_push(_element[1],SM.ADD);
			// 				break;
			// 		}
			// 	}
			}
			if mb_l_click && mouse_button != 1 { //On mouse release
				update_select = true;
				end_window(_i); 
			}
			break;
		case WIN.STAT:
			if mb_r_click end_window(_i);
			break;
		// case WIN.AREATITLE:
		// 	active_win[@_i][@0][@0] = lerp(active_win[_i][0][0],title_x_stop*(alive_time < 360)-title_x_stop*(alive_time > 360),0.1);
		// 	if active_win[_i][0][0] == -title_x_stop {
		// 		end_window(_i);
		// 		_i--;
		// 	}
		// 	break;
		// case WIN.AREAFADE:
		// 	_element[@3][@1] = lerp(_element[3][1],(alive_time < title_time),0.05);
		// 	if alive_time > title_time*2 {
		// 		end_window(_i);
		// 		_i--;
		// 	}
		// 	break;
		// case WIN.ARCHY_DIALOG:
		// 	if alive_time == 1 {
		// 		//print_debug(string(_element[1][1]));
		// 		active_win[@_i][1][@3][@1] = _element[1][1];
		// 		active_win[@_i][1][@4][@1] = _element[1][1];
		// 		active_win[@_i][1][@5][@1] = _element[1][1];
		// 		active_win[@_i][1][@6][@1] = _element[1][1];
		// 		active_win[@_i][1][@7][@1] = _element[1][1];
		// 		active_win[@_i][1][@8][@1] = _element[1][1];
		// 		active_win[@_i][1][@9][@1] = _element[1][1];
		// 		//TEST
		// 		_element[@1][@4] = _x;
		// 		_element[@1][@5] = _y;
		// 		//TEST
		// 	}
		// 	//TEST
		// 	active_win[@_i][@0][@0] = _element[1][4]-view_get_xview();
		// 	active_win[@_i][@0][@1] = _element[1][5]-view_get_yview();
		// 	//
		// 	if _element[3][11] > string_length(_element[3][1])-1 {
		// 		_element[@1][@3] += 1;
		// 		if _element[1][3] > _element[1][2] {
		// 			end_window(_i);
		// 			_i--;
		// 		}
		// 	}
		// 	break;
		// case WIN.POINTOUT:
		// 	if alive_time == 1 {
		// 		active_win[@_i][1][@2][@1] = _element[1][1];
		// 		_element[@1][@4] = _x;
		// 		_element[@1][@5] = _y;
		// 	}
		// 	//TEST
		// 	active_win[@_i][@0][@0] = _element[1][4]-view_get_xview();
		// 	active_win[@_i][@0][@1] = _element[1][5]-view_get_yview();
		// 	//
		// 	if _element[2][11] > string_length(_element[2][1])-1 {
		// 		_element[@1][@3] += 1;
		// 		if _element[1][3] > _element[1][2] {
		// 			end_window(_i);
		// 			_i--;
		// 		}
		// 	}
		// 	break;
		// case WIN.QUESTLIST:
		// 	_quests = action_manager.quest_active;
		// 	// print(_quests[0][_quests[0][0][0]][0]);
		// 	break;
		// case WIN.DIALOG_DEFAULT:
		// 	//Element List: 1 - varcont[], 2 - Bg, 3 - Face, 4- Dialog
		// 	if alive_time == 1 {
		// 		//_element[@1][@1]
		// 		_element[@4][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][0]; //Set to initial dialog: [id][progress][string,face,bg]
		// 		if array_length_1d(action_manager.dialog_array[_element[1][1]][_element[1][2]]) > 1 {
		// 			_element[@3][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][0][1]; //Set to initial dialog: [id][progress][string,face,bg]
		// 			if array_length_1d(action_manager.dialog_array[_element[1][1]][_element[1][2]][0]) > 2 _element[@2][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][2]; //Set to initial dialog: [id][progress][data/response_map][string,face,bg]
		// 		}
					
		// 		}
		// 	with oPlayer {
		// 		if attack_held == 1 || taunt_held == 1 {
		// 			print("Upping text...");
		// 			_element[@1][@2]++;
		// 			if _element[1][2] > array_length_1d(action_manager.dialog_array[_element[1][1]])-1 { //The end of the conversation!
		// 				with other end_window(_i);
		// 			}
		// 			_element[@4][@11] = 0;
		// 			_element[@4][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][0];
		// 			if array_length_1d(action_manager.dialog_array[_element[1][1]][_element[1][2]]) > 1 {
		// 			_element[@3][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][1]; //Set to initial dialog: [id][progress][data/response_map][string,face,bg]
		// 			if array_length_1d(action_manager.dialog_array[_element[1][1]][_element[1][2]]) > 2 _element[@2][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][2]; //Set to initial dialog: [id][progress][data/response_map][string,face,bg]
		// 			}
		// 		}
		// 	}
		// 	break;
	}
	for (var _j = 1; _j < array_length_1d(_element);_j++) {
		_param = _element[_j];
		switch _param[0] {
			case GUI.DIALOGBOX_TRIM:
			case GUI.DIALOGBOX:
				_param[11] += _param[4];
				// print(_param[1]);
				if _param[11] < string_length(_param[1])-1 && !((floor(_param[11])) % 2) sound_play(_param[2],false,0,0.05,.9);//floor(_param[11] + _param[4]) > floor(_param[11]) sound_play(_param[2]);
				break;
			case GUI.SCROLLBOX: //[GUI.SCROLLBOX,_str,_x,_y,_w,_h,_sep,_color,_font,_line,_parsed_string];
				if alive_time == 1 _param[10] = parse_lines(_param[1],_param[4],_param[5],_param[6],_param[9]);
				with oPlayer {
					if up_held == 1 || down_held == 1 {
						_param[9] += (up_held == 1) - (down_held == 1);
					}
				}
				_param[9] = clamp(_param[9],0,100);
				_param[10] = parse_lines(_param[1],_param[4],_param[5],_param[6],_param[9]);
				break;
			case GUI.BUTTON: //[GUI.BUTTON,_type,_button_strip,_x,_y,_state];
				if mb_l_click && _param[5] { //On Left Click do something
					// print("AAAA");
					switch _param[1] {
						case SM.PROP:
							array_push(active_win,[[mouse_x-view_get_xview(),mouse_y-view_get_yview(),noone,0],array_clone_deep(win_data[3])]); //Properties box
							break;
						case SM.DEL:
							if array_length_1d(debug_selected) > 0 {
								with debug_selected[0] {
									visible = false;
									destroyed = true;
									instance_destroy(self);
								}
								array_cut(debug_selected,0);
							}
							break;
						case SM.EXPORT:
							cmd_command(["export"],"",false);
							break;
						case SM.ADD:
							cmd_command(["new"],"",true);
							// var _hitbox_index = 1;
							// var _hit;
							// with debug_selected[0] {
							// 	while get_hitbox_value(attack,_hitbox_index,HG_LIFETIME) != 0 && get_hitbox_value(attack,_hitbox_index,HG_HITBOX_X) != 0 _hitbox_index++;
							// 	_hit = create_hitbox(attack,1,_x,_y);
							// 	_hit.hbox_num = _hitbox_index;
							// }
							// debug_selected[0] = _hit;
							// cmd_command(["set","hbox_num",string(_hitbox_index)],"",true);
							// cmd_print("","Added Hitbox "+string(_hitbox_index)+"...");
							break;
						case SM.SAVE:
							// print("save");
							cmd_command(["s_state","0"],"",false);
							break;
						case SM.LOAD:
							// print("load");
							cmd_command(["l_state","0"],"",false);
							break;
					}
					update_select = true;
					end_window(_i);
				}
				// print(in_rect(mouse_x,mouse_y,_x+_param[3],_y+_param[4],_x+_param[3]+sprite_get_width(_param[2])*2,_y+_param[4]+sprite_get_height(_param[2])*2));
				// if mb_l_click && _param[5] { //On Left Click do something
				// 	// print("AAAA");
				// 	switch _param[1] {
				// 		case SM.PROP:
				// 			print("AAAAA");
				// 			array_push(active_win,[[mouse_x-view_get_xview(),mouse_y-view_get_yview(),noone,0],array_clone_deep(win_data[3])]); //Properties box
				// 			break;
				// 	}
				// }
				break;
		}
	}
}


return true;
#define draw_windows() //Draw Call
var _x = 0;
var _y = 0;
var _param = [];
var _element = [];
win_alpha = 1;
var alive_time = 0;
var _windows = "";

// draw_debug_text(100,100,break_string("Hello! This is a test on breaking up strings....",100,32,0));
for (var _i = 0; _i < array_length_1d(active_win); _i++) {
	_x = active_win[_i][0][0]+view_get_xview();
	_y = active_win[_i][0][1]+view_get_yview();
	_element = active_win[_i][1];
	active_win[@_i][@0][@3] += 1;
	alive_time = active_win[_i][0][3];
	_windows += string(active_win[_i][1][0])+" : ";
	win_alpha = 1;
	switch _element[0] {
		case WIN.DEBUG:
			win_alpha = .5+(win_active == _i)*.5;
			break;
		// case WIN.AREAFADE:
		// 	win_alpha = _element[3][1];
		// 	break;
		// case WIN.QUESTLIST:
		// 	win_alpha = _element[1][1];
		// 	// draw_sprite_ext(sprite_get("gui_test"),0,_x,_y,2,2,0,c_white,win_alpha);
		// 	draw_sprite_ext(asset_get("empty_sprite"),0,_x,_y,2,2,0,c_white,win_alpha);
		// 	draw_set_alpha(.6);
		// 	draw_rectangle_color(_x,_y,_x+320,_y+96,c_black,c_black,c_black,c_black,false);
		// 	draw_set_alpha(1);
		// 	for (var _a = 0; _a < array_length_1d(_quests); _a++) {
		// 		draw_sprite_ext(_quests[_a][_quests[_a][0]][2],0,_x,_y+_a*_element[1][4],2,2,0,c_white,win_alpha); //Get Logo Working
		// 		draw_text_drop(_x+42,_y+_a*_element[1][4]+4,_quests[_a][_quests[_a][0]][0],_element[1][2],_element[1][3],1,1,0,win_alpha);
		// 		draw_text_drop(_x+42+16,_y+_a*_element[1][4]+4+16,_quests[_a][_quests[_a][0]][1],_element[1][2],_element[1][3],1,1,0,win_alpha);
		// 	}
		// 	break;
	}
	if win_alpha > 0 for (var _j = 1; _j < array_length_1d(_element); _j++) {
		_param = _element[_j];
		switch _param[0] {
			case GUI.SPRITE:
				draw_sprite_ext(_param[1],0,_x+_param[2],_y+_param[3],2,2,0,c_white,win_alpha);
				break;
			case GUI.TEXTBOX:
				draw_set_font(_param[7]);
				draw_text_ext_transformed_color(_x+_param[2],_y+_param[3],_param[1],_param[5],_param[4],1,1,0,_param[6],_param[6],_param[6],_param[6],win_alpha);
				break;
			case GUI.DIALOGBOX:
				//_param[11] += _param[4];
				draw_set_font(_param[10]);
				// if floor(_param[11]/4) % 2 {
				// 	draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
				// 	break;
				// }
				draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
				break;
			case GUI.DIALOGBOX_TRIM:
				//_param[11] += _param[4];
				draw_set_font(_param[10]);
				var _offset =  2;
				// if floor(_param[11]/4) % 2 {
					
				// 	draw_text_ext_transformed_color(_x+_param[5],_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5],_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
				// 	break;
				// }
				draw_text_ext_transformed_color(_x+_param[5],_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5],_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
				break;
			case GUI.SCROLLBOX: //Good lord help me - not actually that bad :)
				draw_set_font(_param[8]);
				draw_text_ext_transformed_color(_x+_param[2],_y+_param[3],_param[10],_param[6],_param[4],1,1,0,_param[7],_param[7],_param[7],_param[7],win_alpha);
				break;
			case GUI.BUTTON: //[GUI.BUTTON,_type,_button_strip,_x,_y,_state,_name];
				draw_set_font(asset_get("fName"));
				if in_rect(mouse_x,mouse_y,_x+_param[3],_y+_param[4],_x+_param[3]+sprite_get_width(_param[2])*2,_y+_param[4]+sprite_get_height(_param[2])*2) _param[5] = 1;
				else _param[5] = 0;
				draw_sprite_ext(_param[2],_param[5],_x+_param[3],_y+_param[4],2,2,0,c_white,1);
				draw_text_drop(_x+_param[3]+32,_y+_param[4]+8,_param[6],16,100,1,1,0,1);
				break;
		}
	}
}

for (var _i = 0; _i < array_length_1d(debug_selected);_i++) with debug_selected[_i] {
	switch object_index {
		case oPlayer:
			with other draw_edit_box(other.x-sprite_get_xoffset(other.sprite_index),other.y-sprite_get_yoffset(other.sprite_index),
					other.x-sprite_get_xoffset(other.sprite_index)+sprite_get_width(other.sprite_index),other.y-sprite_get_yoffset(other.sprite_index)+sprite_get_height(other.sprite_index), c_fuchsia);
			break;
		case pHitBox:
			with other draw_edit_box(other.player_id.x+other.x_pos-other.image_xscale*100,other.player_id.y+other.y_pos-other.image_yscale*100, //Editbox
					other.player_id.x+other.x_pos+other.image_xscale*100,other.player_id.y+other.y_pos+other.image_yscale*100,c_fuchsia);
			break;
	}
}
//print_debug(_windows);
return true;

#define new_textbox(_default_string,_x,_y,_w,_sep,_color,_font)
return [GUI.TEXTBOX,_default_string,_x,_y,_w,_sep,_color,_font];
#define new_sprite(_sprite,_x,_y)
return [GUI.SPRITE,_sprite,_x,_y];
#define new_dialogbox(_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font)
var _char_vis = 0;
return [GUI.DIALOGBOX,_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font,_char_vis];
#define new_trim_dialogbox(_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font)
var _char_vis = 0;
return [GUI.DIALOGBOX_TRIM,_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font,_char_vis];
#define new_scrollbox(_str,_x,_y,_w,_h,_sep,_color,_font)
var _line = 0;
var _parsed_string = "";
return [GUI.SCROLLBOX,_str,_x,_y,_w,_h,_sep,_color,_font,_line,_parsed_string];
#define new_listbox(_choices,_select_sprite,_sound,_x,_y,_w,_sep,_color,_font)

return [GUI.LISTBOX,_choices,_select_sprite,_sound,_x,_y,_w,_sep,_color,_font];
#define new_button(_type,_button_strip,_x,_y,_name)
var _state = 0;
return [GUI.BUTTON,_type,_button_strip,_x,_y,_state,_name];
#define new_varcont(_var)
var _s = [GUI.VARCONT];
for (var _i = 0;_i < array_length_1d(_var);_i++) array_push(_s,_var[_i]);
return _s;
#define win_add(_win_id, _win_data)
while _win_id >= array_length_1d(win_data)  array_push(win_data, []);
win_data[@_win_id] = _win_data;
return true;
#define end_window(_i)
// if debug print_debug("[WA] ENDING W: "+string(active_win[_i][1][0])+" AI: "+string(active_win[_i][0][2]));
// if active_win[_i][0][2] != noone with action_manager array_push(end_action_index,other.active_win[_i][0][2]);
active_win = array_cut(active_win,_i);
return true;

#define do_cursor() //cursor stuff
cursor_x_p = cursor_x;
cursor_y_p = cursor_y;
cursor_x = mouse_x;
cursor_y = mouse_y;
// var _cursor_grid = grid_to_cell([mouse_x+64,mouse_y+64]);
if cmd_toggle {
	//draw_debug_text(cursor_x,cursor_y,string(_cursor_grid[1])+":"+string([floor((_cursor_grid[0][0])/16),floor((_cursor_grid[0][1])/16)])+":"+string([(_cursor_grid[0][0]) % 16, (_cursor_grid[0][1]) % 16]));
	// draw_debug_text(cursor_x,cursor_y,"["+string(_cursor_grid[1][0])+","+string(_cursor_grid[1][1])+"]:["+string(floor((_cursor_grid[0][0])/16))+","+string(floor((_cursor_grid[0][1])/16))+"]:["+string((_cursor_grid[0][0]) % 16)+","+string((_cursor_grid[0][1]) % 16)+"]");
	draw_debug_text(floor(view_get_xview()),floor(view_get_yview()),"FPS:REAL: "+string(fps)+":"+string(fps_real));
	// draw_debug_text(cursor_x,cursor_y+32,string([mouse_x,mouse_y]));
}
return true;
#define logic_cursor()

switch mouse_button {
	case 1: //Left-Click
		//keyboard_string = "";
		if !mb_l_click { //on click
			mb_l_click = true;
			click_x = mouse_x;
			click_y = mouse_x;
			// print_debug("MB1 CLICK!");
			//Windows
			var _x = 0;
			var _y = 0;
			var _param = [];
			for (var i = 0; i < array_length_1d(active_win);i++) {
				_x = active_win[i][0][0]+view_get_xview();
				_y = active_win[i][0][1]+view_get_yview();
				_param = active_win[i][1];
				switch _param[0] {
					case WIN.DEBUG:
						if point_distance(_x,_y,cursor_x,cursor_y) < 64 {
							win_drag = i;
							win_active = i;
						}
						break;
				}
			}
			// if win_drag == -1 win_active = -1;
			
			//Debug View Objects
			node_select = DIR_NONE;
			if array_length_1d(debug_selected) > 0 with debug_selected[0] {
				// print(point_distance(other.mouse_x,other.mouse_y,player_id.x+x_pos,player_id.y+y_pos+image_yscale*100));
				switch object_index {
				case pHitBox:
					if point_distance(other.mouse_x,other.mouse_y,player_id.x+x_pos,player_id.y+y_pos-image_yscale*100) < other.select_leniency {
						other.old_value_temp = image_yscale;
						other.node_select = DIR_UP;
						other.cursor_index = 1;
						break;
					} 
					if point_distance(other.mouse_x,other.mouse_y,player_id.x+x_pos,player_id.y+y_pos+image_yscale*100) < other.select_leniency {
						other.old_value_temp = image_yscale;
						other.node_select = DIR_DOWN;
						other.cursor_index = 1;
						break;
					} 
					if point_distance(other.mouse_x,other.mouse_y,player_id.x+x_pos-image_xscale*100,player_id.y+y_pos) < other.select_leniency {
						other.old_value_temp = image_xscale;
						other.node_select = DIR_LEFT;
						other.cursor_index = 2;
						break;
					} 
					if point_distance(other.mouse_x,other.mouse_y,player_id.x+x_pos+image_xscale*100,player_id.y+y_pos) < other.select_leniency {
						other.old_value_temp = image_xscale;
						other.node_select = DIR_RIGHT;
						other.cursor_index = 2;
						break;
					}
					var _angle = kb_angle;
					if _angle == 361 {
						if player_id.free _angle = 40;
						else _angle = 45;
					}
					var _v = a_vector(other.a_length,_angle);
					if point_distance(other.mouse_x,other.mouse_y,player_id.x+x_pos+_v[0],player_id.y+y_pos+_v[1]) < other.select_leniency {
						// other.old_value_temp = [player_id.x+x_pos+_v[0],player_id.y+y_pos+_v[1]];
						other.node_select = DIR_ANY;
						break;
					}
					break;
				}
				
				// if point_distance(other.mouse_x,other.mouse_y,x-sprite_get_xoffset(sprite_index)+sprite_get_width(sprite_index)/2,y-sprite_get_yoffset(sprite_index)) < other.select_leniency { //top
				// 	old_value_temp = image_yscale;
				// 	other.node_select = DIR_UP;
				// } else if point_distance(other.mouse_x,other.mouse_y,x-sprite_get_xoffset(sprite_index)+sprite_get_width(sprite_index)/2,y-sprite_get_yoffset(sprite_index)+sprite_get_height(sprite_index)) < other.select_leniency { //bot
				// 	old_value_temp = image_yscale;
				// 	other.node_select = DIR_DOWN;
				// } else if point_distance(other.mouse_x,other.mouse_y,x-sprite_get_xoffset(sprite_index),y-sprite_get_yoffset(sprite_index)+sprite_get_height(sprite_index)/2) < other.select_leniency { //left
				// 	old_value_temp = image_xscale;
				// 	other.node_select = DIR_LEFT;
				// } else if point_distance(other.mouse_x,other.mouse_y,x-sprite_get_xoffset(sprite_index)+sprite_get_width(sprite_index),y-sprite_get_yoffset(sprite_index)+sprite_get_height(sprite_index)/2) < other.select_leniency { //right
				// 	old_value_temp = image_xscale;
				// 	other.node_select = DIR_RIGHT;
				// 	}
			}
			//Select object
			if node_select == DIR_NONE && update_select {
				cursor_index = 0;
				var _collis_point = collision_point(mouse_x,mouse_y,pHitBox,true,false);
				if _collis_point == noone _collis_point = collision_point(mouse_x,mouse_y,oPlayer,true,false);
				if array_length_1d(debug_selected) == 0 || _collis_point != debug_selected[0] {
					if array_length_1d(debug_selected) > 0 with debug_selected[0] {
						switch object_index {
							case pHitBox:
								with player_id {
									set_hitbox_value(attack,other.hbox_num,HG_HITBOX_TYPE,other.type);
									set_hitbox_value(attack,other.hbox_num,HG_WINDOW,window);
									// set_hitbox_value(attack,other.hbox_num,HG_WINDOW_CREATION_FRAME,0); //Gotta figure out hitbox
									set_hitbox_value(attack,other.hbox_num,HG_LIFETIME,other.length);
									set_hitbox_value(attack,other.hbox_num,HG_HITBOX_X,other.x_pos);
									set_hitbox_value(attack,other.hbox_num,HG_HITBOX_Y,other.y_pos);
									set_hitbox_value(attack,other.hbox_num,HG_WIDTH,other.image_xscale*200);
									set_hitbox_value(attack,other.hbox_num,HG_HEIGHT,other.image_yscale*200);
									set_hitbox_value(attack,other.hbox_num,HG_SHAPE,(other.sprite_index == asset_get("hitbox_square_spr"))+2*(other.sprite_index == asset_get("hitbox_rounded_rectangle")));
									set_hitbox_value(attack,other.hbox_num,HG_PRIORITY,other.hit_priority);
									set_hitbox_value(attack,other.hbox_num,HG_DAMAGE,other.damage);
									set_hitbox_value(attack,other.hbox_num,HG_ANGLE,other.kb_angle);
									set_hitbox_value(attack,other.hbox_num,HG_BASE_KNOCKBACK,other.kb_value);
									set_hitbox_value(attack,other.hbox_num,HG_KNOCKBACK_SCALING,other.kb_scale);
									set_hitbox_value(attack,other.hbox_num,HG_EFFECT,other.effect);
									set_hitbox_value(attack,other.hbox_num,HG_BASE_HITPAUSE,other.hitpause);
									set_hitbox_value(attack,other.hbox_num,HG_HITPAUSE_SCALING,other.hitpause_growth);
									set_hitbox_value(attack,other.hbox_num,HG_VISUAL_EFFECT,other.hit_effect);
									set_hitbox_value(attack,other.hbox_num,HG_VISUAL_EFFECT_X_OFFSET,other.hit_effect_x);
									set_hitbox_value(attack,other.hbox_num,HG_VISUAL_EFFECT_Y_OFFSET,other.hit_effect_y);
									set_hitbox_value(attack,other.hbox_num,HG_HIT_PARTICLE_NUM,other.fx_particles);
									set_hitbox_value(attack,other.hbox_num,HG_HIT_SFX,other.sound_effect);
									set_hitbox_value(attack,other.hbox_num,HG_ANGLE_FLIPPER,other.hit_flipper);
									set_hitbox_value(attack,other.hbox_num,HG_EXTRA_HITPAUSE,other.extra_hitpause);
									set_hitbox_value(attack,other.hbox_num,HG_GROUNDEDNESS,other.groundedness);
									set_hitbox_value(attack,other.hbox_num,HG_EXTRA_CAMERA_SHAKE,other.camera_shake);
									set_hitbox_value(attack,other.hbox_num,HG_IGNORES_PROJECTILES,other.proj_break);
									set_hitbox_value(attack,other.hbox_num,HG_HIT_LOCKOUT,other.no_other_hit);
									set_hitbox_value(attack,other.hbox_num,HG_HITBOX_GROUP,other.hbox_group);
									set_hitbox_value(attack,other.hbox_num,HG_HITSTUN_MULTIPLIER,other.hitstun_factor);
									set_hitbox_value(attack,other.hbox_num,HG_DRIFT_MULTIPLIER,other.dumb_di_mult);
									set_hitbox_value(attack,other.hbox_num,HG_SDI_MULTIPLIER,other.sdi_mult-1);
									set_hitbox_value(attack,other.hbox_num,HG_TECHABLE,other.can_tech);
									set_hitbox_value(attack,other.hbox_num,HG_FORCE_FLINCH,other.force_flinch);
									set_hitbox_value(attack,other.hbox_num,HG_FINAL_BASE_KNOCKBACK,other.bkb_final);
									set_hitbox_value(attack,other.hbox_num,HG_THROWS_ROCK,other.throws_rock);
								}
								break;
						}
					}
					debug_selected = [];
					with _collis_point {
		 				if array_find_index(other.debug_selected,id) == -1 array_push(other.debug_selected,id);
		 				// switch object_index {
		 				// 	case oPlayer:
		 				// 		with other cmd_print("Selected an oPlayer!",string(other.id));
		 				// 		break;
		 				// 	case pHitBox:
		 				// 		with other cmd_print("Selected a pHitBox!",string(other.id));
		 				// 		break;
		 				// }
					}
				}
				while array_length_1d(cursor_drag_offset_x) < array_length_1d(debug_selected) {
					array_push(cursor_drag_offset_x, 0);
					array_push(cursor_drag_offset_y, 0);
				}
				for (var _i = 0;_i < array_length_1d(debug_selected);_i++) {
					cursor_drag_offset_x[@_i] = mouse_x-debug_selected[_i].x;
					cursor_drag_offset_y[@_i] = mouse_y-debug_selected[_i].y;
					
				}
				// if !_debug_click with obj_stage_article {
				// 	if "static" in self && static break; //Don't Select Background
				// 	switch num {
				// 		case 12: //Lighting
				// 			if sprite_get_width(render_sprite) > other.mouse_x-x && other.mouse_x-x > 0 &&
				// 					sprite_get_height(render_sprite) > other.mouse_y-y && other.mouse_y-y > 0 _debug_click = 1;
				// 			break;
				// 		case 4: // Trigger Zones
				// 		case 7: // Camera Control Zones
				// 		case 8: // Room Transfer Zones
				// 		case 9: // Checkpoints
				// 			switch trigger_shape {
				// 				case 0: // Rectangle
				// 					if trigger_w > other.mouse_x-x && other.mouse_x-x > 0 &&
				// 						trigger_h > other.mouse_y-y && other.mouse_y-y > 0 _debug_click = 1;
				// 					break;
				// 				case 1: // Circle
				// 					if point_distance(other.mouse_x,other.mouse_y,x,y) < trigger_w _debug_click = 1;
				// 					break;
				// 			}
				// 		case 1: // Terrain - no collision
				// 		case 10:// Items
				// 		default:// Catch-all for now 
				// 			if collision_point(other.mouse_x,other.mouse_y,self,true,false) != noone _debug_click = 1;
				// 			break;
				// 	}
				// 	if _debug_click {
				// 		debug_info = !debug_info;
				// 		depth = (-100*debug_info)+(og_depth*(!debug_info));
				// 		if debug_info && array_find_index(other.debug_selected,id) == -1 array_push(other.debug_selected,id);
				// 		else if array_find_index(other.debug_selected,id) != -1 other.debug_selected = array_cut(other.debug_selected,array_find_index(other.debug_selected,id));
				// 		break;
				// 	}
				// }
				// if !_debug_click with obj_stage_article_solid {
				// 	if collision_point(other.mouse_x,other.mouse_y,self,true,false) != noone {
				// 		debug_info = !debug_info;
				// 		depth = (-100*debug_info)+(og_depth*(!debug_info));
				// 		if debug_info && array_find_index(other.debug_selected,id) == -1 array_push(other.debug_selected,id);
				// 		else if array_find_index(other.debug_selected,id) != -1 other.debug_selected = array_cut(other.debug_selected,array_find_index(other.debug_selected,id));
				// 		_debug_click = 1;
				// 		break;
				// 	}
				// }
				// if !_debug_click with obj_stage_article_platform {
				// 	if collision_point(other.mouse_x,other.mouse_y,self,true,false) != noone {
				// 		debug_info = !debug_info;
				// 		depth = (-100*debug_info)+(og_depth*(!debug_info));
				// 		if debug_info && array_find_index(other.debug_selected,id) == -1 array_push(other.debug_selected,id);
				// 		else if array_find_index(other.debug_selected,id) != -1 other.debug_selected = array_cut(other.debug_selected,array_find_index(other.debug_selected,id));
				// 		_debug_click = 1;
				// 		break;
				// 	}
				// }
			}
		}
		
		//print_debug(string(win_active));
		if win_drag != -1 {
			active_win[@win_drag][@0][@0] += cursor_x - cursor_x_p;
			active_win[@win_drag][@0][@1] += cursor_y - cursor_y_p;
		}
		//Node Dragging
		if update_select switch node_select {
			case DIR_NONE: //Normal, no node
				for (var _i = 0;_i < array_length_1d(debug_selected);_i++) {
					with debug_selected[_i] switch object_index {
							case pHitBox:
								x_pos = floor((other.mouse_x-other.cursor_drag_offset_x[_i])/2)*2+1 - player_id.x;
								y_pos = floor((other.mouse_y-other.cursor_drag_offset_y[_i])/2)*2+1 - player_id.y;
								break;
							case oPlayer:
								x = floor((other.mouse_x-other.cursor_drag_offset_x[_i])/2)*2+1;
								y = floor((other.mouse_y-other.cursor_drag_offset_y[_i])/2)*2+1;
								break;
							
						}
				}
				break;
			case DIR_ANY:
				for (var _i = 0;_i < array_length_1d(debug_selected);_i++) {
					with debug_selected[_i] switch object_index {
							case pHitBox: //player_id.x+x_pos,player_id.y+y_pos
								kb_angle = floor(point_direction(player_id.x+x_pos,player_id.y+y_pos,floor((other.mouse_x-other.cursor_drag_offset_x[_i])/2)*2+1,floor((other.mouse_y-other.cursor_drag_offset_y[_i])/2)*2+1)/5)*5;
								break;
							// case oPlayer:
							// 	x = floor((other.mouse_x-other.cursor_drag_offset_x[_i])/2)*2+1;
							// 	y = floor((other.mouse_y-other.cursor_drag_offset_y[_i])/2)*2+1;
							// 	break;
							
						}
				}
				break;
			default:
				with debug_selected[_i] switch object_index {
					case pHitBox:
						if other.node_select == DIR_LEFT image_xscale = other.old_value_temp*(other.click_x/(floor((other.mouse_x-other.cursor_drag_offset_x[_i])/2)*2+1));
						if other.node_select == DIR_RIGHT image_xscale = other.old_value_temp*((floor((other.mouse_x-other.cursor_drag_offset_x[_i])/2)*2+1)/other.click_x);
						if other.node_select == DIR_UP image_yscale = other.old_value_temp*(other.click_y/(((other.mouse_y-other.cursor_drag_offset_y[_i])/2)*2+1));
						if other.node_select == DIR_DOWN image_yscale = other.old_value_temp*((((other.mouse_y-other.cursor_drag_offset_y[_i])/2)*2+1)/other.click_y);
						break;
					case oPlayer:
						break;
					
				}
				break;
		}
		break;
	case 2:
		if !mb_r_click { //on click
			mb_r_click = true;
			// print([mouse_x,mouse_y]);
			if update_select {
				if collision_point(mouse_x,mouse_y,pHitBox,true,true) array_push(active_win,[[mouse_x-view_get_xview(),mouse_y-view_get_yview(),noone,0],array_clone_deep(win_data[1])]);
				else if collision_point(mouse_x,mouse_y,oPlayer,true,true) array_push(active_win,[[mouse_x-view_get_xview(),mouse_y-view_get_yview(),noone,0],array_clone_deep(win_data[2])]);
				else array_push(active_win,[[mouse_x-view_get_xview(),mouse_y-view_get_yview(),noone,0],array_clone_deep(win_data[3])]);
			}
			// while array_length_1d(cursor_drag_offset_x) < array_length_1d(debug_selected) {
			// 	array_push(cursor_drag_offset_x, 0);
			// 	array_push(cursor_drag_offset_y, 0);
			// }
			// for (var _i = 0;_i < array_length_1d(debug_selected);_i++) {
			// 	cursor_drag_offset_x[@_i] = mouse_x-debug_selected[_i].x;
			// 	cursor_drag_offset_y[@_i] = mouse_y-debug_selected[_i].y;
				
			// }
		}
		
		// for (var _i = 0;_i < array_length_1d(debug_selected);_i++) {
		// 	debug_selected[_i].x = floor((mouse_x-cursor_drag_offset_x[_i])/2)*2+1;
		// 	debug_selected[_i].y = floor((mouse_y-cursor_drag_offset_y[_i])/2)*2+1;
		// 	with debug_selected[_i] switch object_index {
		// 			case pHitBox:
		// 				x_pos = floor((other.mouse_x-other.cursor_drag_offset_x[_i])/2)*2+1 - player_id.x;
		// 				y_pos = floor((other.mouse_y-other.cursor_drag_offset_y[_i])/2)*2+1 - player_id.y;
		// 				break;
		// 			case oPlayer:
		// 				x = floor((other.mouse_x-other.cursor_drag_offset_x[_i])/2)*2+1;
		// 				y = floor((other.mouse_y-other.cursor_drag_offset_y[_i])/2)*2+1;
		// 				break;
					
		// 		}
		// }
		break;
	default:
		cursor_index = 0;
		if mb_l_click { //on release
			win_drag = -1;
			//print_debug("MB1 UN CLICK!8");
		}
		mb_l_click = false;
		mb_r_click = false;
		break;
}
return true;

#define cmd_command(_str_a,_str_raw,_sup)
sup_out = _sup;
var _with_obj = self;
_str_a[@0] = string_replace(_str_a[0],cmd_char,"");
for (var _i = 0;_i < array_length_1d(_str_a);_i++) { //Convert to values
	if string(_str_a[_i]) != _str_a[_i] blank = 0;
	// else if string_count("sprite:",_str_a[_i]) > 0 _str_a[@_i] = sprite_get(string_replace(string_replace(_str_a[_i],"sprite:'",""),"'",""));
	// else if string_count("asset:",_str_a[_i]) > 0 _str_a[@_i] = asset_get(string_replace(string_replace(_str_a[_i],"asset:'",""),"'",""));
	// else if string_count("sound:",_str_a[_i]) > 0 _str_a[@_i] = sound_get(string_replace(string_replace(_str_a[_i],"sound:'",""),"'",""));
	else if string_count("r:",_str_a[_i]) > 0 _str_a[@_i] = resource_get(string_replace(string_replace(_str_a[_i],"r:'",""),"'",""));
	else if string_count("v:",_str_a[_i]) > 0 _str_a[@_i] = variable_instance_get(self,string_replace(string_replace(_str_a[_i],"v:'",""),"'",""));
	else if string_count("noone",_str_a[_i]) > 0 _str_a[@_i] = string_replace(_str_a[_i],"noone","-4");
	// else if string_count("m:",_str_a[_i]) > 0 _str_a[@_i] = macro_resolve(string_replace(string_replace(_str_a[_i],"m:'",""),"'",""));
	// else if string_count("(",_str_a[_i]) > 0 { //Function to try
	// 	_str_a[@_i] = variable_instance_get(self,string_replace(string_replace(_str_a[_i],"v:'",""),"'",""));
	// }
}
// print(_str_a);
with _with_obj {
	switch _str_a[0] {
		// case "action_import":
		// 	var _action = get_string("Insert the code for the action you want to import!","");
		// 	break;
		// case "action_play":
		// 	with action_manager array_push(action_queue, [room_id, scene_id, real(_str_a[1])]);
		// 	break;
		case "attack": //Cause Enemies to attack
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
				if debug_selected[_i].object_index == oPlayer with debug_selected[_i] debug_selected[_i] = set_attack(real(_str_a[1]));
			}
			break;
		case "lucid": //Does Nothing ATM
			debug = !debug;
			cmd_print(_str_raw,"Lucid toggled; WILL desync!");
			break;
		case "freecam":
			if !debug {
				cmd_print(_str_raw,"Error: Need to be LUCID");
				break;
			}
			cmd_freecam = !cmd_freecam;
			// follow_player.visible = !visible;
			cmd_print(_str_raw,"Toggled Freecam Mode (WIP)");
			break;
		case "f":
		case "freeze": //Enemy does not do inputs
			if array_length_1d(_str_a) == 1 { //1 arg immediately freeze
				if array_length_1d(debug_selected) == 0 freeze_obj(oPlayer);
				else freeze_obj(debug_selected[0]);
				cmd_print(_str_raw,"Object freeze toggled");
				break;
			}
			if array_length_1d(_str_a) == 2 {
				freeze_frame = _str_a[1]; //1 arg freeze after frames
				freeze_window = noone;
				cmd_print(_str_raw,"Freezing selected oPlayer queued to frame "+string(freeze_frame)+"");
				break;
			}
			if array_length_1d(_str_a) > 2 { //2 arg freeze after window and window_frames
				freeze_window = _str_a[1]; 
				freeze_frame = _str_a[2]; 
				cmd_print(_str_raw,"Freezing selected oPlayer queued to window:timer "+string(freeze_window)+":"+string(freeze_frame));
				break;
			}
			break;
		case "d":
		case "destroy":
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
				instance_destroy(debug_selected[_i]);
			}
			break;
		case "clear":
			cmd_output = "";
			cmd_print(_str_raw,"Cleared LD Output");
			break;
		case "debug_output": //toggles debug console outputs
			if !debug {
				cmd_print(_str_raw,"Error: Need to be LUCID");
				break;
			}
			if array_length_1d(debug_selected) == 0 {
				with oPlayer debug = !debug;
				cmd_print(_str_raw,"Debug toggled for all players...");
				break;
			} 
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
				debug_selected[_i].debug = !debug_selected[_i].debug;
				cmd_print(_str_raw,"Debug toggled for selected...");
			}
			break;
		case "edit": //Enter edit mode for an attack
			print("Use A and D to go through the frames - Q to quit edit mode.");
			if array_length_1d(_str_a) < 2 {
				cmd_print(_str_raw,"Error: 1 Arg Req.");
				break;
			}
			if real(_str_a[1]) > array_length_1d(debug_selected[0].attack_grid) {
				cmd_print(_str_raw,"Out of Bounds - Need a number within attack_grid!");
				break;
			}
			if array_length_1d(debug_selected) < 1 || debug_selected[0].object_index != oPlayer {
				cmd_print(_str_raw,"Error: Select an oPlayer.");
				break;
			}
			
			attack_edit = real(_str_a[1]);
			attack_edit_player = debug_selected[0];
			attack_edit_init = 0;
			with attack_edit_player set_attack(other.attack_edit);
			cmd_print(_str_raw,"EDITTING "+att_name(attack_edit));
			cmd_print("","Indexing Attack...");
			break;
		case "export":
			if array_length_1d(debug_selected) == 0 {
				cmd_print(_str_raw,"Select an object for export.");
				break;
			}
			var _exp_string = "";
			with debug_selected[0] {
				switch object_index {
					case pHitBox:
						with player_id {
							_exp_string += "//Hitbox "+string(other.hbox_num)+" - Generated via Lucid Dream
";
							_exp_string += shv(attack,other.hbox_num,"HG_HITBOX_TYPE",other.type);
							_exp_string += shv(attack,other.hbox_num,"HG_WINDOW",window);
							_exp_string += shv(attack,other.hbox_num,"HG_WINDOW_CREATION_FRAME",0); //Gotta figure out hitbox
							_exp_string += shv(attack,other.hbox_num,"HG_LIFETIME",other.length);
							_exp_string += shv(attack,other.hbox_num,"HG_HITBOX_X",other.x_pos);
							_exp_string += shv(attack,other.hbox_num,"HG_HITBOX_Y",other.y_pos);
							_exp_string += shv(attack,other.hbox_num,"HG_WIDTH",other.image_xscale*200);
							_exp_string += shv(attack,other.hbox_num,"HG_HEIGHT",other.image_yscale*200);
							_exp_string += shv(attack,other.hbox_num,"HG_SHAPE",(other.sprite_index == asset_get("hitbox_square_spr"))+2*(other.sprite_index == asset_get("hitbox_rounded_rectangle")));
							_exp_string += shv(attack,other.hbox_num,"HG_PRIORITY",other.hit_priority);
							_exp_string += shv(attack,other.hbox_num,"HG_DAMAGE",other.damage);
							_exp_string += shv(attack,other.hbox_num,"HG_ANGLE",other.kb_angle);
							_exp_string += shv(attack,other.hbox_num,"HG_BASE_KNOCKBACK",other.kb_value);
							_exp_string += shv(attack,other.hbox_num,"HG_KNOCKBACK_SCALING",other.kb_scale);
							_exp_string += shv(attack,other.hbox_num,"HG_EFFECT",other.effect);
							_exp_string += shv(attack,other.hbox_num,"HG_BASE_HITPAUSE",other.hitpause);
							_exp_string += shv(attack,other.hbox_num,"HG_HITPAUSE_SCALING",other.hitpause_growth);
							_exp_string += shv(attack,other.hbox_num,"HG_VISUAL_EFFECT",other.hit_effect);
							_exp_string += shv(attack,other.hbox_num,"HG_VISUAL_EFFECT_X_OFFSET",other.hit_effect_x);
							_exp_string += shv(attack,other.hbox_num,"HG_VISUAL_EFFECT_Y_OFFSET",other.hit_effect_y);
							_exp_string += shv(attack,other.hbox_num,"HG_HIT_PARTICLE_NUM",other.fx_particles);
							_exp_string += shv(attack,other.hbox_num,"HG_HIT_SFX",other.sound_effect);
							_exp_string += shv(attack,other.hbox_num,"HG_ANGLE_FLIPPER",other.hit_flipper);
							_exp_string += shv(attack,other.hbox_num,"HG_EXTRA_HITPAUSE",other.extra_hitpause);
							_exp_string += shv(attack,other.hbox_num,"HG_GROUNDEDNESS",other.groundedness);
							_exp_string += shv(attack,other.hbox_num,"HG_EXTRA_CAMERA_SHAKE",other.camera_shake);
							_exp_string += shv(attack,other.hbox_num,"HG_IGNORES_PROJECTILES",other.proj_break);
							_exp_string += shv(attack,other.hbox_num,"HG_HIT_LOCKOUT",other.no_other_hit);
							_exp_string += shv(attack,other.hbox_num,"HG_HITBOX_GROUP",other.hbox_group);
							_exp_string += shv(attack,other.hbox_num,"HG_HITSTUN_MULTIPLIER",other.hitstun_factor);
							_exp_string += shv(attack,other.hbox_num,"HG_DRIFT_MULTIPLIER",other.dumb_di_mult);
							_exp_string += shv(attack,other.hbox_num,"HG_SDI_MULTIPLIER",other.sdi_mult-1);
							_exp_string += shv(attack,other.hbox_num,"HG_TECHABLE",other.can_tech);
							_exp_string += shv(attack,other.hbox_num,"HG_FORCE_FLINCH",other.force_flinch);
							_exp_string += shv(attack,other.hbox_num,"HG_FINAL_BASE_KNOCKBACK",other.bkb_final);
							_exp_string += shv(attack,other.hbox_num,"HG_THROWS_ROCK",other.throws_rock);
						}
						break;
				}
			}
			cmd_print(_str_raw,"Exported Hitbox Data (See Popup)");
			get_string("Exported Hitbox Data (Ctrl+A -> Ctrl+C to clipboard)",_exp_string);
			
			// var _art = debug_selected[0];
			// var _article_type = (_art.object_index == obj_stage_article)*0+
			// 					(_art.object_index == obj_stage_article_platform)*1+
			// 					(_art.object_index == obj_stage_article_solid)*2;
			// var _art_sv = "[";
			// for (var _i = 0; _i < array_length(_art.spawn_variables);_i++) _art_sv += string(_art.spawn_variables[_i])+",";
			// _art_sv += "]";
			// var _art_pos = grid_to_cell([_art.x+64,_art.y+64]);
			// get_string("Copy the below into the room ["+string(_art_pos[1][0])+","+string(_art_pos[1][1])+"] load script...",
			// "["+string(_art.num)+","+string(floor(_art_pos[0][0]/16))+","+string(_art_pos[0][1]/16)+","+string(_article_type)+","+string(_art.og_depth)+","+_art_sv+",[0,0]"+"],");
			// cmd_print(_str_raw,"Exporting Article into ROOM Format...");
			break;
		case "get":
			if array_length_1d(_str_a) < 2 {
				cmd_print(_str_raw,"Error: 1 Arg Req.");
				break;
			}
			if array_length_1d(debug_selected) == 0 {
				cmd_print(_str_raw, _str_a[1]+": "+string(variable_instance_get(self,_str_a[1])));
				break;
			}
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) if (_str_a[1] in debug_selected[_i]) {
				var _obj_name = debug_selected[_i].object_index;
				switch debug_selected[_i].object_index {
					case 3:
						_obj_name = "oPlayer";
						break;
					case 6:
						_obj_name = "pHitBox";
						break;
				}
				if _str_a[1] == "sprite_index" {
					cmd_print(_str_raw, _str_a[1]+": "+sprite_get_name(variable_instance_get(debug_selected[_i],_str_a[1])));
					break;
				}
				cmd_print(_str_raw,string(_obj_name)+"<"+string(debug_selected[_i])+">."+_str_a[1]+" = "+string(variable_instance_get(debug_selected[_i],_str_a[1])));
				break;
			}
			break;
		case "god":
			with oPlayer god = !god;
			cmd_print(_str_raw,"God Mode Toggled");
			break;
		case "kill":
			with oPlayer if state != PS_DEAD && state != PS_RESPAWN {
				dead_pos = [x,y];
				create_deathbox(x,y-32,10,10,player,true,0,2,2);
			}
			cmd_print(_str_raw,"You must DIE");
			break;
		case "list":
				var _art_list = "";
			if array_length_1d(_str_a) > 2 && (_str_a[1] == "selected" || _str_a[1] == "s") {
				_art_list = "Selected Objects:
	";
				for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
					_art_list += string(debug_selected[_i])+", ";
				}
				cmd_print(_str_raw,_art_list);
				break;
			} else {
				with pHitBox {
					_art_list += string(id)+":H, ";
				}
				with oPlayer {
					 _art_list += string(id)+":P, ";
				}
				with obj_article1 {
					_art_list += string(id)+":A1, ";
				}
				with obj_article2 {
					_art_list += string(id)+":A2, ";
				}
				with obj_article3 {
					_art_list += string(id)+":A3, ";
				}
				with obj_article_platform {
					_art_list += string(id)+":AP, ";
				}
				with obj_article_solid {
					_art_list += string(id)+":AS, ";
				}
			}
			cmd_print(_str_raw,_art_list);
			break;
		case "new": //The cooler spawn
			var _hitbox_index = 1;
			var _hit;
			with debug_selected[0] {
				while get_hitbox_value(attack,_hitbox_index,HG_LIFETIME) != 0 && get_hitbox_value(attack,_hitbox_index,HG_HITBOX_X) != 0 _hitbox_index++;
				_hit = create_hitbox(attack,1,_x,_y);
				_hit.hbox_num = _hitbox_index;
			}
			debug_selected[0] = _hit;
			cmd_command(["set","hbox_num",string(_hitbox_index)],"",true);
			cmd_print("","Added Hitbox "+string(_hitbox_index)+"...");
			break;
		// case "peace": //Make enemies not attack
		// 	with obj_stage_article if num == 6 peace = !peace;
		// 	cmd_print(_str_raw,"Aethers' rivalry toggled");
		// 	break;
		// case "save_output":
		// 	cmd_save_output = !cmd_save_output;
		// 	break;
		case "select": //Add an ID to selection
			if !debug {
				cmd_print(_str_raw,"Error: Need to be LUCID");
				break;
			}
			if array_length_1d(_str_a) < 2 {
				cmd_print(_str_raw,"Error: Object ID Req.");
				break;
			}
			var _index = array_find_index(debug_selected,string_digits(_str_a[1]));
			if _index != -1 {
				debug_selected = array_cut(debug_selected,_index);
				cmd_print(_str_raw,"Removed "+_str_a[1]+" from selection.");
				break;
			}
			array_push(debug_selected,string_digits(_str_a[1]));
			cmd_print(_str_raw,"Added "+_str_a[1]+" to selection.");
			break;
		case "s":
		case "set": //Set a varable for selected objects
			if !debug {
				cmd_print(_str_raw,"Error: Need to be LUCID");
				break;
			}
			if array_length_1d(_str_a) < 3 {
				cmd_print(_str_raw,"Error: 2 Args Req.");
				break;
			}
			if array_length_1d(debug_selected) == 0 {
				if string_count("'",_str_a[2]) == 0 {
					variable_instance_set(self,_str_a[1],float(_str_a[2]));
				} else variable_instance_set(self,_str_a[1],_str_a[2]);
				cmd_print(_str_raw,"Set "+_str_a[1]+" to "+_str_a[2]);
				break;
			}
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) if (_str_a[1] in debug_selected[_i]) {
				switch debug_selected[_i].object_index {
					case pHitBox:
						switch _str_a[1] {
							case "shape":
								_str_a[@1] = "sprite_index";
								switch _str_a[2] {
									case 0:
										_str_a[@2] = "hitbox_circle_spr";
										break;
									case 1:
										_str_a[@2] = "hitbox_square_spr";
										break;
									case 2:
										_str_a[@2] = "hitbox_rounded_rectangle";
										break;
								}
								break;
						}
						break;
				}
				if string_count("'",_str_a[2]) == 0 {
					variable_instance_set(debug_selected[_i],_str_a[1],float(_str_a[2]));
				} else variable_instance_set(debug_selected[_i],_str_a[1],_str_a[2]);
			}
			cmd_print(_str_raw,"Set "+_str_a[1]+" to "+_str_a[2]+" on selected.");
			break;
		
		case "s_state": //Save Player States
			var _variable_names;
			var _state_num = state_cur;
			if array_length_1d(_str_a) > 1 _state_num = real(_str_a[1]);
			with oPlayer {
				while array_length_1d(state_array) < _state_num+1 state_array = array_push(state_array, []);
				state_array[_state_num] = [];
				state_array[_state_num] = array_push(state_array[_state_num], ["x",x]);
				state_array[_state_num] = array_push(state_array[_state_num], ["y",y]);
				_variable_names = variable_instance_get_names(id);
				for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
					if !(_in(_variable_names[_i],other.excluded_vars)) state_array[_state_num] = array_push(state_array[_state_num],[_variable_names[_i],variable_instance_get(id,_variable_names[_i])]);
					// if !(phrase_in(_variable_names[_i],other.keyword_ban)) state_array[_state_num] = array_push(state_array[_state_num],[_variable_names[_i],variable_instance_get(id,_variable_names[_i])]);
				}
				while array_length_1d(hurtbox_array) < _state_num+1 hurtbox_array = array_push(hurtbox_array, []);
				with pHurtBox {
					if playerID == other.id with other {
						hurtbox_array[_state_num] = [];
						// hurtbox_array[_state_num] = array_push(hurtbox_array[_state_num], ["sprite_index",sprite_index]);
						// hurtbox_array[_state_num] = array_push(hurtbox_array[_state_num], ["mask_index",mask_index]);
						_variable_names = variable_instance_get_names(other);
						// print(_variable_names);f 
						for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
							hurtbox_array[_state_num] = array_push(hurtbox_array[_state_num],[_variable_names[_i],variable_instance_get(other,_variable_names[_i])]);
						}
					}
				}
				while array_length_1d(hitbox_array) < _state_num+1 hitbox_array = array_push(hitbox_array, []); //Expand
				hitbox_array[@_state_num] = []; //Reset
				with pHitBox {
					if player_id == other.id with other {
						hitbox_array[@_state_num] = array_push(hitbox_array[_state_num], []); //New Hitbox
						var _end = array_length_1d(hitbox_array[_state_num])-1;
						hitbox_array[@_state_num][@_end] = [];
						hitbox_array[@_state_num][@_end] = array_push(hitbox_array[_state_num][_end],["attack",other.attack]);
						hitbox_array[@_state_num][@_end] = array_push(hitbox_array[_state_num][_end],["hbox_num",other.hbox_num]);
						_variable_names = variable_instance_get_names(other);
						for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
							hitbox_array[@_state_num][@_end] = array_push(hitbox_array[_state_num][_end],[_variable_names[_i],variable_instance_get(other,_variable_names[_i])]);
						}
					}
				}
				art_array_save(obj_article1, article1_array,_state_num);
				art_array_save(obj_article2, article2_array,_state_num);
				art_array_save(obj_article3, article3_array,_state_num);
				art_array_save(obj_article_platform, articlep_array,_state_num);
				art_array_save(obj_article_solid, articles_array,_state_num);
				// while array_length_1d(article1_array) < _state_num+1 article1_array = array_push(article1_array, []); //Expand
				// article1_array[@_state_num] = []; //Reset
				// with obj_article1 {
				// 	if player_id == other.id {
				// 		other.article1_array[@_state_num] = array_push(other.article1_array[_state_num], []); //New Article
				// 		var _end = array_length_1d(other.article1_array[_state_num])-1;
				// 		other.article1_array[@_state_num][@_end] = [];
				// 		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["num",num]);
				// 		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["x",x]);
				// 		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["y",y]);
				// 		_variable_names = variable_instance_get_names(self);
				// 		for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
				// 			other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],[_variable_names[_i],variable_instance_get(self,_variable_names[_i])]);
				// 		}
				// 	}
				// }
				
				// print(article1_array);
			}
			with obj_article2 {
				
			}
			with obj_article3 {
				
			}
			cmd_print(_str_raw,"Saved State "+string(_state_num));
			break;
		case "l_state": //Load Player States
			var _state_num = 0;
			var _i = 0;
			if array_length_1d(_str_a) > 1 _state_num = real(_str_a[1]);
			with pHitBox instance_destroy(self);
			with obj_article1 instance_destroy(self);
			with obj_article2 instance_destroy(self);
			with obj_article3 instance_destroy(self);
			with obj_article_platform instance_destroy(self);
			with obj_article_solid instance_destroy(self);
			with oPlayer {
				with pHurtBox {
					if player == other.player with other {
						_i = 0;
						repeat array_length_1d(hurtbox_array[_state_num]) variable_instance_set(other,hurtbox_array[_state_num][_i][0],hurtbox_array[_state_num][_i++][1]);
					}
				}
				if array_length_1d(state_array) == 0 break;
				_i = 0;
				var _j = 0;
				
				repeat array_length_1d(hitbox_array[_state_num]) {
					_j = 0;
					// var _end = array_length_1d(hitbox_array[_state_num])-1;
					// if array_length_1d(hitbox_array[_state_num][_end]) > 0 {
					var _id = create_hitbox(hitbox_array[_state_num][_i][0][1],hitbox_array[_state_num][_i][1][1],0,0);
					repeat array_length_1d(hitbox_array[_state_num][_i]) variable_instance_set(_id,hitbox_array[_state_num][_i][_j][0],hitbox_array[_state_num][_i][_j++][1]);
					_i++;
					// }
				}
				_i = 0;
				repeat array_length_1d(state_array[_state_num]) variable_instance_set(self,state_array[_state_num][_i][0],state_array[_state_num][_i++][1]);
				art_array_load("obj_article1",article1_array,_state_num);
				art_array_load("obj_article2",article2_array,_state_num);
				art_array_load("obj_article3",article3_array,_state_num);
				art_array_load("obj_article_platform",articlep_array,_state_num);
				art_array_load("obj_article_solid",articles_array,_state_num);
				// _i = 0;
				// repeat array_length_1d(article1_array[_state_num]) {
				// 	_j = 0;
				// 	var _id = instance_create(floor(article1_array[_state_num][_i][1][1]),floor(article1_array[_state_num][_i][2][1]),"obj_article1",article1_array[_state_num][_i][0][1]);
				// 	repeat array_length_1d(article1_array[_state_num][_i]) variable_instance_set(_id,article1_array[_state_num][_i][_j][0],article1_array[_state_num][_i][_j++][1]);
				// 	_i++;
				// }
				
			}
			
			cmd_print(_str_raw,"Loaded State "+string(_state_num));
			break;
		// case "sl": //Save/load Player States
		// 	cmd_command(["s_state"],_str_raw,false);
		// 	cmd_command(["l_state"],_str_raw, false);
		// 	break;
		// case "spawn":
		// 	if array_length_1d(_str_a) < 1 {
		// 		cmd_print(_str_raw,"Error: More Args Req.");
		// 		break;
		// 	}
		// 	switch _str_a[2] {
		// 		case "0":
		// 			_str_a[@2] = "obj_stage_article";
		// 			break;
		// 		case "1":
		// 			_str_a[@2] = "obj_stage_article_platform";
		// 			break;
		// 		case "2":
		// 			_str_a[@2] = "obj_stage_article_solid";
		// 			break;
		// 	}
		// 	var _handl = instance_create(floor(mouse_x),floor(mouse_y),_str_a[2],real(string_digits(_str_a[1])));
		// 	while array_length_1d(_str_a) < 12 array_push(_str_a, 0);
		// 	var _art_pos = grid_to_cell([_handl.x,_handl.y]);
		// 	with _handl {
		// 		spawn_variables = array_slice(_str_a,4,8);
		// 		room_manager = other.room_manager;
		// 		og_depth = real(string_digits(_str_a[3]));
		// 		depth = og_depth;
		// 		cell_size = room_manager.cell_size;
		// 		init_pos = [_art_pos[0][0]/16,_art_pos[0][1]/16];
		// 		cell_pos = [_art_pos[1][0],_art_pos[1][1]];
		// 		debug = other.debug;
		// 	}
		// 	cmd_print(_str_raw,"Spawned <"+string(_str_a[2])+":"+string(_str_a[1])+">");
			// print(_handl.spawn_variables);
			break;
		case "man": //Help Manual
		case "help":
			cmd_print(_str_raw,"Valid commands:
			<selected> destroy
			<selected> edit [attack]
			<selected> export
			<selected> freeze <frame/window> <./frame>
			<selected> get [var]
			god
			help
			kill
			list [selected/s]
			l_state
			<selected> man <num>
			select [id]
			<selected> set [var] [value]
			s_state
			");
			break;
		case "":
			break;
		default:
			cmd_print(_str_raw,"Error: Command "+_str_a[0]+" not found. Type 'help' for command list.");
			break;
	}
}
sup_out = false;
return true;

#define cmd_print(_cmd_str,_str)
if sup_out return true;
var _str1 = "";
if _cmd_str == "" _str1 = "";
else _str1 = break_string(_cmd_str,cmd_w,10000,0) + "
";
var _str2 = "";
if _str == "" _str2 = "
";
else _str2 = break_string(_str,cmd_w,10000,0) + "
";
cmd_output += _str1 + _str2;
if !cmd_save_output cmd_output = parse_lines(cmd_output,cmd_w,cmd_h,16,-1);
return true;
#define string_parse(_str,_delim) // BECAUSE THIS ISN'T DEFAULT FOR SOME REASON
_str = string_lower(_str); //Not case-sensitive
var _consol_parse = array_create(0);
var j = 1;
var k = 0;
for (var i = 0; i < string_length(_str);i++) {
    if string_char_at(_str,i) == _delim {
        _consol_parse[k] = string_copy(_str,j,i-j);
        j = i+1;
        k++;
    }
}
_consol_parse[k] = string_copy(_str,j,i-j+1);

return _consol_parse;
#define collision_circle_all(_x,_y,_r,_obj)
var _collis_array = [];
with _obj if point_distance(x,y,_x,_y) < _r array_push(_collis_array,id);
return _collis_array;
#define collision_rectangle_all(_x,_y,_l,_h,_obj)
var _collis_array = [];
with _obj if abs(x-_x) < _l && abs(y-_y) < _h array_push(_collis_array,id);
return _collis_array;

#define in_rect(_x,_y,_x1,_y1,_x2,_y2)
// if abs(_x-_xp) < abs(_x-_x2) && abs(_y-_yp) < abs(_y-_y2) return true;
if _x < _x2 && _x > _x1 && _y < _y2 && _y > _y1 return true;
return false;
#define array_cut(_array, _index)
var _array_cut = array_create(array_length_1d(_array)-1);
var j = 0;
for (var i = 0; i < array_length_1d(_array); i++) {
	if i != _index {
		_array_cut[@j] = _array[i];
		j++;
	}
}
return _array_cut;

// #define float(_str)
// var _arr = string_split(_str,".");
// if _arr[0] == "" _arr[0] = "0"; //Crash Fix - Cannot convert "" to a number
// if array_length_1d(_arr) == 1 return real(_arr[0]); //Real
// if _arr[1] == "" _arr[1] = "0"; //Crash Fix
// return real(_arr[0])+real(_arr[1])/(power(10,string_length(_arr[1]))); //Float

#define break_string(str, w, h, s_line) //From Soup :)

if str == 0 return "";

var final_str = "";
var line = 0;
var len = string_length(final_str);
var prev_char = "";
var char = "";
for (var i = 1; i <= string_length(str); i++) {
    char = string_char_at(str,i);
    if string_width(final_str+char) > w { //if string_width_ext(final_str + char, sep, w) > w { 
    	line++;
		// if line-s_line == l_count return final_str;
        final_str = string_delete(final_str,len,1);
        final_str += "
";
		if line == s_line final_str = "";
		if line > s_line && string_height(final_str) > h return final_str;
		prev_char =  string_char_at(str,i-(i > 0));
		if prev_char != " " final_str += prev_char;
		if char != " " final_str += char;
    } else {
        final_str += char;
    }
    
    len = string_length(final_str);
}
return final_str;

#define break_rev_string(_str,_w,_h,_sep,_s_line) // Break a string from the end first
var _f_str = "";
var _line = string_height_ext(_str,_sep,_w)/(_sep+string_height_ext("I",_sep,1000)); // Max lines
var _char = '';
for (var _i = string_length(_str);_i > 0;_i--) {
	_char = string_char_at(_str,_i);
}
return true;

#define string_split(s,d) //Ty YAL for the great blog post about this alg!
// var s = argument[0], d = argument[1];
// var rl = global.string_split_list;
var rl = [];
var p = string_pos(d, s);
var dl = string_length(d);

if (dl) while (p) {
    p -= 1;
    // ds_list_add(rl, string_copy(s, 1, p));
    array_push(rl, string_copy(s, 1, p));
    s = string_delete(s, 1, p + dl);
    p = string_pos(d, s);
}
// ds_list_add(rl, s);
array_push(rl, s);
return rl;

#define parse_lines(_str, _w, _h, _sep, _s_line) //Parse existing string
var _f_str = _str;
while string_height_ext(_f_str,_sep,_w) > _h _f_str = string_delete(_f_str,1,1);
return _f_str;

#define _in(_val,_array) //If a value is in an array
// for (var _i = 0; _i < array_length_1d(_array);_i++) if _val == _array[_i] return true;
var _i = 0;
repeat array_length_1d(_array) if _val == _array[_i++] return true;

return false;

#define a_vector(_l,_a)
var _xa = _l*dcos(_a);
var _ya = -_l*dsin(_a);
return [_xa,_ya];

#define freeze_obj(_obj)

with _obj {
	freeze = !freeze;
	freeze_x = x;
	freeze_y = y;
}

return;

#define shv(_att, _hn, _hg, _val) //set_hitbox_value short & to string
return "set_hitbox_value("+att_name(_att)+", "+string(_hn)+", "+string(_hg)+", "+string(_val)+");
";

#define att_name(_att)
switch _att {
	case 1:
		return "AT_JAB";
	case 4:
		return "AT_FTILT";
	case 5:
		return "AT_DTILT";
	case 6:
		return "AT_UTILT";
	case 7:
		return "AT_FSTRONG";
	case 8:
		return "AT_DSTRONG";
	case 9:
		return "AT_USTRONG";
	case 10:
		return "AT_DATTACK";
	case 11:
		return "AT_FAIR";
	case 12:
		return "AT_BAIR";
	case 13:
		return "AT_DAIR";
	case 14:
		return "AT_UAIR";
	case 15:
		return "AT_NAIR";
	case 16:
		return "AT_FSPECIAL";
	case 17:
		return "AT_DSPECIAL";
	case 18:
		return "AT_USPECIAL";
	case 19:
		return "AT_NSPECIAL";
	case 20:
		return "AT_FSTRONG_2";
	case 21:
		return "AT_DSTRONG_2";
	case 22:
		return "AT_USTRONG_@";
}
return "";

#define keyboard_has(_ch)
if string_count(_ch,keyboard_string) {
	keyboard_string = "";
	return true;
}
return false;
#define macro_resolve(_s)
switch _s {
	case "AT_JAB":
		return AT_JAB;
}
return "";
#define array_clone_deep(_array)
var _array_d_clone = [];
for(var _i = 0;_i < array_length_1d(_array);_i++) {
	if array_length_1d(_array[_i]) > 0 array_push(_array_d_clone,array_clone_deep(_array[_i]));
	else array_push(_array_d_clone,_array[_i]);
}
return _array_d_clone;

#define art_array_save(article_obj, article1_array,_state_num)
while array_length_1d(article1_array) < _state_num+1 article1_array = array_push(article1_array, []); //Expand
article1_array[@_state_num] = []; //Reset
with article_obj {
	if player_id == other.id {
		other.article1_array[@_state_num] = array_push(other.article1_array[_state_num], []); //New Article
		var _end = array_length_1d(other.article1_array[_state_num])-1;
		other.article1_array[@_state_num][@_end] = [];
		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["num",num]);
		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["x",x]);
		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["y",y]);
		_variable_names = variable_instance_get_names(self);
		for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
			other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],[_variable_names[_i],variable_instance_get(self,_variable_names[_i])]);
		}
	}
}
return article1_array;

#define art_array_load(article_obj,article1_array,_state_num)
var _i = 0;
var _j = 0;

repeat array_length_1d(article1_array[_state_num]) {
	_j = 0;
	var _id = instance_create(floor(article1_array[_state_num][_i][1][1]),floor(article1_array[_state_num][_i][2][1]),article_obj,article1_array[_state_num][_i][0][1]);
	repeat array_length_1d(article1_array[_state_num][_i]) variable_instance_set(_id,article1_array[_state_num][_i][_j][0],article1_array[_state_num][_i][_j++][1]);
	_i++;
}
return;
#define draw_text_drop(_x,_y,_str,_sep,_w,_x1,_y1,_ang,_alp)

draw_text_ext_transformed_color(_x+2,_y+2,_str,_sep,_w,_x1,_y1,_ang,c_black,c_black,c_black,c_black,_alp);
draw_text_ext_transformed_color(_x,_y,_str,_sep,_w,_x1,_y1,_ang,c_white,c_white,c_white,c_white,_alp);

#define draw_square(_x,_y,_s,_color)
draw_rectangle_color(_x-edit_side/2,_y-edit_side/2,_x+edit_side/2,_y+edit_side/2,_color,_color,_color,_color,false); //Fill
return;
#define draw_edit_box(_x1,_y1,_x2,_y2,_color)
draw_rectangle_color(_x1,_y1,_x2,_y2,_color,_color,_color,_color,true); //Outline

var _xm = (_x1+_x2)/2;
var _ym = (_y1+_y2)/2;

draw_line_color(_xm,(_y1+_ym)/2,_xm,(_y2+_ym)/2,_color,_color);
draw_line_color((_x1+_xm)/2,_ym,(_x2+_xm)/2,_ym,_color,_color);


//Angle stuff
if variable_instance_exists(other,"kb_angle") {
	var _angle = other.kb_angle;
	if _angle == 361 {
		if other.player_id.free _angle = 40;
		else _angle = 45;
	}
	var _v = a_vector(a_length,_angle);
	draw_line_color(_xm,_ym,_xm+_v[0],_ym+_v[1],_color,_color);
	draw_circle_color(_xm+_v[0],_ym+_v[1],4,_color,_color, false);
	if mb_l_click draw_debug_text(floor(_xm+_v[0]),floor(_ym+_v[1]),string(_angle));
}

draw_square(_xm,_y1,edit_side,_color);
draw_square(_xm,_y2,edit_side,_color);
draw_square(_x1,_ym,edit_side,_color);
draw_square(_x2,_ym,edit_side,_color);
return;

