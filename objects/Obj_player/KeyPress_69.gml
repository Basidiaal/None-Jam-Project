
var _instancia_porta = instance_place(x, y, Obj_porta);

if (_instancia_porta != noone) {
   // Marcamos o player como congelado ANTES de entrar no with
    frozen = true; 
    velh = 0;
    velv = 0;
   with (_instancia_porta) {

        
        // --- ESTÁGIO 4: AS 5 PORTAS COM DESTINOS ESPECÍFICOS ---
        if (global.puzzle_stage == 4) {
            if (!ja_clicou) {
                ja_clicou = true;
                global.interacted_count += 1;
            }

            // Define o destino baseado no door_id desta porta
            // AJUSTE OS NÚMEROS ABAIXO para as coordenadas que você deseja
            switch(door_id) {
                case 1: global.target_x = 875; global.target_y = 703; break;
                case 2: global.target_x = 194; global.target_y = 703; break;
                case 3: global.target_x = 690; global.target_y = 703; break;
                case 4: global.target_x = 510; global.target_y = 703; break;
                case 5: global.target_x = 340; global.target_y = 703; break;
            }

            // Se for a 5ª porta, ativa o elemento Meta antes de sair
            if (global.interacted_count >= 5) {
                window_set_fullscreen(false);
                window_set_size(678, 450);
				window_center()
                ini_open("save_meta.ini");
                ini_write_real("Status", "restart_feito", 1);
                ini_close();
                show_message(Obj_main_menu.texto_dica1[Obj_main_menu.lang_index]);
            }

            // Inicia o Fade para a sala externa
            var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
            _f.target_room = Sala_2; 
			
            exit;
        }

        // --- ESTÁGIOS NORMAIS (1, 2, 3) E FINAL (5) ---
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
		
            // Porta Falsa nos estágios 1, 2 ou 3: Volta pro início
           global.puzzle_stage = 1;
           global.interacted_count = 0; // Importante resetar isso também!

       var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
       _f.target_room = Sala_2;
	
        }
    }
}

// [Mantenha o código do puzzle stage 4 / Obj_porta lá em cima como está...]

// Antes de checar as portas, criamos a variável global se ela não existir
if (!variable_global_exists("item_coletado_neste_frame")) {
    global.item_coletado_neste_frame = false;
}

// Se o item foi pego no Step do próprio item, barra as portas imediatamente!
if (global.item_coletado_neste_frame) {
    global.item_coletado_neste_frame = false; // Reseta para o próximo frame
    exit; // Para o código aqui e não deixa entrar em nenhuma porta!
}

// =========================================================================
// SE NENHUM ITEM FOI PEGO, COMPORTAMENTO NORMAL DA PORTA SIMPLES:
// =========================================================================

// Porta simples normal
var _porta_comum = instance_place(x, y, Obj_porta_simples);
if (_porta_comum != noone) {
    var _esta_bloqueada = false;
    if (variable_instance_exists(_porta_comum, "bloqueada")) {
        _esta_bloqueada = _porta_comum.bloqueada;
    }
    
    if (!_esta_bloqueada) {
        global.player_start_x = _porta_comum.target_x_porta_simples;
        global.player_start_y = _porta_comum.target_y_porta_simples;
        
        global.target_x = 0;
        global.target_y = 0;

        var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
        _f.target_room = _porta_comum.Sala_destino;
        
        io_clear();
        exit;
    }
}

// Porta simples 1
var _porta_comum_2 = instance_place(x, y, Obj_porta_simples_1);
if (_porta_comum_2 != noone) {
    var _esta_bloqueada2 = false;
    if (variable_instance_exists(_porta_comum_2, "bloqueada")) {
        _esta_bloqueada2 = _porta_comum_2.bloqueada;
    }
    
    if (!_esta_bloqueada2) {
        global.player_start_x = _porta_comum_2.target_x_porta_simples;
        global.player_start_y = _porta_comum_2.target_y_porta_simples;
        
        global.target_x = 0;
        global.target_y = 0;

        var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
        _f.target_room = _porta_comum_2.Sala_destino;
        
        io_clear();
        exit;
    }
}