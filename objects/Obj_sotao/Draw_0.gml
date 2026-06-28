draw_self()
 var _dist = place_meeting(x, y, Obj_player);
    if (_dist) {
        draw_set_halign(fa_center);
        draw_text(x+ 160, y + 120, "[E]");
	}