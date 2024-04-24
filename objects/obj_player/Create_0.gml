/// @description Insert description here
// You can write your code in this editor

// Movement
spd = 1.5;
hSpd = 0.0;
vSpd = 0.0;

destX = 0;
destY = 0;

moveCount = 0;
alreadyMoved = false;

// State
state = player_movement;

// Guard cells player already visited
canReturnPath = ds_list_create();

// In case player hit yellow
hitYellow = false;

// Define player round
myTurn = 0;

// Define the value the player got from the board
myValue = "";

// Define how many cells left for win
totalToWin = 61;

color = [0,0,0];

scale = 1;
dir = 1;
