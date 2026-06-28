draw_self()
if(global.puzzle_completo = false){
 var _dist = place_meeting(x, y, Obj_player);
 var _dist_2 = place_meeting(x, y, Obj_player_2);
    if (_dist ) {
        draw_set_halign(fa_center);
        draw_text(x, y - 80, "[E]");
	}
	if (_dist_2 ) {
        draw_set_halign(fa_center);
        draw_text(x, y - 80, "[ENTER]");
	}
}