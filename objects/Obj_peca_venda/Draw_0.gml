draw_self();

// Só mostra o indicador de comando "[E]" se estiver perto E se o puzzle estiver resolvido
var _perto = (abs(x - Obj_player.x) < 50) && (abs(y - Obj_player.y) < 90);
if (_perto && global.puzzle_resolvido == true) {
    draw_set_halign(fa_center);
    draw_text(x, y - 178, "[E]");
}