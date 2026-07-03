if (global.pause) {
    exit;
} 

// 1. Checa proximidade, clique E se o puzzle já foi resolvido
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    // SÓ PERMITE PEGAR SE O PUZZLE ESTIVER COMPLETO
   if (global.puzzle_resolvido == true) {
        
        // 2. Só pega se a mão estiver vazia
        if (Obj_inventory.item_segurando == noone) {
            Obj_inventory.item_segurando = {
                nome: nome_exibicao,
                id_unico: id_item,
                objeto_original: object_index,
                sprite: sprite_index,
                offset_y: meu_offset_y,
                som_ao_dropar: som_drop 
            };
            global.item_coletado_neste_frame = true;
           // audio_play_sound(snd_coleta, 1, false);
		   io_clear();
           instance_destroy();
        } else {
            // Feedback de erro (Mãos ocupadas)
            // global.texto_ui = "ERRO: BUFFER DE MEMÓRIA OCUPADO.";
            // global.exibir_ui = true;
            // alarm[0] = 60;
        }
    } 
}