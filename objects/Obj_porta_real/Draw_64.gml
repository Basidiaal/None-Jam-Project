/// @description Desenha o Fade

if (alpha > 0) {
    draw_set_color(c_black);
    draw_set_alpha(alpha);
    
    // Desenha o retângulo cobrindo toda a interface do usuário
    draw_rectangle(-1, -1, display_get_gui_width() + 1, display_get_gui_height() + 1, false);
    
    // Reseta os padrões de desenho para o GameMaker
    draw_set_alpha(1);
    draw_set_color(c_white);
}