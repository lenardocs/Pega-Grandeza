
function player_movement() {
	
	verify_player_click();

	if((distance_to_point(destX,destY) > spd) && canMove) {
		var _dir = point_direction(x,y,destX,destY);
		hSpd = lengthdir_x(spd,_dir);
		vSpd = lengthdir_y(spd,_dir);
	}
	else {
		x = destX;
		y = destY;
		hSpd = 0.0;
		vSpd = 0.0;
		canMove = false;
	}

	x+=hSpd;
	y+=vSpd;
	
}


function verify_player_click() {
	
	var _mx = mouse_x;
	var _my = mouse_y;
	var _click = mouse_check_button_pressed(mb_left);

	var _wSpr = sprite_get_width(spr_cell) - 12;
	var _hSpr = sprite_get_height(spr_cell) - 12;
	var _x1;
	var _y1;
	
	var _cardUp = false;
	var _button = obj_button;
	
	with(obj_card) {
		if(self.up) _cardUp = true;	
	}

	with(obj_cell) {
	
		_x1 = self.x;
		_y1 = self.y;
	
		if(point_in_rectangle(_mx,_my,_x1 - _wSpr,_y1 - _hSpr,_x1 + _wSpr,_y1 + _hSpr)) {
			if(_click && other.moveCount > 0 && other.myTurn == global.actualTurn && !_cardUp) {
				
				var _size = ds_list_size(self.connections);
				var _canMove = false;
				var _connected = false;
				
				for(var _i=0; _i<_size; _i++) {
				
					var _con = self.connections[| _i];
					
					if(_con.playerRef != noone && _con.playerRef.myTurn == global.actualTurn) {
						_connected = true;	
					}
					
					if(self.playerRef == noone && !self.playerHasMovedHere && _connected) {
							_connected = false;
							_canMove = true;
					   }
					
					if(_canMove) {
						
						_canMove = false;
						
						other.destX = _x1;
						other.destY = _y1;	
						other.moveCount--;
						
						if(other.moveCount < 0) {
							with(other) moveCount = 0;
						}
						else if(other.moveCount == 0) {
							other.myValue = self.getValue;
							_button.moveCardUp = true;
							other.alreadyMoved = true;
						}
						
						self.playerHasMovedHere = true;
						_con.playerHasMovedHere = true;
						ds_list_add(other.canReturnPath, self);
						ds_list_add(other.canReturnPath, _con);
						
						if(self.type == "Yellow_Cell") other.hitYellow = true;
						
						if(self.type == "Red_Cell" && other.y <= 95) {
							other.destX = _x1;
							other.destY = 240;
						}
						else if(self.type == "Red_Cell" && other.y >= 240) {
							other.destX = _x1;
							other.destY = 95;
						}
						
						if(other.hitYellow) reset_path(other);
						
					}
				
				}
			
			}
			
		}
	
	}
	
}

function reset_path(_inst) {
	
	var _size = ds_list_size(_inst.canReturnPath);
	for(var _i=0;_i<_size;_i++) {
		var _cell = _inst.canReturnPath[| _i];
		_cell.playerHasMovedHere = false;
	}
	ds_list_clear(_inst.canReturnPath);
	if(!_inst.hitYellow) {
		global.changeTurn = false;
		_inst.alreadyMoved = false;
		global.actualTurn = (global.actualTurn+1) mod global.totalPlayers;
	}
	_inst.hitYellow = false;
	
}



