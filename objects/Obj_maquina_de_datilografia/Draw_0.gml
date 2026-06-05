draw_self()
 var _dist = place_meeting(x, y, Obj_player);
    if (_dist && image_index = 0) {
        draw_set_halign(fa_center);
        draw_text(x+64, y + 13, "[E]");
	}