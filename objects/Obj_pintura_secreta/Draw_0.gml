draw_self()
 var _dist = place_meeting(x, y, Obj_player);
     if(!Obj_porta_revelada.bloqueada){
    if (_dist) {
     
        draw_text(x, y + 70, "[E]");
		draw_set_color(c_white);
	}
	 }