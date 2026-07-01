if (estado == 0) {
    // Escurecendo a tela
    alpha += velocidade_fade;
    if (alpha >= 1) {
        alpha = 1;
        estado = 1; 
    }
}

if (estado == 1) {
    // 1. Toca o som apenas UMA vez usando a trava
    if (som_iniciado == false) {
        audio_play_sound(Snd_Passos_Escada, 1, false);
        som_iniciado = true; // Ativa a trava para não repetir neste frame
        
        // 2. Teleporta o Player e Câmera imediatamente no blackout
        if (instance_exists(Obj_player)) {
            Obj_player.x = alvo_x;
            Obj_player.y = alvo_y;
            Obj_player.xscale = alvo_lado;
        }
        if (instance_exists(Obj_Camera)) {
            Obj_Camera.teleportar_camera = true;
        }
    }
    
    // 3. SÓ avança para o estado 2 (clarear) depois que o som terminar totalmente
    if (som_iniciado == true && !audio_is_playing(Snd_Passos_Escada)) {
        estado = 2;
    }
}

if (estado == 2) {
    // Clareando a tela
    alpha -= velocidade_fade;
    if (alpha <= 0) {
        instance_destroy(); 
    }
}