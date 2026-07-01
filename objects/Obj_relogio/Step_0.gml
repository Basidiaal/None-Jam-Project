// 1. Controle do Sistema de Pause
if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = minha_velocidade; // Retoma a velocidade correta
}

// 2. Atualiza visualmente o frame (Lógica binária idêntica à da estátua)
// Frame 0: Vazio | 1: Horas | 2: Minutos | 3: Ambos
image_index = (tem_horas * 1) + (tem_minutos * 2);

// 3. Lógica de Interação para encaixar os ponteiros (Protegida contra o Obj_fade)
if (!instance_exists(Obj_fade) && place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    var _inv = Obj_inventory;
    var _item = _inv.item_segurando;

    // Se o player estiver segurando algo
    if (_item != noone) {
        var _encaixou = false;

        // Checa as peças individualmente, exatamente como as partes da estátua
        if (_item.id_unico == "ponteiro_horas"   && !tem_horas)   { tem_horas   = true; _encaixou = true; }
        if (_item.id_unico == "ponteiro_minutos" && !tem_minutos) { tem_minutos = true; _encaixou = true; }

        // Se o item for um dos ponteiros corretos e encaixou com sucesso
        if (_encaixou) {
            // audio_play_sound(snd_click_relogio, 10, false);
            
            _inv.item_segurando = noone; // Consome o ponteiro da mão do player
            
            io_clear(); // Limpa o input para evitar problemas no mesmo frame
            
            // Verifica se completou o puzzle
            if (tem_horas && tem_minutos) {
                revelou_hora = true;
                show_debug_message("Relógio Completo!");
                // Aqui você pode ativar seu evento/mecanismo se precisar
            }
        }
    }
}