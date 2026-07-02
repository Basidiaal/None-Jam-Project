draw_self(); // Desenha o sprite da porta normalmente

// Se o Player estiver encostado na porta, mostra o prompt de interação
if (place_meeting(x, y, Obj_player)) {
    draw_set_halign(fa_center);
    
    // Desenha o "[E]" 40 pixels acima do topo da porta
    draw_text(x + 90 , y + 40, "[E]");
}