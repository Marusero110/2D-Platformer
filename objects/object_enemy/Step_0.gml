/// @description Insert description here
// You can write your code in this editor

hsp = 1.5 * (dir * walk_speed);
vsp += grv;

//Horizontal Collision
if (place_meeting(x + hsp, y, object_wall)) {
	while (!place_meeting(x + sign(hsp), y, object_wall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
	dir *= -1;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x, y + vsp, object_wall)) {
	while (!place_meeting(x, y + sign(vsp), object_wall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Enemy Collision
if (place_meeting(x, y, object_player)) {
	if (object_player.y < y - 16) {
		with (object_player) vsp = -grv;
		instance_destroy();
	} else {
		game_restart();
	}
}