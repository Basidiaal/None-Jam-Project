draw_self()
 var _dist = place_meeting(x, y, Obj_player);
    if (_dist) {
        draw_set_halign(fa_center);
        draw_text(x-100 , y - 190, "Sair\n[E]");
	}