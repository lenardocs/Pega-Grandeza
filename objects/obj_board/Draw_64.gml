/// @description Insert description here

var _wDisplay = display_get_gui_width();
var _hDisplay = display_get_gui_height();

draw_set_font(fnt_pixel);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _x1 = _wDisplay/2;
var _y1 = _hDisplay/2;
var _turn = global.actualTurn+1;

var _player = noone;
with(obj_player) {
	if(self.myTurn == global.actualTurn) _player = self;	
}

var _r = _player.color[0];
var _g = _player.color[1];
var _b = _player.color[2];
var _color = make_color_rgb(_r,_g,_b);

if(global.showNextPlayer) {
	draw_text_transformed_color(_x1-3,_y1-15,"Vez do Jogador " + string(_turn) + "!",4,4,1,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(_x1+3,_y1-15,"Vez do Jogador " + string(_turn) + "!",4,4,1,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(_x1-3,_y1-12,"Vez do Jogador " + string(_turn) + "!",4,4,1,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(_x1-3,_y1-16,"Vez do Jogador " + string(_turn) + "!",4,4,1,c_black,c_black,c_black,c_black,1);
	draw_set_color(_color);
	draw_text_transformed(_x1,_y1-15,"Vez do Jogador " + string(_turn) + "!",4,4,1);
}

if(victory) {
	draw_text_transformed_color(_x1-3,_y1-15,"Jogador " + string(_turn) + " ganhou o jogo!",4,4,1,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(_x1+3,_y1-15,"Jogador " + string(_turn) + " ganhou o jogo!",4,4,1,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(_x1-3,_y1-12,"Jogador " + string(_turn) + " ganhou o jogo!",4,4,1,c_black,c_black,c_black,c_black,1);
	draw_text_transformed_color(_x1-3,_y1-16,"Jogador " + string(_turn) + " ganhou o jogo!",4,4,1,c_black,c_black,c_black,c_black,1);
	draw_set_color(_color);
	draw_text_transformed(_x1,_y1-15,"Jogador " + string(_turn) + " ganhou o jogo!",4,4,1);
}

draw_set_color(c_white);

