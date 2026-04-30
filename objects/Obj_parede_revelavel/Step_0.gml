// 1. Controle da animação de revelação
if (iniciar_revelacao && !revelada) {
    // Só ativa a velocidade da animação agora
    image_speed = 1; 
    
    // Se a animação chegou no último frame (o papel caiu todo)
    if (image_index >= image_number - 1) {
        image_speed = 0;
        image_index = image_number - 1;
        revelada = true;
        
        // Opcional: Som do papel/holograma sumindo
        //audio_play_sound(Snd_revelar_porta, 10, false);
    }
}

// 2. Interação com a porta (Só funciona se revelada E estátua saiu da frente)
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    // Checa se a estátua ainda está bloqueando
    var _bloqueado_estatua = false;
    if (instance_exists(Obj_estatua_enigma)) {
        if (Obj_estatua_enigma.movendo || Obj_estatua_enigma.x < Obj_estatua_enigma.x_alvo) {
            _bloqueado_estatua = true;
        }
    }

    if (revelada && !_bloqueado_estatua) {
        var _fade = instance_create_depth(0, 0, -9999, Obj_fade);
        _fade.target_room = sala_destino;
    }
}