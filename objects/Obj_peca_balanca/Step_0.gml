if (global.pause) {

    exit;
} 
// 1. Checa proximidade e clique
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    if(room = Sala_7 and instance_exists(Obj_gatilho)){


    // 1. Cria o glitch e avisa que é para DESATIVAR
    var _inst = instance_create_layer(x, y, "Instances", Obj_glitch_split);
    _inst.tipo = "desativar";
	

    // 2. Destrói o item
	instance_destroy(Obj_gatilho)
	 global.liberar_caminho = true;
	}
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
		io_clear();
       // audio_play_sound(snd_coleta, 1, false);
        instance_destroy();
    } else {
		io_clear();
        // Feedback de erro (Mãos ocupadas)
       // global.texto_ui = "ERRO: BUFFER DE MEMÓRIA OCUPADO.";
       // global.exibir_ui = true;
        //alarm[0] = 60;
    }
}