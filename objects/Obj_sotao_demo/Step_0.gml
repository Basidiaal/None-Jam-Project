// 1. Controle do Sistema de Pause
if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = minha_velocidade;
}

// 2. Interação com a Porta da Demo (Protegida contra transições ativas)
if (!instance_exists(Obj_fade) && place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    // Toca o som de porta trancada/erro que você já usa no projeto
    //audio_play_sound(Snd_locked_door, 5, false);
    
    // Ativa a exibição local da mensagem
    exibindo_mensagem = true;
	
    // Ativa o alarme 0 do próprio objeto para sumir com o texto após 2 segundos (120 frames a 60fps)
    alarm[0] = 120;
    
    // Limpa o input do frame para evitar que outros sistemas processem o clique
    io_clear();
}