// Dentro do evento DESENHAR GUI (DRAW GUI):
if (global.exibir_ui && global.texto_ui != "") {
    
    // Pega a largura exata da interface da tela/câmera atual
    var largura_tela = display_get_gui_width();
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(c_yellow); // Texto amarelo para destacar bem no cyberpunk/horror
    
    // Desenha o caminho exato centralizado no topo da tela (40 pixels para baixo do topo)
    draw_text(largura_tela / 2, 40, global.texto_ui); 
}