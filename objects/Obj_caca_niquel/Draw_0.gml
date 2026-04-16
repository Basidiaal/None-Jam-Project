// Desenha a máquina no mapa para o player saber onde ir
draw_self();

// Se estiver perto e o FPS estiver baixo, desenha um brilho ou ícone de "E"
if (game_get_speed(gamespeed_fps) <= 5) {
    var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
    if (_dist < 70) {
        draw_set_halign(fa_center);
        draw_text(x, y - 40, "[E] REPARAR");
    }
}