/// @description Update Reload

x = oPlayer.x;
y = oPlayer.y - 40;

timer --;

if (timer <= 0) {
	instance_destroy();
}