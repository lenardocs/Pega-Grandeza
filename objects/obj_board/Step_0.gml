/// @description Insert description here

var _dice = obj_dice
switch(global.totalPlayers) {
	case 2:
	
	switch(global.actualTurn) {
		case 0:
			_dice.x = 56;
			_dice.y = 80;
		break;
		case 1:
			_dice.x = 632;
			_dice.y = 80;
		break;
	}
	
	break;
	case 3:
	
	switch(global.actualTurn) {
		case 0:
			_dice.x = 56;
			_dice.y = 80;
		break;
		case 1:
			_dice.x = 632;
			_dice.y = 80;
		break;
		case 2:
			_dice.x = 56;
			_dice.y = 255;
		break;
	}
	
	break;
	case 4:
	
	switch(global.actualTurn) {
		case 0:
			_dice.x = 56;
			_dice.y = 80;
		break;
		case 1:
			_dice.x = 632;
			_dice.y = 80;
		break;
		case 2:
			_dice.x = 56;
			_dice.y = 255;
		break;
		case 3:
			_dice.x = 632;
			_dice.y = 255;
		break;
	}
	
	break;
}

var _player = noone;
with(obj_player) {
	if(global.actualTurn == self.myTurn) _player = self;
}

if(_player.totalToWin == 0 || keyboard_check_pressed(ord("O"))) {
	victory = true;
	_player.totalToWin++;
	alarm[1] = 60*2;
}

