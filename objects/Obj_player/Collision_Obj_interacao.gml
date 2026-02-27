if(keyboard_check(ord("E"))){
// 1. Localiza a raiz do usuário
var raiz = environment_get_variable("USERPROFILE");
var pasta_final = directory_exists(raiz + @"\OneDrive\Desktop\") ? raiz + @"\OneDrive\Desktop\" : raiz + @"\Desktop\";
global.caminho_arquivo = pasta_final + "desafio_secreto.txt";

// 2. Cria o arquivo apenas se ele não existir (para evitar erro de escrita)
if (!file_exists(global.caminho_arquivo)) {
    var file = file_text_open_write(global.caminho_arquivo);
    file_text_write_string(file, "STATUS: PENDENTE");
    file_text_writeln(file);
    file_text_write_string(file, "Mude para 'COMPLETO' em qualquer linha e salve.");
    file_text_close(file);
}

// 3. Ativa a UI no Controlador
global.texto_ui = "ARQUIVO GERADO EM:\n" + global.caminho_arquivo;
global.exibir_ui = true;
Obj_interacao.alarm[1] = 420; // Mensagem some em 7 segundos

// 4. "DESATIVA" ESTE OBJETO (Sumiço e Colisão)
sprite_index = -1;
mask_index = -1;
}