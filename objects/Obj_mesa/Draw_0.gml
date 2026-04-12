// 1. Desenha a própria mesa primeiro
draw_self();

// 2. Verifica a distância até o player (ex: 60 pixels)
if (instance_exists(Obj_player)) {
    var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
    
    if (_dist < 60) {
        // Configurações do texto
        draw_set_font(Fnt_puzzle_portas);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        
       //1 = Tamanho original
// 0.5 = Metade do tamanho
// 2 = Dobro do tamanho

draw_text_transformed(x, y - 70, "JOGAR BLACKJACK?", 0.7, 0.7, 0);
        // Dica visual opcional: Desenha o ícone de uma tecla (ex: 'E' ou 'Espaço')
        // draw_text(x, y + 60, "[E]"); 
    }
}

// Reset padrão para não bugar outros objetos
draw_set_halign(fa_left);
draw_set_valign(fa_top);