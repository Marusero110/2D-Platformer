/// @description Insert description here
// You can write your code in this editor

//Get Player Input
key_left = keyboard_check(vk_left) || (gamepad_axis_value(0, gp_axislh) < 0);
key_right = keyboard_check(vk_right) || (gamepad_axis_value(0, gp_axislh) > 0);
key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0, gp_face1));

//Calculate Movement
var move = key_right - key_left;
hsp = move * walk_speed;
vsp = vsp + grv;

if (place_meeting(x, y + 1, object_wall)) && (key_jump) {
	vsp = -7;
}

//Horizontal Collision
if (place_meeting(x + hsp, y, object_wall)) {
	while (!place_meeting(x + sign(hsp), y, object_wall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
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

//Animation
if (!place_meeting(x, y + 1, object_wall)) {
	sprite_index = sprite_player_character_jumping;
	image_speed = 0;
	if (sign(vsp) > 0) {
		image_index = 1;
	}
} else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = 0;
	} else {
		sprite_index = sprite_player_character_running2;
	}
}

image_xscale = -1;