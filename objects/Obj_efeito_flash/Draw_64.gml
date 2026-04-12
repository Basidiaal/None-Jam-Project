draw_set_alpha(alpha);
draw_set_color(c_white); // Ou c_cyan para um ar mais "tecnológico/tempo"
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1); // Reseta o alpha para não afetar outros draws