draw_self(); // Desenha a caixa de fusível normalmente

// Só desenha o [E] se a checagem do Step permitir
if (mostrar_prompt_E) {
    draw_set_halign(fa_center);
    
    // Desenha o prompt 40 pixels acima do topo da caixa de fusível
    draw_text(x + 33, bbox_top - 65, "[E]");
}