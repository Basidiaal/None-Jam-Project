// Evento Draw GUI
draw_set_font(Fnt_puzzle_portas); // Use a sua fonte de interface
draw_set_halign(fa_right);
draw_set_color(c_green);

var _fps_atual = game_get_speed(gamespeed_fps);
draw_text(display_get_gui_width() - 20, 20, "ESTABILIDADE: " + string(_fps_atual) + " FPS");