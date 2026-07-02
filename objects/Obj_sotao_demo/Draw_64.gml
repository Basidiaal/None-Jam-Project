// Só desenha se o jogador tiver acabado de interagir com a porta
if (exibindo_mensagem) {
    
    // 1. Configura a fonte e o alinhamento do texto
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // 2. Define a cor do texto (ex: Vermelho ou Branco)
    draw_set_color(c_white); 
    
    // 3. Pega o centro exato da tela da GUI do jogador
    var gui_centro_x = display_get_gui_width() / 2;
    var gui_centro_y = display_get_gui_height() - 100; // 100 pixels acima do rodapé da tela
    
    // Opcional: Desenha uma sombra preta atrás para dar leitura se o fundo for claro
    draw_set_color(c_black);
    draw_text(gui_centro_x + 2, gui_centro_y + 2, mensagem_demo);
    
    // Desenha o texto principal
    draw_set_color(c_white);
    draw_text(gui_centro_x, gui_centro_y, mensagem_demo);
}