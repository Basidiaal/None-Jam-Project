show_debug_message("Entrou na sala da recompensa. Estado do puzzle: " + string(global.puzzle_resolvido));
// Se o puzzle já foi completado antes do jogador entrar aqui
if (global.puzzle_resolvido == true) {
    
    // Como o jogador NÃO estava na sala quando o puzzle foi resolvido,
    // o objeto vai direto para o frame 11 e fica parado lá.
    image_index = 11;
    image_speed = 0;
    
    // Desativa o puzzle global para não ficar forçando o frame 11 para sempre,
    // caso você queira que o objeto mude de estado depois.
    // global.puzzle_completo = false; 
}