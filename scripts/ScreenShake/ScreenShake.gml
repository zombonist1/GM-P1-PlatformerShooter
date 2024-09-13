/// @desc ScreenShake(magnitude,frames)
/// @arg Magnitude sets the strength of the shanke (radius in pixels)
/// @arg Frames sets the length of the shake in frames

function ScreenShake(){
	with (oCamera)
	{
		if (argument0 > shake_remain)
		{
			shake_magnitude = argument0;
			shake_remain = argument0;
			shake_length = argument1;
		}
	}
}