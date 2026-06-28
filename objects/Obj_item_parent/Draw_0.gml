draw_self()
var alt = 80;
var col = place_meeting(x, y, Obj_Block);
if(col){
	alt = 130;
}
 var _dist = place_meeting(x, y, Obj_player);
    if (_dist) {
        draw_set_halign(fa_center);
        draw_text(x, y - alt, "[E]");
	}