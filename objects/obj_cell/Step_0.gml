/// @description Insert description here
// You can write your code in this editor

playerRef = noone;

var _num = instance_number(obj_player);
for(var _i=0;_i<_num;_i++) {
	
	var _player = instance_find(obj_player, _i);
	if(place_meeting(x,y,_player)) {
		playerRef = _player;	
	}
	
}

getValue = value;

var _mx = mouse_x;
var _my = mouse_y;

var _x1 = x;
var _y1 = y;
var _wSpr = sprite_get_width(sprite_index)/2;
var _hSpr = sprite_get_height(sprite_index)/2;

hover = false;
if(point_in_rectangle(_mx,_my,_x1 - _wSpr,_y1 - _hSpr,_x1 + _wSpr,_y1 + _hSpr)) {
	hover = true;
}
