var _fps_atual = game_get_speed(gamespeed_fps);

if (!aberto) {
    // Abrir o jogo (apenas se estiver em 5 FPS e perto)
    var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
    if (_dist < 70 && _fps_atual <= 5 && keyboard_check_pressed(ord("E"))) {
        aberto = true;
        global.minigame_ativo = "jackpot";
        estado = "idling";
    }
} else {
    // Tecla para sair
    if (keyboard_check_pressed(vk_escape)) { 
        aberto = false; global.minigame_ativo = "nenhum"; exit; 
    }

    if (keyboard_check_pressed(ord("E"))) {
        if (estado == "idling") {
            estado = "rodando";
            coluna_ativa = 0;
            rolos_vel[0] = base_vel;
            rolos_vel[1] = base_vel; // Começam iguais, mudam depois
            rolos_vel[2] = base_vel;
        } 
        else if (estado == "rodando") {
            // Parar o rolo atual
            rolos_vel[coluna_ativa] = 0;
            rolos_pos[coluna_ativa] = floor(rolos_pos[coluna_ativa] + 0.5) % 6; // Ajustado para 6 ícones

            if (coluna_ativa == 0) {
                // ACABOU DE PARAR O PRIMEIRO ROLO: Calcular novas velocidades
                var _icone_escolhido = floor(rolos_pos[0]);
                rolos_vel[1] = base_vel * mult_v2[_icone_escolhido];
                rolos_vel[2] = base_vel * mult_v3[_icone_escolhido];
                coluna_ativa++;
            } 
            else if (coluna_ativa < 2) {
                coluna_ativa++;
            } 
            else {
                // PAROU O ÚLTIMO ROLO: Checar se ganhou
                estado = "resultado";
                alarm[0] = 3; 
                event_user(0); // Lógica de premiação
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