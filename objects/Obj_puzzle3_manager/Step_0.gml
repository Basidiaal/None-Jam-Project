/// @description Lógica do 7º Erro e Dicas

// Lógica para clicar no Player (O 7º erro)
if (global.erros_encontrados == 6) {
    if (mouse_check_button_pressed(mb_left)) {
        // Se o rato estiver sobre o jogador
        if (position_meeting(mouse_x, mouse_y, Obj_player)) {
            if (!global.erros_clicados[6]) {
                global.erros_clicados[6] = true;
                global.erros_encontrados = 7;

               
                show_message("ANOMALIA DETECTADA: O OBSERVADOR.\nO sistema será reiniciado.");

                // Salva progresso meta e muda de sala
                room_goto(Sala_principal);
            }
        }
    }

    // Sistema de Dicas Únicas (A cada 2 minutos)
    if (global.erros_encontrados < 7) {
        timer_dica++;
        if (timer_dica >= dica_limite) {
            if (sequencia_dicas < array_length(mensagens_dica)) {
                // Mostra a dica e reseta o timer para a próxima
                show_message(mensagens_dica[sequencia_dicas]);
                sequencia_dicas++;
                timer_dica = 0; 
            }
        }
    }
}