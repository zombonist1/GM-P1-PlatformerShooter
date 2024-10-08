/// @description Update Player

if (hascontrol)
{
	
	//Player Input Detetction
	key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_space);

	if (key_left) || (key_right) || (key_jump)
	{
		controller = 0;
	}

	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
		controller = 1;
	}

	if (gamepad_button_check(0,gp_face1))
	{
		key_jump = 1;
		controller = 1;
	}
}
else
{
	key_left = 0;
	key_right = 0;
	key_left = 0;
}
	

//Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;

//Jump
if (place_meeting(x, y+1, oWall)) && (key_jump)
{
	vsp = -7
}

//Horizontal Collision Check
if (place_meeting(x+hsp, y, oWall))
{
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;	
}

x = x + hsp;

//Vertical Collision Check
if (place_meeting(x, y+vsp, oWall))
{
	while (!place_meeting(x, y+sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;	
}

y = y + vsp;

//Animation Updates
if (!place_meeting(x, y+1, oWall))
{
	sprite_index = sPlayerAirborne;
	image_speed = 0; //for holding on the first sprite in the sheet
	
	if (sign(vsp) > 0)
	{
		image_index = 1;
	}
	else
	{
		image_index = 0;
	}
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerRunning;
	}
}


//Orient Player Based on Direction Movement
if (hsp != 0)
{
	image_xscale = sign(hsp);
}