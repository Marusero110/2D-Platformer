gpu_set_blendenable(false);

if (pause) {
	
}//end if statement

if (keyboard_check_pressed(ord("P"))) {
	if (!pause) { //pause now
		pause = true;
		instance_deactivate_all(true);
		pause_surf = surface_create(resolution_width, resolution_height);
	} else {
		pause = false;
	}
}//end of statement