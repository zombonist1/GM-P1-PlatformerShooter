/// @description Update Camera

//Update Cam Destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Update Obj Position
x += (xTo - x) / 25; //Moves cam 1/25 of distance a frame for smoothing
y += (yTo - y) / 25;

x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);

//Update Camera View
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);