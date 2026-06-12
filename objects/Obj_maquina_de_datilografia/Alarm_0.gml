// Dentro do evento Alarm 0
if (global.pause) {
    alarm[0] = 60; 
    exit;          
}

if (global.caminho_arquivo != "" && file_exists(global.caminho_arquivo)) {
    var file = file_text_open_read(global.caminho_arquivo);
	// Abre o explorador de arquivos exatamente na pasta onde o jogo salva os dados

    var sucesso = false;
    var senha = "COMPLETO";

    while (!file_text_eof(file)) {
        var linha = string_trim(string_upper(file_text_read_string(file)));
        if (linha == string_upper(senha)) {
            sucesso = true;
            break;
        }
        file_text_readln(file);
    }
    file_text_close(file);

    if (sucesso) {
        // 1. Registra globalmente que o puzzle foi feito (isso funciona em qualquer sala!)
        global.puzzle_resolvido = true;

        // Se o outro objeto estiver na MESMA sala (caso o jogador resolva o puzzle na sala dele)
        if (instance_exists(Obj_venda_no_pedestal)) {
            with (Obj_venda_no_pedestal) {
                image_speed = 1; 
                image_index = 0; 
            }
        }
        
        // 2. Deleta o arquivo físico para limpar o PC do jogador
        file_delete(global.caminho_arquivo);
        
        // 3. Feedback na UI (SÓ cria se o Obj_main_menu existir nesta sala)
        if (instance_exists(Obj_main_menu)) {
            global.texto_ui = Obj_main_menu.texto_item_liberado[Obj_main_menu.lang_index];
            global.exibir_ui = true;
            
            var limpador = instance_create_depth(0, 0, 0, obj_limpador_ui); 
            limpador.alarm[0] = 180; 
        }

        // 4. DESTRUIÇÃO TOTAL: O controlador morre pois o puzzle acabou
        instance_destroy(); 
        exit; // Garante que o código para aqui
    }
}

// Se o objeto ainda existir, checa de novo em 1 segundo
if (instance_exists(id)) {
    alarm[0] = 60;
}