/// @description Gerenciar tentativas e Dica
if (contar_porta) {
    tentativas += 1;
    contar_porta = false; // Reseta o gatilho
    
    // Salva as tentativas no arquivo (para persistir entre room_restarts)
    ini_open("meta_data.ini");
    ini_write_real("Progresso", "tentativas", tentativas);
    ini_close();
}

// Se atingiu as 5 portas, prepara o Meta-Puzzle
if (tentativas >= max_portas && reiniciou_com_sucesso == 0 && estado_mensagem == 0 && sequencia_finalizada == false) {
 estado_mensagem = 1;
    timer_mensagem = duracao_texto;
    indice_atual = 0;
	
	//caso eu queira mudar o tamanho da tela quando a dica for feita
	/*
    window_set_size(678, 450); // Muda o tamanho da janela
    surface_resize(application_surface, 678, 450); // Ajusta a qualidade da imagem
    
    // Centraliza a janela na tela após um pequeno delay (necessário no Windows)
    alarm[0] = 1; 
	*/
	alarm[1] = 1000;


    // Marca no arquivo que o próximo boot deve liberar a porta
    ini_open("meta_data.ini");
    ini_write_real("Sistema", "boot_confirmado", 1);
    ini_close();
	


}

// Máquina de Estados
if (timer_mensagem > 0) {
    timer_mensagem -= 1;
} else if (estado_mensagem != 0) {
    
    if (estado_mensagem == 1) { // Estava exibindo texto
        indice_atual += 1;
        
        if (indice_atual < array_length(mensagens)) {
            estado_mensagem = 2; // Vai para a pausa antes da próxima
            timer_mensagem = duracao_pausa;
        } else {
            // ACABARAM AS MENSAGENS
            estado_mensagem = 0;
            sequencia_finalizada = true; // ATIVA A TRAVA
        }
    } 
    else if (estado_mensagem == 2) { // Estava na pausa
        estado_mensagem = 1;
        timer_mensagem = duracao_texto;
    }
}