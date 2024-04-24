/// @description Insert description here
// You can write your code in this editor

var _mx = mouse_x;
var _my = mouse_y;
var _click = mouse_check_button_pressed(mb_left);

var _x1 = x;
var _y1 = y;
var _wSpr = sprite_get_width(spr_dice)/2;
var _hSpr = sprite_get_height(spr_dice)/2;

var _player = noone;
with(obj_player) {
	if(myTurn == global.actualTurn) _player = self;
}

if(point_in_rectangle(_mx,_my,_x1 - _wSpr,_y1 - _hSpr,_x1 + _wSpr,_y1 + _hSpr)) {
	if(_click && _player.moveCount == 0 && !_player.alreadyMoved) {
		anim = true;
		image_index = 0;
	}
}

image_speed = 0;
if(anim) {
	image_speed = 1;
	if(image_index == 5){
		anim = false;
		_player.moveCount = irandom_range(1,6);
		image_index = _player.moveCount-1;	
	}
}
	
