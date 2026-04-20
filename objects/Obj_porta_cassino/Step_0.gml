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
                mensagem_texto = "SISTEMA INSTÁVEL E TRAVA TRANCADA.";
            } else if (!global.tem_chave_setor) {
                mensagem_texto = "CHAVE DE ACESSO NECESSÁRIA.";
            } else {
                mensagem_texto = "ERRO DE SINCRONIA: ESTABILIZE EM 60 FPS.";
            }
            mensagem_timer = 120; // Mensagem dura 2 segundos (em 60fps)
        }
    }
}

// Diminuir o timer da mensagem
if (mensagem_timer > 0) mensagem_timer--;