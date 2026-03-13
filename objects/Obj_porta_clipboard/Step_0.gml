/// @description Scanner de Clipboard

// 1. Verifica se o jogador está perto e apertou E
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    // Se o jogo estiver pausado pelo bilhete, não faz nada
    if (global.pause) exit;

    // 2. O CORAÇÃO DO PUZZLE: Verifica a Área de Transferência
    if (clipboard_has_text()) {
        var _texto_copiado = clipboard_get_text();
        
        // Compara o que o jogador copiou no Windows com a senha da porta
        if (_texto_copiado == frase_correta) {
            
            // SUCESSO
            if (!aberta) {
                aberta = true;
               
                show_message("SISTEMA: DNA digital confirmado. Porta liberada.");
            }
            
            // Teleporte
            global.target_x = destino_x;
            global.target_y = destino_y;
            room_goto(sala_destino);
            
        } else {
            // FALHA: O jogador tem algo no clipboard, mas está errado
        
            show_message("VILÃO: O que é isso que você está carregando? '" + _texto_copiado + "' não é a chave...");
        }
    } else {
        // FALHA: O clipboard está vazio
        show_message("SISTEMA: Erro. Área de transferência vazia. Copie a chave para o buffer do sistema.");
    }
}