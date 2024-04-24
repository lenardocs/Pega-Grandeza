/// @description Insert description here

switch(type){
	case TRANS_TYPE.SLIDE:
		
		draw_set_color(c_black);
		draw_rectangle(0,0,width,percent*heightHalf,false);
		draw_rectangle(0,height,width,height-(percent*heightHalf),false);
		
	break;
}

draw_set_color(c_white);

