// NÃO coloque draw_self(); aqui para o bloco invisível não aparecer

// 1. Só avança se a escada NÃO estiver trancada
if (esta_trancada == false) {
    
    // 2. Só avança se o player estiver encostando nele
    if (place_meeting(x, y, Obj_player)) {
        
        // CORREÇÃO: Garante que o alpha de desenho volte a ser 100% opaco 
        // impedindo que resquícios da transição deixem o texto preto/transparente
        draw_set_alpha(1);
        draw_set_color(c_white); // Garante também que a cor padrão seja branca se necessário
            
        // 3. Desenha o texto perfeitamente
        draw_set_halign(fa_center);
        draw_text(x + texto_largura_offset, y - texto_altura_offset, texto_acao + "\n[E]");
        
    }
}