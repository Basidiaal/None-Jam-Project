draw_self()
if(!desativa){
 var _dist = place_meeting(x, y, Obj_player);
    if (_dist) {
        draw_set_halign(fa_center);
        draw_text(x + 21 , y + 20, "[E]");
	}
}