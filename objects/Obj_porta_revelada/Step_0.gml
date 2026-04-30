event_inherited()
// 1. Primeiro, checamos se a pintura ainda está na frente
// Se a pintura não existir mais ou já tiver subido, desbloqueamos a porta
if (!instance_exists(Obj_pintura_secreta)) {
    bloqueada = false;
} else {
    // Se a pintura existe, ela só bloqueia se o Y dela for maior que o alvo
    // (Ou seja, se ela ainda não terminou de subir)
    if (Obj_pintura_secreta.y > Obj_pintura_secreta.y_alvo + 5) {
        bloqueada = true;
    } else {
        bloqueada = false;
    }
}

// 2. Lógica de Interação
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    if (bloqueada) {
        // Feedback se o player tentar interagir com a pintura na frente
       // global.texto_ui = "ALGO ESTÁ BLOQUEANDO O ACESSO.";
       // global.exibir_ui = true;
       // alarm[0] = 60;
    } else {
        // Se não estiver bloqueada, faz a transição
        //audio_play_sound(snd_transicao_sala, 1, false);
        var _fade = instance_create_depth(0, 0, -9999, Obj_fade);
    _fade.target_room = sala_destino;
    }
}