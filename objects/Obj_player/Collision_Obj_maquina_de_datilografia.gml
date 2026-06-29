// =========================================================================
// CONTROLE DE PAUSA DO PLAYER
// =========================================================================
if (global.pause) {
    image_speed = 0;
    exit; 
} else {
    image_speed = 1; 
}

// =========================================================================
// INTERAÇÃO COM A MÁQUINA DE DATILOGRAFIA
// =========================================================================
// Procura se o player está colidindo/encostando na máquina de datilografia
var _maquina = instance_place(x, y, Obj_maquina_de_datilografia);

// Só executa se a máquina existir E se ela ainda não tiver sido usada (frame 0)
if (_maquina != noone && _maquina.image_index == 0) {
    
    // Checa o clique único do botão "E"
    if (keyboard_check_pressed(ord("E"))) { 
        
        // 1. Localiza a raiz do usuário do Windows
        var raiz = environment_get_variable("USERPROFILE");
        var pasta_final = "";
        
        // 2. Define o caminho correto (com suporte ao OneDrive Desktop ou Desktop padrão)
        if (directory_exists(raiz + @"\OneDrive\Desktop\")) {
            pasta_final = raiz + @"\OneDrive\Desktop\";
        } else {
            pasta_final = raiz + @"\Desktop\";
        }
        global.caminho_arquivo = pasta_final + "desafio_secreto.txt";
        
        // 3. CRIAÇÃO DO ARQUIVO FÍSICO (Garantido)
        if (!file_exists(global.caminho_arquivo)) {
            var file = file_text_open_write(global.caminho_arquivo);
            file_text_write_string(file, "STATUS: PENDENTE");
            file_text_writeln(file);
            file_text_write_string(file, "Mude para 'COMPLETO' em qualquer linha e salve.");
            file_text_close(file);
        }
        
        // 4. CONFIGURAÇÃO DA INTERFACE (UI)
        // Força a string a atualizar com o caminho real gerado
        global.texto_ui = "ARQUIVO GERADO EM:\n" + string(global.caminho_arquivo);
        global.exibir_ui = true;
        
        // Define o alarme para sumir com a mensagem (600 frames = 10 segundos a 60fps)
        _maquina.alarm[1] = 600; 
        
        // 5. DESATIVAÇÃO DA MÁQUINA
        _maquina.image_index = 1; // Muda para o frame de usada
        _maquina.mask_index = -1;  // Desativa a colisão dela para o player não interagir de novo
    }
}