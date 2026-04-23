/// @description Interação Final + Fade

// 1. Verifica se o player está colidindo e apertou "E"
if (!executando_fade && place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    // Limpa os dados do meta-puzzle para não ficar preso no loop
    if (file_exists("meta_data.ini")) {
        file_delete("meta_data.ini");
    }
    
    // Inicia o processo de transição
    executando_fade = true;
}

// 2. LÓGICA DO FADE
if (executando_fade) {
    persistent = true; // Permite que a porta sobreviva à troca de sala para clarear o alpha

    if (!mudei) {
        // Estágio 1: Escurecendo a tela
        alpha += 0.02; 
        if (alpha >= 1) {
            alpha = 1;
            mudei = true;
            
            // Teleporta para a PRÓXIMA SALA (definida no seu Variable Definitions ou Sala_3)
            if (room_exists(sala_destino)) {
                room_goto(sala_destino);
                
                // Posiciona o player na sala nova
                if (instance_exists(Obj_player)) {
                    Obj_player.x = sala_x;
                    Obj_player.y = sala_y;
                }
            }
        }
    } else {
        // Estágio 2: Clareando a tela já na sala nova
        alpha -= 0.02; 
		if(alpha <= 1.5){
			sprite_index = -1;
             mask_index = -1;
		}
        if (alpha <= 0) {
            instance_destroy(); // Remove o objeto após completar a transição
        }
    }
}