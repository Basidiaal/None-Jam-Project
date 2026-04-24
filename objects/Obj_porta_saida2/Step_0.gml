// Detecta se o player está perto
if (place_meeting(x, y, Obj_player)) {
    
    if (keyboard_check_pressed(ord("E"))) {
        if (global.item_coletado == true) {
            // AÇÃO DE SAIR: Pode ser mudar de sala ou tocar animação
           // audio_play_sound(snd_porta_abrindo, 10, false);
            room_goto(Sala_principal); 
        } else {
            // Feedback de que está trancada
            // No momento da interação (dentro do if trancada)
			audio_play_sound(Snd_locked_door,10,false);
           x += random_range(-2, 2);
            show_message("pegue o item na sala antes de avançar")
        }
    }
}