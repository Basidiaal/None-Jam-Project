/// @description Lógica Independente da Porta Temporal

// Verifica se o jogador está perto
var _player_perto = place_meeting(x, y, Obj_player);

if (_player_perto) {
    // Se ele apertar a tecla de interação (E)
    if (keyboard_check_pressed(ord("E"))) {
        
        // CHECAGEM META: O relógio do PC bate com o alvo?
        if (current_hour == hora_alvo && current_minute == minuto_alvo) {
            
            // SUCESSO: Teleporte
            global.target_x = destino_x;
            global.target_y = destino_y;
            
            if (room_exists(Sala_5)) {
       
                room_goto(Sala_5);
            }
            
        } else {
            // FALHA: Dica do vilão
          
            show_message("porta bloqueada.resolva o puzzle no bilhete ao lado da porta.");
        }
    }
}