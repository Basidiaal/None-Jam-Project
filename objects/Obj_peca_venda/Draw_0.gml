draw_self();

// Só mostra o indicador de comando "[E]" se estiver perto E se o puzzle estiver resolvido
var _dist = place_meeting(x, y, Obj_player);
if (_dist && global.puzzle_resolvido == true) {
    draw_set_halign(fa_center);
    draw_text(x, y - 70, "[E]");
}