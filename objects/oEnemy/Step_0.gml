//Calculate Movement
vsp = vsp + grv;

//Horizontal Collision Check
if (place_meeting(x+hsp, y, oWall))
{
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = -hsp;	
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
	sprite_index = sEnemyAirborne;
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
		sprite_index = sEnemy;
	}
	else
	{
		sprite_index = sEnemyRunning;
	}
}


//Orient Enemy Based on Direction Movement
if (hsp != 0)
{
	image_xscale = sign(hsp);
}