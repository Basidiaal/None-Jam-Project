draw_self()
 var _dist = place_meeting(x, y, Obj_player);
     if(!bloqueada){
    if (_dist) {
        draw_set_alpha(1);
        draw_set_color(c_white); // Garante também que a cor padrão seja branca se necessário
             
        draw_text(x, y - 150, "[E]");
		draw_set_color(c_white);
	}
	 }