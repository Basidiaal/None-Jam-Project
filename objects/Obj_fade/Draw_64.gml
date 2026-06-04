draw_set_alpha(alpha);
draw_set_color(fade_color);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1); // Sempre resete o alpha para 1 após desenhar