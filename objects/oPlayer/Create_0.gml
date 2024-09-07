/// @description Setup Player

//Player Vars
hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4;
var move;

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

controller = 0;