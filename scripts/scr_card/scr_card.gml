
function scr_card(){
	
	var _button = obj_button;
	var _hDisplay = display_get_gui_height();

	if(_button.moveCardUp && myTurn == global.actualTurn) {
		destY = _hDisplay/18;
		
		if(distance_to_point(x,destY) > spd) {
			var _dir = point_direction(x,y,x,destY);
			vSpd = lengthdir_y(spd,_dir);
			y += vSpd;
			
			with(obj_card_cell) {
				if(myTurn == global.actualTurn) {
					y += other.vSpd;	
				}
			}
		}
	
		if(y <= 166) {
			_button.moveCardUp = false;
			_button.changeDir = true;
			up = true;
		}
	}
	else if(_button.moveCardDown && myTurn == global.actualTurn) {
		destY = _hDisplay;
	
		if(distance_to_point(x,destY) > spd) {
			var _dir = point_direction(x,y,x,destY);
			vSpd = lengthdir_y(spd,_dir);
			y += vSpd;
			
			with(obj_card_cell) {
				if(myTurn == global.actualTurn) {
					y += other.vSpd;	
				}
			}
		}
	
		if(y >= 486) {
			_button.moveCardDown = false;
			_button.changeDir = false;
			up = false;
		}
	}
	
}

function generate_forms(turn) {
	
	var _values = ["Δt","=","t","-","to"];
	for(var _i=0; _i<5; _i++) {
		var _wHalf = sprite_get_width(spr_card) * 0.45;
		var _hHalf = sprite_get_height(spr_card) * 0.4;
		var _x = (x -_wHalf) + _i*25;
		var _y = (y - 8 - _hHalf);
		
		var _inst = instance_create_depth(_x,_y,0,obj_card_cell);
		_inst.myValue = _values[_i];
		_inst.myTurn = turn;
	}
	
	_values = ["ΔS","=","S","-","So"];
	for(var _i=0; _i<5; _i++) {
		var _wHalf = sprite_get_width(spr_card) * 0.45;
		var _hHalf = sprite_get_height(spr_card) * 0.4;
		var _x = (x -_wHalf) + _i*25;
		var _y = ((y+26) - 8 - _hHalf);
		
		var _inst = instance_create_depth(_x,_y,0,obj_card_cell);
		_inst.myValue = _values[_i];
		_inst.myTurn = turn;
	}
	
	_values = ["ΔV","=","V","-","Vo"];
	for(var _i=0; _i<5; _i++) {
		var _wHalf = sprite_get_width(spr_card) * 0.24;
		var _hHalf = sprite_get_height(spr_card) * 0.4;
		var _x = (x +_wHalf) + _i*25;
		var _y = (y - 8 - _hHalf);
		
		var _inst = instance_create_depth(_x,_y,0,obj_card_cell);
		_inst.myValue = _values[_i];
		_inst.myTurn = turn;
	}
	
	_values = ["Vm","=","ΔS","/","Δt"];
	for(var _i=0; _i<5; _i++) {
		var _wHalf = sprite_get_width(spr_card) * 0.24;
		var _hHalf = sprite_get_height(spr_card) * 0.4;
		var _x = (x +_wHalf) + _i*25;
		var _y = ((y+26) - 8 - _hHalf);
		
		var _inst = instance_create_depth(_x,_y,0,obj_card_cell);
		_inst.myValue = _values[_i];
		_inst.myTurn = turn;
	}
	
	_values = ["am","=","ΔV","/","Δt"];
	for(var _i=0; _i<5; _i++) {
		var _wHalf = sprite_get_width(spr_card) * 0.1;
		var _hHalf = sprite_get_height(spr_card) * 0.4;
		var _x = (x -_wHalf) + _i*25;
		var _y = ((y+52) - 8 - _hHalf);
		
		var _inst = instance_create_depth(_x,_y,0,obj_card_cell);
		_inst.myValue = _values[_i];
		_inst.myTurn = turn;
	}
	
	_values = ["S","=","So","+","V","x","t"];
	for(var _i=0; _i<array_length(_values); _i++) {
		var _wHalf = sprite_get_width(spr_card) * 0.15;
		var _hHalf = sprite_get_height(spr_card) * 0.4;
		var _x = (x -_wHalf) + _i*25;
		var _y = ((y+130) - 8 - _hHalf);
		
		var _inst = instance_create_depth(_x,_y,0,obj_card_cell);
		_inst.myValue = _values[_i];
		_inst.myTurn = turn;
	}
	
	_values = ["V","=","Vo","+","a","x","t"];
	for(var _i=0; _i<array_length(_values); _i++) {
		var _wHalf = sprite_get_width(spr_card) * 0.15;
		var _hHalf = sprite_get_height(spr_card) * 0.4;
		var _x = (x -_wHalf) + _i*25;
		var _y = ((y+156) - 8 - _hHalf);
		
		var _inst = instance_create_depth(_x,_y,0,obj_card_cell);
		_inst.myValue = _values[_i];
		_inst.myTurn = turn;
	}
	
	_values = ["S","=","So","+","Vo","x","t","+","1/2","x","a","x","t²"];
	for(var _i=0; _i<array_length(_values); _i++) {
		var _wHalf = sprite_get_width(spr_card) * 0.3;
		var _hHalf = sprite_get_height(spr_card) * 0.4;
		var _x = (x -_wHalf) + _i*25;
		var _y = ((y+208) - 8 - _hHalf);
		
		var _inst = instance_create_depth(_x,_y,0,obj_card_cell);
		_inst.myValue = _values[_i];
		_inst.myTurn = turn;
	}
	
	_values = ["V","=","Vo²","+","2","x","a","x","ΔS"];
	for(var _i=0; _i<array_length(_values); _i++) {
		var _wHalf = sprite_get_width(spr_card) * 0.199;
		var _hHalf = sprite_get_height(spr_card) * 0.4;
		var _x = (x -_wHalf) + _i*25;
		var _y = ((y+182) - 8 - _hHalf);
		
		var _inst = instance_create_depth(_x,_y,0,obj_card_cell);
		_inst.myValue = _values[_i];
		_inst.myTurn = turn;
	}
	
	var _wHalf = sprite_get_width(spr_card) * 0.001;
	var _hHalf = sprite_get_height(spr_card) * 0.4;
	var _x = (x - _wHalf);
	var _y = (y - 8 - _hHalf);
	
	var _cell = instance_create_depth(_x,_y,0,obj_card_cell);
	_cell.myType = 1;
	_cell.myTurn = turn;
	
}










