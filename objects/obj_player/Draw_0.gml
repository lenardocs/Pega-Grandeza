/// @description Insert description here

if(myTurn == global.actualTurn) {
	
	scale += dir * 0.01;
	if(scale >= 1.2 || scale <= 1) dir *= -1;
	draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,1);	
}
else {
	draw_self();	
}
