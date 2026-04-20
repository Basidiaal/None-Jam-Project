var _fps_atual = game_get_speed(gamespeed_fps);

// --- CASO O JOGO ESTEJA FECHADO ---
if (!aberto) {
    var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
    
    // Abrir o jogo (apenas se estiver em 5 FPS e perto)
    if (_dist < 70 && _fps_atual <= 5 && keyboard_check_pressed(ord("E"))) {
        aberto = true; // ADICIONADO: Agora o sistema sabe que abriu!
        global.minigame_ativo = "jackpot";
        estado = "idling";
        
        // Reset preventivo de segurança
        alarm[0] = -1;  
        ganhou_nesta_sessao = false;
        for (var i = 0; i < 3; i++) {
            rolos_pos[i] = 0;
            rolos_vel[i] = 0;
        }
    }
} 
// --- CASO O JOGO ESTEJA ABERTO ---
else {
    // Tecla para sair (ESC agora só funciona se estiver aberto)
    if (keyboard_check_pressed(vk_escape)) { 
        aberto = false; 
        global.minigame_ativo = "nenhum"; 
        alarm[0] = -1; 
        estado = "idling";
		
		// LIMPA O INPUT: Impede que o objeto de Pause leia esse "ESC"
    io_clear();
        exit; 
    }

    if (keyboard_check_pressed(ord("E"))) {
        if (estado == "idling") {
            estado = "rodando";
            coluna_ativa = 0;
            rolos_vel[0] = base_vel;
            rolos_vel[1] = base_vel;
            rolos_vel[2] = base_vel;
        } 
        else if (estado == "rodando") {
            // Parar o rolo atual
            rolos_vel[coluna_ativa] = 0;
            rolos_pos[coluna_ativa] = floor(rolos_pos[coluna_ativa] + 0.5) % 6;

            if (coluna_ativa == 0) {
                var _icone_escolhido = floor(rolos_pos[0]);
                rolos_vel[1] = base_vel * mult_v2[_icone_escolhido];
                rolos_vel[2] = base_vel * mult_v3[_icone_escolhido];
                coluna_ativa++;
            } 
            else if (coluna_ativa < 2) {
                coluna_ativa++;
            } 
            else {
                estado = "resultado";
                alarm[0] = 3; 
                event_user(0); 
            }
        }
    }

    // Movimentação dos rolos
    if (estado == "rodando") {
        for (var i = 0; i < 3; i++) {
            if (rolos_vel[i] > 0) {
                rolos_pos[i] = (rolos_pos[i] + rolos_vel[i]/60) % 6;
            }
        }
    }
}