/// @description Check Enemy Collision

with (other) //returns id of obj of collision
{
	hp--;
	flash = 3;
	hitfrom = other.direction;
}

instance_destroy();