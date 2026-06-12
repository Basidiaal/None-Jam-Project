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
    
if (keyboard_check_pressed(ord("E"))) { 
    
    var raiz = environment_get_variable("USERPROFILE");
    
    // VERIFICAÇÃO INDIVIDUAL: Checa onde o arquivo vai ser criado
    if (directory_exists(raiz + @"\OneDrive\Desktop\")) {
        // SITUAÇÃO A: O jogador usa o OneDrive
        global.caminho_arquivo = raiz + @"\OneDrive\Desktop\desafio_secreto.txt";
        
        // Mensagem customizada avisando do OneDrive
        global.texto_ui = "UM ARQUIVO FOI CRIADO EM: " + string(global.caminho_arquivo);
    } else {
        // SITUAÇÃO B: Desktop padrão do Windows
        global.caminho_arquivo = raiz + @"\Desktop\desafio_secreto.txt";
        
        // Mensagem customizada padrão
        global.texto_ui = "UM ARQUIVO FOI CRIADO EM: " + string(global.caminho_arquivo);
    }
    
    // Cria o arquivo físico no local definido acima
    if (!file_exists(global.caminho_arquivo)) {
        var file = file_text_open_write(global.caminho_arquivo);
        file_text_write_string(file, "STATUS: PENDENTE");
        file_text_writeln(file);
        file_text_write_string(file, "Mude para 'COMPLETO' em qualquer linha e salve.");
        file_text_close(file);
    }
    
    // Ativa a exibição na GUI
    global.exibir_ui = true;
    _maquina.alarm[1] = 600; 

    // Desativa a máquina visualmente
    _maquina.image_index = 1; 


    }
}