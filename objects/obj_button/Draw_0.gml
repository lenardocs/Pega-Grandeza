/// @description Insert description here

if(hover) {
	var _y1 = y;
	_y1 = pontoY + sin(tempo*frequencia)*amplitude;
	tempo++;
	draw_sprite(spr_button,image_index,x,_y1);
}
else draw_self();

