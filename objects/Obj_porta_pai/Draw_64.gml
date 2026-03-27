if (alpha > 0) {
    draw_set_color(c_black);
    draw_set_alpha(alpha);
    draw_rectangle(-1, -1, display_get_gui_width() + 1, display_get_gui_height() + 1, false);
    
    // Reset para não afetar outros desenhos
    draw_set_alpha(1);
    draw_set_color(c_white);
}