/// @description Update Gun (Behind Player)
//Begin Step causes object to be 1 frame behind the player adding weight anim

//Allign gun to player
if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
	x = oPlayer.x - 12;
}
else
{
	image_yscale = 1;
	x = oPlayer.x + 12;
}
y = oPlayer.y + 10;

//Orient Gun to mouse or to controller
image_angle = point_direction(x,y, mouse_x,mouse_y);

if (oPlayer.controller == 0)
{
	image_angle = point_direction(x,y, mouse_x,mouse_y);
}
else
{
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2)
	{
		controllerangle = point_direction(0,0,controllerh,controllerv);
	}
	image_angle = controllerangle;
}

firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);

//Spawn new bullets with mouse click or controller trigger
if ((mouse_check_button(mb_left)) || gamepad_button_check(0,gp_shoulderrb)) && (firingdelay < 0)
{
	recoil = 4;
	firingdelay = 5;
	with (instance_create_layer(x, y, "Bullets", oBullet))
	{
		speed = 25;
		direction = other.image_angle + random_range(-3, 3);  //has random spread
		//other in with corresponds to the gun and not the bullet
		image_angle = direction;  //changes the image of the bullet itself
	}
}

//Recoil Adjustment
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

