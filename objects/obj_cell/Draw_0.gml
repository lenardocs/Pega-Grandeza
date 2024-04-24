/// @description Insert description here

switch(type) {
	case "Blue_Cell": image_index = 0; break;
	case "Red_Cell": image_index = 2; break;
	case "Yellow_Cell": image_index = 1; break;
	case "Start":
		sprite_index = spr_start_cell;
		switch(startPos) {
			case 1: image_index = 0; break;
			case 2: image_index = 1; break;
			case 3: image_index = 2; break;
			case 4: image_index = 3; break;
		}
	break;
	default: break;
}

if(hover) {
	draw_sprite_ext(sprite_index,image_index,x,y,1.2,1.2,0,c_white,1);
}
else draw_self();

draw_set_font(fnt_geral);
draw_text_color(x,y,value,c_black,c_black,c_black,c_black,1);

if(!ds_list_empty(connections)) {
	
	for(var _i=0; _i<ds_list_size(connections); _i++) {
		
		if(connections[| _i] != noone) {
			// Se a conexão estiver a direita, dará negativo
			var _horizontal = x - connections[| _i].x;
			// Se a conexão estiver em baixo, dará negativo
			var _vertical = y - connections[| _i].y;
			var _sameHeight = y == connections[| _i].y;
			
			if(_horizontal < 0 && _sameHeight) {
				draw_line_width_color(x+16,y,connections[| _i].x-16,connections[| _i].y,4,c_black,c_black);
			}
			else if(_vertical < 0 && !_sameHeight) {
				draw_line_width_color(x,y+16,connections[| _i].x,connections[| _i].y-16,4,c_black,c_black);	
			}
			
		}
		
	}
	
}
