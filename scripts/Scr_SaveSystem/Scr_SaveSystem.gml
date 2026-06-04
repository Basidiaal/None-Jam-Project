/// @desc Centraliza as funções de persistência do jogo

function scr_save_game() {
    // 1. Criamos o "pacote" com tudo o que é essencial
    var _save_data = {
        // --- INFORMAÇÕES DE LOCALIZAÇÃO ---
        sala_atual: room_get_name(room),
        
        // Player 1
        p1_x: Obj_player.x,
        p1_y: Obj_player.y,
        p1_hp: Obj_player.current_life,
        
        // Player 2 (Salva se ele existe e onde está)
        p2_ativo: instance_exists(Obj_player_2),
        p2_x: instance_exists(Obj_player_2) ? Obj_player_2.x : 0,
        p2_y: instance_exists(Obj_player_2) ? Obj_player_2.y : 0,

        // Câmera (Substituindo o antigo checkpoint.ini)
        cam_x: instance_exists(Obj_Camera) ? Obj_Camera.x : 0,
        cam_y: instance_exists(Obj_Camera) ? Obj_Camera.y : 0,

        // --- PROGRESSO DOS SISTEMAS ---
        puzzle: {
            nivel: instance_exists(Obj_gerenciador) ? Obj_gerenciador.nivel_atual : 1,
            estagio: global.puzzle_stage,
            item_coletado: global.item_coletado,
            completo: global.puzzle_completo
        },

        // --- ESTADO DO MUNDO ---
        // Aqui salvamos quais portas abriram, barreiras desceram, etc.
        world_states: global.world_state 
    };

    // 2. Transforma o pacote em uma String (Texto)
    var _string = json_stringify(_save_data);
    
    // 3. Salva no arquivo físico
    var _file = file_text_open_write("save_principal.json");
    file_text_write_string(_file, _string);
    file_text_close(_file);
    
    show_debug_message("Jogo Salvo com Sucesso!");
}

function scr_load_game() {
    if (!file_exists("save_principal.json")) {
        show_debug_message("Nenhum arquivo de save encontrado.");
        return;
    }

    // 1. Lê o arquivo
    var _file = file_text_open_read("save_principal.json");
    var _json = file_text_read_string(_file);
    file_text_close(_file);

    // 2. Converte de volta para um Struct (pacote de dados)
    var _data = json_parse(_json);

    // 3. Alimenta as variáveis GLOBAIS que os objetos vão ler ao nascer
    global.p1_target_x = _data.p1_x;
    global.p1_target_y = _data.p1_y;
    global.p1_hp       = _data.p1_hp;
    
    global.cam_target_x = _data.cam_x;
    global.cam_target_y = _data.cam_y;

    global.p2_should_exist = _data.p2_ativo;
    global.p2_target_x     = _data.p2_x;
    global.p2_target_y     = _data.p2_y;

    global.nivel_carregar    = _data.puzzle.nivel;
    global.puzzle_stage      = _data.puzzle.estagio;
    global.item_coletado     = _data.puzzle.item_coletado;
    global.puzzle_completo   = _data.puzzle.completo;
    
    global.world_state = _data.world_states;

    // 4. Vai para a sala salva
    var _target_room = asset_get_index(_data.sala_atual);
    room_goto(_target_room);
}