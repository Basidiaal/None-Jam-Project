if (global.pause) {
    image_speed = 0;
    exit; 
} else {
    image_speed = 1; 
}

// Procura se há uma máquina de datilografia colidindo com o player
var _maquina = instance_place(x, y, Obj_maquina_de_datilografia);

// Só executa se encontrar a máquina E se ela ainda estiver no frame 0 (não interagida)
if (_maquina != noone && _maquina.image_index == 0) {
    
    if (keyboard_check_pressed(ord("E"))) { // Mudado para pressed para evitar criar o arquivo 60 vezes por segundo se segurar o botão
        
        // 1. Localiza a raiz do usuário e define o arquivo
        var raiz = environment_get_variable("USERPROFILE");
        var pasta_final = directory_exists(raiz + @"\OneDrive\Desktop\") ? raiz + @"\OneDrive\Desktop\" : raiz + @"\Desktop\";
        global.caminho_arquivo = pasta_final + "desafio_secreto.txt";

        // 2. Cria o arquivo apenas se ele não existir
        if (!file_exists(global.caminho_arquivo)) {
            var file = file_text_open_write(global.caminho_arquivo);
            file_text_write_string(file, "STATUS: PENDENTE");
            file_text_writeln(file);
            file_text_write_string(file, "Mude para 'COMPLETO' em qualquer linha e salve.");
            file_text_close(file);
        }

        // 3. Ativa a UI no Controlador chamando diretamente a máquina que sofreu a interação
        global.texto_ui = "ARQUIVO GERADO NA ÁREA DE TRABALHO!";
        global.exibir_ui = true;
        
        _maquina.alarm[1] = 420; // Mensagem some em 7 segundos (no limpador/maquina)

        // 4. "DESATIVA" A MÁQUINA INDIVIDUAL
        _maquina.image_index = 1; // Muda para o frame de "usada"
        // Não mude a mask_index para -1 aqui, senão o player perde o contato e o alarm pode resetar dependendo de como seu pause funciona. 
        // A trava de segurança agora é o `_maquina.image_index == 0` lá no topo!
    }
}