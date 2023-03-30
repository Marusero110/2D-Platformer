function Menu(_x, _y, _options, _description = -1) {
	with (instance_create_depth(_x, _y, -999, object_menu)) {
		options = _options;
		description = _description;
		options_count = array_length(_options);
		hover_marker = "* ";
		
		//size
		margin = 8;
		draw_set_font(font_new_rodin);
		
		width = 1;
		if (_description != -1) {
			width = max(width, string_width(_description));
		}//end if statement
		for (var i = 0; i < options_count; i++) {
			width = max(width, string_width(_options[i][0]));
		}
		width += string_width(hover_marker);
		
		height_line = 17;
		height = height_line * (options_count + !(description == -1));
		
		width_full = width + (margin * 2);
		height_full = height + (margin * 2);
	}//end with statement
}//end function statement