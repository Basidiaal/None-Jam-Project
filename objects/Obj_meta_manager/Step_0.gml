/// @description Gerenciar tentativas e Dica
if (contar_porta) {
    tentativas += 1;
    contar_porta = false; 
    
    ini_open("meta_data.ini");
    ini_write_real("Progresso", "tentativas", tentativas);
    ini_close();
}

// Se atingiu as 5 portas, prepara o Meta-Puzzle
if (tentativas >= max_portas && reiniciou_com_sucesso == 0 && estado_mensagem == 0 && sequencia_finalizada == false) {
    estado_mensagem = 1;
    timer_mensagem = duracao_texto;
    indice_atual = 0;
    
    window_set_fullscreen(false);
    window_set_size(678, 450); 
    surface_resize(application_surface, 678, 450); 
    window_center();

    // Marca no arquivo que o próximo boot deve liberar a porta
    ini_open("meta_data.ini");
    ini_write_real("Sistema", "boot_confirmado", 1);
    ini_close();
}

// Máquina de Estados das Mensagens
if (timer_mensagem > 0) {
    timer_mensagem -= 1;
} else if (estado_mensagem != 0) {
    if (estado_mensagem == 1) { 
        indice_atual += 1;
        if (indice_atual < array_length(mensagens)) {
            estado_mensagem = 2; 
            timer_mensagem = duracao_pausa;
        } else {
            estado_mensagem = 0;
            sequencia_finalizada = true; 
        }
    } 
    else if (estado_mensagem == 2) { 
        estado_mensagem = 1;
        timer_mensagem = duracao_texto;
    }
}