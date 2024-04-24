/// @description Insert description here

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if(!picked) {
	var _player = noone;
	with(obj_player) {
		if(self.myTurn == global.actualTurn) _player = self;	
	}
	
	scale += dir * spd;
	if(scale >= 1.4 || scale <= 1) dir *= -1;
	
	if(_player.myValue == myValue && _player.myValue != "") {
		draw_sprite_ext(sprite_index,1,x,y,scale,scale,0,c_white,1);	
	}
	else draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,.5);	
	
	draw_set_font(fnt_geral_min);
	draw_text_color(x,y,myValue,c_black,c_black,c_black,c_black,.5);
}
else {
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,1);
	draw_set_font(fnt_geral_min);
	draw_text_color(x,y,myValue,c_black,c_black,c_black,c_black,1);
}

if(myType == 1) {
	draw_self();
	
	var _player = noone;
	with(obj_player){
		if(self.myTurn == global.actualTurn) _player = self;	
	}
	
	draw_text_color(x,y,_player.myValue,c_black,c_black,c_black,c_black,1);
}

