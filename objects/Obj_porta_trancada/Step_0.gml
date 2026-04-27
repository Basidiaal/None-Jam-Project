// Evento Step do obj_porta_trancada
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    // CASO A: A porta ainda está trancada
    if (trancada) {
        var _inv = Obj_inventory;
        
        if (_inv.item_segurando != noone && _inv.item_segurando.id_unico == id_necessario) {
            event_user(0); // Roda o código de destrancar
            if (consumivel) _inv.item_segurando = noone;
        } else {
            // Tremor de erro se não tiver a chave
           // shake_porta = true;
            //alarm[1] = 10;
            //audio_play_sound(snd_porta_trancada, 5, false);
            //global.texto_ui = "PRECISO DA CHAVE DE ANÚBIS.";
            //global.exibir_ui = true;
            //alarm[0] = 60;
        }
    } 
    // CASO B: A porta já está destrancada
    else {
        //audio_play_sound(snd_transicao_sala, 1, false);
        room_goto(Sala_cozinha); // Leva o player para a próxima sala
    }
}
/*
// Lógica de tremor (mantida para o feedback de erro)
if (shake_porta) {
    x = x_original + random_range(-2, 2);
} else {
    x = x_original;
}