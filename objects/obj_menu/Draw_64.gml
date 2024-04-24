/// @description Insert description here

var _size = array_length(options);
var _scale = 2;
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _wDisplay = display_get_gui_width();
var _hDisplay = display_get_gui_height();
var _click = mouse_check_button_pressed(mb_left);

draw_set_font(fnt_pixel);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for(var _i=0;_i<_size;_i++) {
	
	var _wStr = string_width(options[_i]);
	var _hStr = 48;
	
	// Top left
	var _x1 = _wDisplay/2 - _wStr/2;
	var _y1 = _hDisplay/2 - _hStr/2 + (_hStr*_i) + 64;
	
	// Bottom right
	var _x2 = _wDisplay/2 + _wStr/2;
	var _y2 = _hDisplay/2 + _hStr/2 + (_hStr*_i) + 64;
	
	if(point_in_rectangle(_mx,_my,_x1,_y1,_x2,_y2)) {
		
		_scale = 2.4;
		if(_click) {
			
			switch(options[_i]) {
				case options[0]:
					showPlayersSelection = !showPlayersSelection;
				break;
				case options[1]:
					game_end();
				break;
			}
			
		}
		
	}
	else _scale = 2;
	
	if(showPlayersSelection) {
		player_selection();	
	}
	
	draw_text_transformed_color((_wDisplay/2)-3,(_hDisplay/2)+(_hStr*_i)+64,options[_i],_scale,_scale,1,c_black,c_black,c_black,c_black,1);
	draw_text_transformed(_wDisplay/2,(_hDisplay/2)+(_hStr*_i)+64,options[_i],_scale,_scale,0);
	
	scale_title += dir * spd;
	if(scale_title >= 1.5 || scale_title <= 1) dir *= -1;
	
	draw_sprite_ext(spr_title,0,(_wDisplay/2),(_hDisplay/4),scale_title,scale_title,1,c_white,1);
	
}

function player_selection() {
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	var _length = array_length(players);
	var _scale = 2;
	var _click = mouse_check_button_pressed(mb_left);
	
	for(var _i=0;_i<_length;_i++) {
		
		var _wDisplay = display_get_gui_width();
		var _hDisplay = display_get_gui_height();
	
		var _wStr = string_width(players[_i]);
		var _hStr = 48;
		
		// Top left
		var _x1 = _wDisplay*0.68 - _wStr/2;
		var _y1 = _hDisplay/2 - _hStr/2 + (_hStr*_i) + 60;
		
		// Bottom right
		var _x2 = _wDisplay*0.68 + _wStr/2;
		var _y2 = _hDisplay/2 + _hStr/2 + (_hStr*_i) + 60;
		
		if(point_in_rectangle(_mx,_my,_x1,_y1,_x2,_y2)) {
			
			_scale = 2.4;
			if(_click) {
				
				switch(players[_i]) {
					case "2 Jogadores":
						global.totalPlayers = 2;
					break;
					case "3 Jogadores":
						global.totalPlayers = 3;
					break;
					case "4 Jogadores":
						global.totalPlayers = 4;
					break;
				}
				
				global.targetRoom = Room1;
				roomTransition(TRANS_TYPE.SLIDE, global.targetRoom);
				
				
			}
			
		}
		else _scale = 2;
		
		draw_text_transformed_color((_wDisplay*0.68)-3,(_hDisplay/2)+(_hStr*_i)+60,players[_i],_scale,_scale,1,c_black,c_black,c_black,c_black,1);
		draw_text_transformed(_wDisplay*0.68,(_hDisplay/2)+(_hStr*_i)+60,players[_i],_scale,_scale,0);
		
	}
}

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);



