// No Step do obj_interativo_parent
// Usamos place_meeting para checar a máscara de colisão exata
if (!instance_exists(Obj_fade) && place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    var _inv = Obj_inventory;
    
    // 1. Checa se o item na mão é o correto
    if (_inv.item_segurando != noone && _inv.item_segurando.id_unico == id_necessario) {
        event_user(0); // Chama o "Abrir Porta" que escrevemos acima
        
        if (consumivel) _inv.item_segurando = noone;
    } else {
        // 2. Feedback de erro se não tiver a chave
        //shake_porta = true;
       // alarm[1] = 10; // Para o tremor
        //audio_play_sound(snd_porta_trancada, 5, false);
        
        //global.texto_ui = "ESTÁ TRANCADA POR UM MECANISMO ANTIGO.";
       // global.exibir_ui = true;
        //alarm[0] = 60;
    }
}

// Lógica de tremor (Game Feel)
/*
if (shake_porta) {
    x = x_original + random_range(-2, 2);
} else {
    x = x_original;
}