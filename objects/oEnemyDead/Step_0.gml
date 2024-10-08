/// @description Update Dead Enemy

if (done == 0)
{
	//Calculate Movement
	vsp = vsp + grv;

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
		if (vsp > 0)
		{
			done = 1;
			image_index = 1;
		}
		
		while (!place_meeting(x, y+sign(vsp), oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;	
	}

	y = y + vsp;
}