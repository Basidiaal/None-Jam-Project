draw_self()
 var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
    if (_dist < 90) {
        draw_set_halign(fa_center);
        draw_text(x, y - 40, "E");
	}