// Desenha um retângulo preto na tela inteira baseado no alpha
draw_set_color(c_black);
draw_set_alpha(alpha);

draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Reseta o alpha para não quebrar outros desenhos do jogo
draw_set_alpha(1);