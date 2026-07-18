event_inherited();
if (global.pause) {
    exit;
} 

// 1. Checa proximidade e clique
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {

        // Se for a PRIMEIRA vez que o player interage no jogo inteiro:
        if (Obj_player.ja_interagiu_antes == false) {
            Obj_player.sprite_index = Spr_Player_interagindo1;
            Obj_player.ja_interagiu_antes = true; // Salva no player que a primeira vez já foi
        } else {
            // Nas próximas vezes, usa a segunda animação:
            Obj_player.sprite_index = Spr_Player_interagindo2;
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
        
        // audio_play_sound(snd_coleta, 1, false);
        
        // =======================================================
        // A SOLUÇÃO DE PRIORIDADE:
        // Limpa o input do frame. Se houver uma escada ou porta
        // no mesmo lugar, elas vão achar que o "E" não foi apertado!
        // =======================================================
      global.item_coletado_neste_frame = true;
	  io_clear();
        
        instance_destroy();
    } else {
        // Feedback de erro (Mãos ocupadas)
        // global.texto_ui = "ERRO: BUFFER DE MEMÓRIA OCUPADO.";
        // global.exibir_ui = true;
        // alarm[0] = 60;
    }
}