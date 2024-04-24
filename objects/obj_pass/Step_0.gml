/// @description Insert description here
// You can write your code in this editor

var _mx = mouse_x;
var _my = mouse_y;
var _click = mouse_check_button_pressed(mb_left);

var _x1 = x;
var _y1 = y;
var _wSpr = sprite_get_width(spr_pass)/2;
var _hSpr = sprite_get_height(spr_pass)/2;

var _player = noone;
with(obj_player) {
	if(self.myTurn == global.actualTurn) _player = self;	
}

var _card = noone;
with(obj_card) {
	if(self.myTurn == global.actualTurn) _card = self;	
}

hover = false;
if(point_in_rectangle(_mx,_my,_x1 - _wSpr,_y1 - _hSpr,_x1 + _wSpr,_y1 + _hSpr)) {
	hover = true;
	
	if(_click) {
		if(_card.up) {
			obj_button.moveCardDown = true;
			pass = true;
		}
		else {
			global.changeTurn = true;
			global.showNextPlayer = true;
			_player.moveCount = 0;
			reset_path(_player);	
		}
	}
	
}

if(pass && !_card.up) {
	pass = false;
	global.changeTurn = true;
	global.showNextPlayer = true;
	_player.moveCount = 0;
	reset_path(_player);
}
