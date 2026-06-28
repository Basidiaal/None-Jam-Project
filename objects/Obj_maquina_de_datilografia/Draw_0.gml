// Só desenha se estiver na sala original
if (room == sala_original) {
    draw_self();
    
    var _dist = place_meeting(x, y, Obj_player);
    if (_dist && image_index == 0) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_color(c_white); // Garante que o texto seja visível
        draw_text(x + 64, y - 20, "[E]");
    }
}

