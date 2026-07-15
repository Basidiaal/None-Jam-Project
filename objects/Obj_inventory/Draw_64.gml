if (item_segurando != noone) {
    // 1. Defina a sprite da mão com os itens que você criou
    var _spr_mao = Spr_mao; // <-- Substitua pelo nome real da sua sprite da mão
    
    // 2. Pega o frame correspondente que foi salvo ao coletar o item
    var _frame = item_segurando.frame_da_mao;
    
    // 3. Pega o tamanho da tela (GUI) para posicionar no canto inferior direito
    var _gui_largura = display_get_gui_width();
    var _gui_altura = display_get_gui_height();
    
    // Se a origem (pivô) da sua sprite da mão estiver configurada como 
    // "Bottom Right" (Canto Inferior Direito) no editor do GameMaker,
    // ela ficará perfeitamente colada no canto usando as posições exatas:
    var _x_pos = _gui_largura;
    var _y_pos = _gui_altura;
    
    // NOTA: Se você quiser dar uma pequena margem (afastar um pouco da quina da tela),
    // basta descomentar as duas linhas abaixo retirando as duas barras "//":
     _x_pos = _gui_largura - 70;
      _y_pos = _gui_altura - 60;
    
    // 4. Desenha a mão com o frame do item atual
    // O "1, 1" no final são as escalas X e Y. Se a sprite ficar muito pequena, 
    // você pode aumentar para "2, 2" ou "3, 3" para dar zoom na arte pixelada.
    draw_sprite_ext(_spr_mao, _frame, _x_pos, _y_pos, 1, 1, 0, c_white, 1);
}
draw_set_color(-1)