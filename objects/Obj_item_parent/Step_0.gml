if (global.pause) {
    exit;
} 
// Diminui o tempo de espera caso o item tenha acabado de nascer
if (tempo_espera_drop > 0) {
    tempo_espera_drop -= 1;
    exit; // Impede interações nesses primeiros 2 frames
}

// 1. Checa proximidade (por distância X e Y) e clique
var jogador_perto = (abs(x - Obj_player.x) < 50) && (abs(y - Obj_player.y) < 90);
if (jogador_perto && keyboard_check_pressed(ord("E"))) {
    
    // 2. Só pega se a mão estiver vazia
    if (Obj_inventory.item_segurando == noone) {
        Obj_inventory.item_segurando = {
            nome: nome_exibicao,
            id_unico: id_item,
            objeto_original: object_index,
            sprite: sprite_index,
            offset_y: meu_offset_y,
            som_ao_dropar: som_drop,
			frame_da_mao: frame_da_mao
        };
        
        // audio_play_sound(snd_coleta, 1, false);
        
        global.item_coletado_neste_frame = true;
        
        // Decide a animação comparando a altura do item com a do jogador
        if (abs(bbox_bottom - Obj_player.bbox_bottom) < 32) {
            // Item e jogador estão no mesmo nível (chão) -> agachado
            Obj_player.sprite_index = Spr_Player_pegar_chao;
            Obj_player.estado = "interagindo_chao";
        } else {
            // Item está mais alto que o jogador (mesa/prateleira) -> em pé
            Obj_player.sprite_index = Spr_Player_interagindo1;
            Obj_player.estado = "interagindo_alto";
        }
        Obj_player.image_index = 0;
        
        // =======================================================
        // A SOLUÇÃO DE PRIORIDADE:
        // Limpa o input do frame. Se houver uma escada ou porta
        // no mesmo lugar, elas vão achar que o "E" não foi apertado!
        // =======================================================
        io_clear();
      
        instance_destroy();
	
        
    } else {
        // Feedback de erro (Mãos ocupadas)
        // global.texto_ui = "ERRO: BUFFER DE MEMÓRIA OCUPADO.";
        // global.exibir_ui = true;
        // alarm[0] = 60;
    }
}