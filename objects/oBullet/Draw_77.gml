//Simpler to use collision event with wall but post-draw
//happens after the rendering before destroying the object
//this will shows the bullet hitting the walls if it hits instantly

if (place_meeting(x,y,oWall)) instance_destroy();