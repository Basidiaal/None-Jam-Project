if (global.caminho_arquivo != "" && file_exists(global.caminho_arquivo)) {
    var file = file_text_open_read(global.caminho_arquivo);
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
        // 1. Entrega a recompensa
        global.pontos += 1000;
        
        // 2. Deleta o arquivo físico para limpar o PC do jogador
        file_delete(global.caminho_arquivo);
        
        // 3. Feedback final na UI
        global.texto_ui = "ACESSO CONCEDIDO! +1 PONTO";
        global.exibir_ui = true;
        
        // Criamos um objeto temporário só para apagar a mensagem da UI depois, 
        // já que este controlador vai morrer agora.
        var limpador = instance_create_depth(0, 0, 0, obj_limpador_ui); 
        limpador.alarm[0] = 180; 

        // 4. DESTRUIÇÃO TOTAL: A lógica para de rodar aqui.
        instance_destroy(); 
    }
}

// Se o objeto ainda existir, checa de novo em 1 segundo
if (instance_exists(id)) {
    alarm[0] = 60;
}