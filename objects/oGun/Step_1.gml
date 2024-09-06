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

//Orient Gun
image_angle = point_direction(x,y, mouse_x,mouse_y);

firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);

//Spawn new bullets with mouse click
if (mouse_check_button(mb_left)) && (firingdelay < 0)
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

