/// @description Lógica Temporal + Fade

// 1. Verifica se o jogador está perto
var _player_perto = place_meeting(x, y, Obj_player);

if (_player_perto && !executando_fade) {
    if (keyboard_check_pressed(ord("E"))) {
        
        // CHECAGEM META: O relógio do PC bate com o alvo?
        // Usando hora_alvo e minuto_alvo do seu Variable Definitions
        if (current_hour == hora_alvo && current_minute == minuto_alvo) {
            
            // SUCESSO: Ativa o início da transição
            executando_fade = true;
            
        } else {
            // FALHA: Dica do vilão
            show_message("Porta bloqueada. Resolva o puzzle no bilhete ao lado da porta.");
        }
    }
}

// 2. PROCESSO DE FADE (Transição)
if (executando_fade) {
    persistent = true; // Necessário para sobreviver à troca de sala

    if (!mudei) {
        // Escurecendo a tela
        alpha += 0.02; 
        if (alpha >= 1) {
            alpha = 1;
            mudei = true;
            
            // Teleporte usando suas variáveis do Variable Definitions
            if (room_exists(sala_destino)) {
                room_goto(sala_destino);
                
                // Posiciona o player (sala_x e sala_y conforme seu Variable Definitions)
                if (instance_exists(Obj_player)) {
                    Obj_player.x = destino_x;
                    Obj_player.y = destino_y;
                }
            }
        }
    } else {
        // Clareando a tela na sala nova
        alpha -= 0.02; 
		if(alpha <= 1.5){
			sprite_index = -1;
             mask_index = -1;
		}
        if (alpha <= 0) {
            instance_destroy(); // Se destrói ao finalizar
        }
    }
}