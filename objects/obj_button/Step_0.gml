/// @description Insert description here

depth = 3;
var _mx = mouse_x;
var _my = mouse_y;
var _click = mouse_check_button_pressed(mb_left);

var _x1 = x;
var _y1 = y;
var _wSpr = sprite_get_width(spr_button)/2;
var _hSpr = sprite_get_height(spr_button)/2;

hover = false;
if(point_in_rectangle(_mx,_my,_x1 - _wSpr,_y1 - _hSpr,_x1 + _wSpr,_y1 + _hSpr)) {
	hover = true;
	
	if(_click && !changeDir) {
		moveCardUp = true;
	}
	else if(_click && changeDir) {
		moveCardDown = true;
	}
	
}

if(moveCardUp) image_index = 1;
else if(moveCardDown) image_index = 0;

