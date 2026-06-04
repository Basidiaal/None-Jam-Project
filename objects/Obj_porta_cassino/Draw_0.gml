draw_self();

if (mensagem_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_color(c_red);
    // Desenha o texto um pouco acima da porta
    draw_text(x, y - 80, mensagem_texto);
    draw_set_color(c_white);
}