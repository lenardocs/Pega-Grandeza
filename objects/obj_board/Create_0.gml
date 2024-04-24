/// @description Insert description here

// Aleatoriza a seed do jogo
randomize();

alarm[0] = 60*3;
victory = false;

// Criando o array com os valores das casas
values = ds_list_create();

// Inserindo os valores na lista de valores
ds_list_add(values,"Δt","=","t","-","to","ΔS","=","S","-","So",
"ΔV","=","V","-","Vo","Vm","=","ΔS","/","Δt","am","=","ΔV","/","Δt",
"S","=","So","+","V","x","t","V","=","Vo","+","a","x","t",
"S","=","So","+","Vo","x","t","+","1/2","x","a","x","t²",
"V","=","Vo²","+","2","x","a","x","ΔS");

// Randomizando os valores das casas
ds_list_shuffle(values);

// Instancia o dado
instance_create_depth(56,80,0,obj_dice);

// Largura e altura do tabuleiro
board_width = 13; // _i
board_height = 6; // _j

// Instanciando as casas do tabuleiro
var _cont = 0;
var _startPos = 0;
var _playerTurn = 0;
var _cellId = 0;
for(var _i=0; _i<board_height; _i++) {
	
	for(var _j=0; _j<board_width; _j++) {
		
		var _x1 = (x + 56) + _j*48;
		var _y1 = (y + 48) + _i*48;
		var _inst = noone;
		
		// Elimina a criação de algumas casas das pontas
		if(_j > 0 && _j < 12) _inst = instance_create_depth(_x1,_y1,3,obj_cell);
		
		// Instancia os jogadores
		switch(global.totalPlayers) {
			case 2:
				if(_i==0 && _j==0 || _i==0 && _j==12) {
					var _player = instance_create_depth(_x1,_y1,2,obj_player);
					_player.image_index = _playerTurn;
					_player.myTurn = _playerTurn;
					_playerTurn++;
					_player.destX = _x1;
					_player.destY = _y1;
					
					var _card = instance_create_depth(352,496,1,obj_card);
					_card.myTurn = _player.myTurn;
				}
			break;
			case 3:
				if(_i==0 && _j==0 ||
				   _i==5 && _j==0 ||
				   _i==0 && _j==12) {
						var _player = instance_create_depth(_x1,_y1,2,obj_player);
						_player.image_index = _playerTurn;
						_player.myTurn = _playerTurn;
						_playerTurn++;
						_player.destX = _x1;
						_player.destY = _y1;
						
						var _card = instance_create_depth(352,496,1,obj_card);
						_card.myTurn = _player.myTurn;
				   }
			break;
			case 4:
				if(_i==0 && _j==0 ||
				   _i==5 && _j==0 ||
				   _i==0 && _j==12||
				   _i==5 && _j==12) {
						var _player = instance_create_depth(_x1,_y1,2,obj_player);
						_player.image_index = _playerTurn;
						_player.myTurn = _playerTurn;
						_playerTurn++;
						_player.destX = _x1;
						_player.destY = _y1;
						
						var _card = instance_create_depth(352,496,1,obj_card);
						_card.myTurn = _player.myTurn;
				   }
			break;
		}
		
		// Instancia as únicas casas da ponta
		if(_i==0 && _j==0 ||
		   _i==5 && _j==0 ||
		   _i==0 && _j==12||
		   _i==5 && _j==12) {
				_inst = instance_create_depth(_x1,_y1,3,obj_cell);
				_inst.type = "Start";
				_startPos++;
				_inst.startPos = _startPos;
				_cellId++;
				_inst.ID = _cellId;
		}
		
		else if(_i==0 && _j==4 ||
			_i==5 && _j==4 ||
			_i==0 && _j==8 ||
			_i==5 && _j==8) {
				_inst.type = "Yellow_Cell";
				_cellId++;
				_inst.ID = _cellId;
		}
			
		else if(_i==1 && _j==6 ||
			_i==4 && _j==6) {
				_inst.type = "Red_Cell";
				_cellId++;
				_inst.ID = _cellId;
		}
			
		else if(_j > 0 && _j < 12) {
			_inst.type = "Blue_Cell";
			_inst.value = values[| _cont];
			_cellId++;
			_inst.ID = _cellId;
			_cont++;
		}
		
	}
	
}


