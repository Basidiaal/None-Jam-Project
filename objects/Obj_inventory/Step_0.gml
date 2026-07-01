if (global.pause) {
    exit;
} 

if (keyboard_check_pressed(ord("G")) && item_segurando != noone) {
    var _movel = instance_nearest(Obj_player.x, Obj_player.y, Obj_movel_parent);
    
    // Define a distância da frente do player (ex: 20 pixels) ---
    var _distancia_frente = 5 * Obj_player.image_xscale;
    var _drop_x = Obj_player.x + _distancia_frente;
    var _drop_y = Obj_player.y;

    if (_movel != noone && distance_to_object(_movel) < 30) {
        // 1. Achamos a altura exata do tampo da mesa
        var _tampo_da_mesa = _movel.y - _movel.distancia_ate_o_tampo;
        
        // 2. Posicionamos o item para que a BASE dele toque o tampo
        _drop_x = clamp(Obj_player.x, _movel.bbox_left + 5, _movel.bbox_right - 5); 
        _drop_y = _tampo_da_mesa; 
        
        // Se a origem do item for no meio, ele precisa subir metade da sua altura
        _drop_y -= item_segurando.offset_y; 
    } 
    else {
        // =========================================================================
        // DROP NO CHÃO DINÂMICO (Varredura inteligente para achar o solo)
        // =========================================================================
        var _checar_y = Obj_player.y;
        var _max_procura = 300; // Limite de pixels para procurar o chão abaixo
        var _contador = 0;
        
        // Vai descendo a partir do Y do player até encontrar o bloco de colisão
        while (!position_meeting(_drop_x, _checar_y, Obj_Block) && _contador < _max_procura) {
            _checar_y += 1;
            _contador++;
        }
        
        // Aplica a posição do chão encontrado e compensa o offset normal do item
        _drop_y = _checar_y - item_segurando.offset_y;
    }

   // CRIAÇÃO DO ITEM (Usando depth para evitar sumiço)
    var _novo_item = instance_create_depth(_drop_x, _drop_y, Obj_player.depth + 1, item_segurando.objeto_original);
    
    // TOCAR O SOM ESPECÍFICO
    var _som = audio_play_sound(item_segurando.som_ao_dropar, 1, false);
    if (_som != noone) {
        audio_sound_pitch(_som, random_range(0.9, 1.2)); // Varia o tom
    }
    
    // Devolvemos absolutamente TODAS as variáveis para o objeto físico renascido no chão
    _novo_item.nome_exibicao  = item_segurando.nome;
    _novo_item.id_item        = item_segurando.id_unico;
    _novo_item.meu_offset_y   = item_segurando.offset_y;
    _novo_item.som_drop       = item_segurando.som_ao_dropar; // <-- Faltava essa variável!
    _novo_item.sprite_index   = item_segurando.sprite;        // Garante o visual correto
    
    // IMPORTANTE: Se o objeto usa Variable Definitions ou herança,
    // forçamos o reset da velocidade interna para ele não sumir
    if (variable_instance_exists(_novo_item, "minha_velocidade")) {
        _novo_item.minha_velocidade = _novo_item.image_speed;
    }

    // Esvazia a mão
    item_segurando = noone;
}