/// @description Checa a vitória e as dicas

// Lógica do Clique no Player (Agora sempre ativa)
if (mouse_check_button_pressed(mb_left)) {
    // Se clicar no player e ele ainda não foi marcado como erro
    if (position_meeting(mouse_x, mouse_y, Obj_player)) {
        if (!global.erros_clicados[6]) {
            global.erros_clicados[6] = true;
            global.erros_encontrados += 1;
            
        
            // Feedback visual opcional aqui
        }
    }
}

// Checa se TODOS os 7 erros foram encontrados (independente da ordem)
if (global.erros_encontrados == 7) {
    // Se encontrarmos o objeto porta na sala...
    if (instance_exists(Obj_porta_saida)) {
        var _porta = instance_find(Obj_porta_saida, 0);
        
        // Se ela ainda estiver trancada, vamos destrancar!
        if (_porta.trancada) {
            _porta.trancada = false;
            _porta.image_index = 1; // Muda o sprite para porta aberta (se tiver)
            
            // Feedback sonoro de que algo destrancou
            show_debug_message("A porta foi destrancada!");
        }
    }
}

// O sistema de dicas continua o mesmo, 
// mas você pode ajustar o timer para só contar se o jogador estiver "travado"
timer_dica++;
if (timer_dica >= dica_limite) {
    // ... código das dicas ...
}