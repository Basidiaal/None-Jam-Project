draw_self()
var alt = 80;
var col = place_meeting(x, y, Obj_Block);
if(col){
	alt = 130;
}
var _dist = (abs(x - Obj_player.x) < 50) && (abs(y - Obj_player.y) < 90);
if (_dist) {
    draw_set_halign(fa_center);
    draw_text(x, y - alt, "[E]");
}