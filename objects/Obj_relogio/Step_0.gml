if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = minha_velocidade; // Retoma a velocidade correta de cada objeto
}

// 1. Atualiza visualmente o frame (Sempre rodando)
// Frame 0: Vazio | 1: Horas | 2: Minutos | 3: Ambos
image_index = (tem_horas * 1) + (tem_minutos * 2);

// 2. Lógica de Interação
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    var _inv = Obj_inventory;
    var _item = _inv.item_segurando;

    // Se o player estiver segurando algo (struct não é noone)
    if (_item != noone) {
        
        var _encaixou = false;

        // Checa o id_item dentro da struct que o pai criou
        if (_item.id_unico == "ponteiro_horas" && !tem_horas) {
            tem_horas = true;
            _encaixou = true;
        } 
        else if (_item.id_unico == "ponteiro_minutos" && !tem_minutos) {
            tem_minutos = true;
            _encaixou = true;
        }

        // Se o item for um dos ponteiros corretos
        if (_encaixou) {
           // audio_play_sound(snd_click_relogio, 10, false);
            
            // Limpa a mão do player (remove a struct)
            _inv.item_segurando = noone; 
            
            // Verifica se completou o puzzle
            if (tem_horas && tem_minutos) {
                revelou_hora = true;
                show_debug_message("Relógio Completo!");
            }
        }
    }
}