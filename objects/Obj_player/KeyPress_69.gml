// Antes de checar as portas, criamos e verificamos se um item foi coletado neste frame
if (!variable_global_exists("item_coletado_neste_frame")) {
    global.item_coletado_neste_frame = false;
}
if (global.item_coletado_neste_frame) {
    global.item_coletado_neste_frame = false; 
    exit; 
}

// =========================================================================
// OBJ_PORTA (Com animação e centralização)
// =========================================================================
var _instancia_porta = instance_place(x, y, Obj_porta);
if (_instancia_porta != noone) {
    frozen = true; 
    velh = 0;
    velv = 0;
    
    x = _instancia_porta.x; 

    if (xscale == -1) {
        sprite_index = Spr_Player_interagindo3_1; 
    }
    if (xscale == 1) {
        sprite_index = Spr_Player_interagindo3; 
    }
    image_index = 0; 
    image_speed = 1; 

    with (_instancia_porta) {
        if (global.puzzle_stage == 4) {
            if (!ja_clicou) {
                ja_clicou = true;
                global.interacted_count += 1;
            }

            switch(door_id) {
                case 1: global.target_x = 875; global.target_y = 703; break;
                case 2: global.target_x = 194; global.target_y = 703; break;
                case 3: global.target_x = 690; global.target_y = 703; break;
                case 4: global.target_x = 510; global.target_y = 703; break;
                case 5: global.target_x = 340; global.target_y = 703; break;
            }

            if (global.interacted_count >= 5) {
                window_set_fullscreen(false);
                window_set_size(678, 450);
                window_center();
                ini_open("save_meta.ini");
                ini_write_real("Status", "restart_feito", 1);
                ini_close();
                show_message(Obj_main_menu.texto_dica1[Obj_main_menu.lang_index]);
            }

            var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
            _f.target_room = Sala_2; 
			_f.esperar_animacao = true; // --- ADICIONE ISSO --- (Aqui também vai esperar)
            exit;
        }

        if (is_real_door) {
            global.puzzle_stage += 1;
            if (global.puzzle_stage > 5) {
                if (file_exists("save_meta.ini")) file_delete("save_meta.ini");
                var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
                _f.target_room = Sala_3;
            } else {
                var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
                _f.target_room = "restart";
            }
        } else {
            global.puzzle_stage = 1;
            global.interacted_count = 0; 
            var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
            _f.target_room = Sala_2;
        }
    }
}

// =========================================================================
// OBJ_PORTA_SIMPLES (Mantém animação e centralização original)
// =========================================================================
var _porta_comum = instance_place(x, y, Obj_porta_simples);
if (_porta_comum != noone) {
    var _esta_bloqueada = false;
    if (variable_instance_exists(_porta_comum, "bloqueada")) {
        _esta_bloqueada = _porta_comum.bloqueada;
    }
    
    if (!_esta_bloqueada) {
        frozen = true;
        velh = 0;
        velv = 0;
        x = _porta_comum.x;
        
        if (xscale == -1) {
            sprite_index = Spr_Player_interagindo3_1; 
        }
        if (xscale == 1) {
            sprite_index = Spr_Player_interagindo3; 
        }
        image_index = 0;

        global.player_start_x = _porta_comum.target_x_porta_simples;
        global.player_start_y = _porta_comum.target_y_porta_simples;
        global.target_x = 0;
        global.target_y = 0;

        var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
        _f.target_room = _porta_comum.Sala_destino;
        _f.esperar_animacao = true; // --- ADICIONE ISSO --- (Aqui também vai esperar)
        io_clear();
        exit;
    }
}

// =========================================================================
// OBJ_PORTA_SIMPLES_1 (SEM ALTERAR X E SEM MAPEAR ANIMAÇÃO)
// =========================================================================
var _porta_comum_2 = instance_place(x, y, Obj_porta_simples_1);
if (_porta_comum_2 != noone) {
    var _esta_bloqueada2 = false;
    if (variable_instance_exists(_porta_comum_2, "bloqueada")) {
        _esta_bloqueada2 = _porta_comum_2.bloqueada;
    }
    
    if (!_esta_bloqueada2) {
        frozen = true; // Apenas congela o movimento normal do step
        velh = 0;
        velv = 0;
        // NOTA: x = _porta_comum_2.x removido para não alterar sua posição!
        // NOTA: sprite_index removido para manter a sprite atual (andando ou idle)

        global.player_start_x = _porta_comum_2.target_x;
        global.player_start_y = _porta_comum_2.target_y;
        global.target_x = 0;
        global.target_y = 0;

        var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
        _f.target_room = _porta_comum_2.Sala_destino;
        
        io_clear();
        exit;
    }
}

// =========================================================================
// OBJ_PORTA_LATERAL_DIREITA (SEM ANIMAÇÃO E SEM MUDAR X)
// =========================================================================
var _porta_lat_dir = instance_place(x, y, Obj_porta_lateral_direita); // Ajuste para o nome exato do seu objeto
if (_porta_lat_dir != noone) {
    frozen = true;
    velh = 0;
    velv = 0;

    global.player_start_x = _porta_lat_dir.target_x_porta_simples;
    global.player_start_y = _porta_lat_dir.target_y_porta_simples;
    global.target_x = 0;
    global.target_y = 0;

    var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
    _f.target_room = _porta_lat_dir.Sala_destino;
    
    io_clear();
    exit;
}

// =========================================================================
// OBJ_PORTA_LATERAL_ESQUERDA (SEM ANIMAÇÃO E SEM MUDAR X)
// =========================================================================
var _porta_lat_esq = instance_place(x, y, Obj_porta_lateral_esquerda); // Ajuste para o nome exato do seu objeto
if (_porta_lat_esq != noone) {
    frozen = true;
    velh = 0;
    velv = 0;

    global.player_start_x = _porta_lat_esq.target_x_porta_simples;
    global.player_start_y = _porta_lat_esq.target_y_porta_simples;
    global.target_x = 0;
    global.target_y = 0;

    var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
    _f.target_room = _porta_lat_esq.Sala_destino;
    
    io_clear();
    exit;
}