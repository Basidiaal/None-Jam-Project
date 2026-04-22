var _instancia_porta = instance_place(x, y, Obj_porta);

if (_instancia_porta != noone) {
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
                show_message("ERRO: Reinicialização necessária.");
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
                room_goto(Sala_3); 
            } else {
               var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
               _f.target_room = "restart";
            }
        } else {
            // Porta Falsa nos estágios 1, 2 ou 3: Volta pro início
           global.puzzle_stage = 1;
           global.interacted_count = 0; // Importante resetar isso também!

       var _f = instance_create_layer(0, 0, "Instances", obj_fade);
       _f.target_room = Sala_2;
        }
    }
}


// Verifica se há colisão com a porta simples
var _porta_comum = instance_place(x, y, Obj_porta_simples);

if (_porta_comum != noone) {
    // Definimos as coordenadas de destino no player antes de mudar de sala
    global.player_start_x = _porta_comum.target_x;
    global.player_start_y = _porta_comum.target_y;

    // Chama o objeto de Fade que criamos anteriormente
    var _f = instance_create_layer(0, 0, "Instances", Obj_fade);
    _f.target_room = _porta_comum.Sala_destino;
}