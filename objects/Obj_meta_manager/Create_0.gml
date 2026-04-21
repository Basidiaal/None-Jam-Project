/// @description Lógica do Meta-Puzzle
contar_porta = false;
max_portas = 5;

// Carregar progresso
ini_open("meta_data.ini");
tentativas = ini_read_real("Progresso", "tentativas", 0);
reiniciou_com_sucesso = ini_read_real("Sistema", "boot_confirmado", 0);
ini_close();

// Se o player entrar aqui mas o arquivo diz que ele já reiniciou, manda para a vitória
if (reiniciou_com_sucesso == 1) {
    room_goto(Rm_sala_vitoria);
    exit; // Para a execução do resto do código
}

/// @description Configurações Dinâmicas (Mensagens)
estado_mensagem = 0; 
timer_mensagem = 0;
indice_atual = 0;
sequencia_finalizada = false; 

mensagens = [
    "a oportunidade é como uma JANELA as vezes a JANELA precisa \nser FECHADA para uma porta ser aberta.",
    "fechar a janela...",
    "aperte alt+f4 e depois entre de novo para ver a mágica.",
    "a oportunidade é como uma JANELA as vezes a JANELA precisa \nser FECHADA para uma porta ser aberta.",
];

duracao_texto = 480; 
duracao_pausa = 3600;