gpu_set_blendenable(false);

if (pause) { //draw frozen image to screen while paused
	surface_set_target(application_surface);
	
	if (surface_exists(pause_surf)) {
		draw_surface(pause_surf, 0, 0);
	} else {
		pause_surf = surface_create(resolution_width, resolution_height);
		buffer_set_surface(pause_surf_buffer, pause_surf, 0);
	}
	
	surface_reset_target();
}//end if statement

if (keyboard_check_pressed(ord("P")) || gamepad_button_check_pressed(0, gp_start)) {
	if (!pause) { //pause now
		pause = true;
		
		instance_deactivate_all(true);
		
		pause_surf = surface_create(resolution_width, resolution_height);
		surface_set_target(pause_surf);
			draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		if (buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
		pause_surf_buffer = buffer_create(resolution_width * resolution_height * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surf_buffer, pause_surf, 0);
	} else { //unpause now
		pause = false;
		instance_activate_all();
		if (surface_exists(pause_surf)) surface_free(pause_surf);
		if (buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
	}
}//end of statement