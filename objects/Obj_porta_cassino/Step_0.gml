if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = minha_velocidade; // Retoma a velocidade correta de cada objeto
}

var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
var _fps_ok = (game_get_speed(gamespeed_fps) >= 60);


if (_dist < raio_interacao) {
    if (keyboard_check_pressed(ord("E")) && !aberta) {
        
        if (global.tem_chave_setor && _fps_ok) {
            // ABRIR PORTA
            aberta = true;
            image_index = 1; 
          mask_index = -1; // TIRA A COLISÃO (torna a porta passável)
		 
            //audio_play_sound(snd_porta_abrindo, 1, false); // Opcional
        } 
		
        else {
            // DEFINIR MENSAGEM DE ERRO
            if (!global.tem_chave_setor && !_fps_ok) {
                mensagem_texto = Obj_main_menu.texto_falta_chave_e_fps[Obj_main_menu.lang_index];
            } else if (!global.tem_chave_setor) {
                mensagem_texto = Obj_main_menu.texto_falta_chave[Obj_main_menu.lang_index];
            } else {
                mensagem_texto = Obj_main_menu.texto_falta_fps[Obj_main_menu.lang_index];
            }
            mensagem_timer = 120; // Mensagem dura 2 segundos (em 60fps)
        }
    }
}

// Diminuir o timer da mensagem
if (mensagem_timer > 0) mensagem_timer--;