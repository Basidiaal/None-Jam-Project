if (keyboard_check_pressed(ord("G")) && item_segurando != noone) {
    var _movel = instance_nearest(Obj_player.x, Obj_player.y, Obj_movel_parent);
    var _drop_x = Obj_player.x;
    var _drop_y = Obj_player.y;

    if (_movel != noone && distance_to_object(_movel) < 30) {
        // 1. Achamos a altura exata do tampo da mesa
        var _tampo_da_mesa = _movel.y - _movel.distancia_ate_o_tampo;
        
        // 2. Posicionamos o item para que a BASE dele toque o tampo
        _drop_x = _movel.x;
        _drop_y = _tampo_da_mesa; 
        
        // Se a origem do item for no meio, ele precisa subir metade da sua altura
        // para não ficar metade dentro da mesa.
        _drop_y -= item_segurando.offset_y; 
    } else {
        // Drop no chão: compensa o offset para não entrar no piso
        _drop_y = Obj_player.y + 10 - item_segurando.offset_y;
    }

    // CRIAÇÃO DO ITEM (Usando depth para evitar sumiço)
    var _novo_item = instance_create_depth(_drop_x, _drop_y, Obj_player.depth + 1, item_segurando.objeto_original);
    
    // Devolvemos as variáveis
    _novo_item.nome_exibicao = item_segurando.nome;
    _novo_item.id_item = item_segurando.id_unico;
    _novo_item.meu_offset_y = item_segurando.offset_y;

    item_segurando = noone;
    //audio_play_sound(snd_drop, 1, false);
}