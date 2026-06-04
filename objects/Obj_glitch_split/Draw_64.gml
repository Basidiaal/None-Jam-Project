/// @desc Desenha o Glitch de Interferência
var display_w = window_get_width();
var display_h = window_get_height();

if (timer < duracao) {
    // 1. Desenha um retângulo preto com transparência variada
    draw_set_alpha(random_range(0.1, 0.5));
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_w, display_h, false);
    
    // 2. Desenha "tiras" horizontais aleatórias (Efeito de TV velha)
    repeat(10) {
        var yy = irandom(display_h);
        var hh = irandom_range(2, 20);
        draw_set_color(choose(c_white, c_red, c_blue));
        draw_set_alpha(random_range(0.2, 0.8));
        draw_rectangle(0, yy, display_w, yy + hh, false);
    }
    
    // 3. Dá um leve "tremor" na tela (opcional)
    camera_set_view_pos(view_camera[0], 
        camera_get_view_x(view_camera[0]) + irandom_range(-5, 5), 
        camera_get_view_y(view_camera[0]) + irandom_range(-5, 5)
    );
}

draw_set_alpha(1);
draw_set_color(c_white);