// Criando as conexões entre as casas
var _num = instance_number(obj_cell);
for (var i = 0; i < _num; i++) {
    
	var _inst = instance_find(obj_cell, i);
	var _near = -1;
	var _x = i;
	
	switch(_inst.type) {
		
		case "Start":
			if(i==0 || i==57) {
				_near = instance_find(obj_cell, _x + 1);
				ds_list_add(_inst.connections, _near);
				ds_list_add(_near.connections, _inst);
			}
			else {
				_near = instance_find(obj_cell, _x - 1);
				ds_list_add(_inst.connections, _near);
				ds_list_add(_near.connections, _inst);
			}
		break;
		
		case "Yellow_Cell":
			if(i==4 || i==8) {
				_near = instance_find(obj_cell, _x + 12);
				ds_list_add(_inst.connections, _near);
				ds_list_add(_near.connections, _inst);
			}
			else {
				_near = instance_find(obj_cell, _x - 12);
				ds_list_add(_inst.connections, _near);
				ds_list_add(_near.connections, _inst);
			}
		break;
		
		case "Red_Cell":
			if(i==18) {
				_near = instance_find(obj_cell, _x - 12);
				ds_list_add(_inst.connections, _near);	
			}
			else {
				_near = instance_find(obj_cell, _x + 12);
				ds_list_add(_inst.connections, _near);		
			}
		break;
		
		case "Blue_Cell":
			
			_near = instance_find(obj_cell, _x + 1);
			if(_near.type == "Blue_Cell") {
				// Evita que as azuis da ponta tentem se ligar com as abaixo
				if(i!=23 && i!=34 && i!=45 && i!=56)
					ds_list_add(_inst.connections, _near);
			}
			
			// Conecta todas as casas à esquerda
			_near = instance_find(obj_cell, _x - 1);
			if(_near.type == "Blue_Cell") {
				// Evita que as azuis da ponta tentem se ligar com as abaixo
				if(i!=13 && i!=24 && i!=35 && i!=46)
					ds_list_add(_inst.connections, _near);
			}
			
			// Conecta as casas da primeira linha às casas de baixo
			if(i < 12) {
				_near = instance_find(obj_cell, _x + 12);
				ds_list_add(_inst.connections, _near);
			}
			// Conecta as casas da última linha às casas de cima
			else if(i > 57 && i < 69) {
				_near = instance_find(obj_cell, _x - 12);
				ds_list_add(_inst.connections, _near);	
			}
			// Conecta as demais filas às casas acima e abaixo
			else {
				
				// Conecta os de baixo
				if(i > 45 && i < 57) {
					_near = instance_find(obj_cell, _x + 12);
					if(_near.type == "Blue_Cell") ds_list_add(_inst.connections, _near);	
				}
				else {
					if(i!=24 && i!=14 && i!=40 && i!=22 && i!=28 && i!=29 && i!=30 && i!=34 && i!=36 && i!=44) {
						_near = instance_find(obj_cell, _x + 11);
						ds_list_add(_inst.connections, _near);	
					}
				}
				
				// Conecta os de cima
				if(i > 12 && i < 24) {
					_near = instance_find(obj_cell, _x - 12);
					if(_near.type == "Blue_Cell") ds_list_add(_inst.connections, _near);
				}
				else {
					if(i!=35 && i!=39 && i!=40 && i!=41 && i!=45 && i!=25 && i!=33 && i!=47 && i!=55) {
						_near = instance_find(obj_cell, _x - 11);
						if(_near.type == "Blue_Cell") ds_list_add(_inst.connections, _near);	
					}	
				}
				
			}
			
		break;
		
	}
	
}
