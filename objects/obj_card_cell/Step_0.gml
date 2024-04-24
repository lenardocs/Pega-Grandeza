/// @description Insert description here

var _mx = mouse_x;
var _my = mouse_y;
var _click = mouse_check_button_pressed(mb_left);

var _x1 = x;
var _y1 = y;
var _wSpr = sprite_get_width(spr_card_cell)/2;
var _hSpr = sprite_get_height(spr_card_cell)/2;

var _player = noone;
with(obj_player) {
	if(self.myTurn == global.actualTurn) _player = self;	
}
	
if(point_in_rectangle(_mx,_my,_x1 - _wSpr,_y1 - _hSpr,_x1 + _wSpr,_y1 + _hSpr)) {
	
	if(_click && _player.myValue == myValue && !picked) {
		picked = true;
		_player.totalToWin--;
		_player.myValue = "";
		obj_button.moveCardDown = true;
	}
	
}

var _card = noone;
with(obj_card) {
	if(self.myTurn == global.actualTurn) _card = self;	
}

if(picked && !_card.up && cont == 0 && _player.totalToWin > 0) {
	cont++;
	global.changeTurn = true;
	global.showNextPlayer = true;
	if(_player != noone) reset_path(_player);
}


