if (global.pause) {
    exit;
} 

// 1. Checa proximidade e clique do botão "E"
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {

    // 2. Se estiver na Sala_7 e o gatilho existir, faz o efeito do glitch
    if (room == Sala_7 && instance_exists(Obj_gatilho)) {
        
        // Cria o glitch e avisa que é para DESATIVAR
        var _inst = instance_create_layer(x, y, "Instances", Obj_glitch_split);
        _inst.tipo = "desativar";
        
        // Destrói o gatilho rosa e libera o caminho
        instance_destroy(Obj_gatilho);
        global.liberar_caminho = true;
    }
    
    // 3. LOGICA DE COLETA (Agora protegida dentro do clique do "E"):
    // Só pega se a mão estiver realmente vazia
    if (Obj_inventory.item_segurando == noone) {
        Obj_inventory.item_segurando = {
            nome: nome_exibicao,
            id_unico: id_item,
            objeto_original: object_index,
            sprite: sprite_index,
            offset_y: meu_offset_y,
            som_ao_dropar: som_drop 
        };
        global.item_coletado_neste_frame= true;
		io_clear();
        // audio_play_sound(snd_coleta, 1, false);
        instance_destroy(); // Destrói a tábua física do chão pois ela foi para a mão
    } else {
	
        // Se tentou apertar E mas a mão estava ocupada, limpa o input
        io_clear();
        // Feedback opcional de erro...
    }
}