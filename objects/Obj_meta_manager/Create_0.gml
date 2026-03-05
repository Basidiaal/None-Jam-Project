/// @description Lógica do Meta-Puzzle
contar_porta = false;
max_portas = 5;


// Carregar progresso do arquivo
ini_open("meta_data.ini");
// Lê quantas portas já testou (para manter o contador mesmo após o room_restart)
tentativas = ini_read_real("Progresso", "tentativas", 0);
// Lê se o jogo foi reiniciado após a dica
reiniciou_com_sucesso = ini_read_real("Sistema", "boot_confirmado", 0);
ini_close();

mostrar_mensagem = false;

// Se o jogador já viu a dica e FECHOU/ABRIU o jogo:
if (reiniciou_com_sucesso == 1) {
    // 1. Deleta todas as portas falsas nesta sala
    with(Obj_porta_falsa) { instance_destroy(); }
    
    // 2. Cria a porta VERDADEIRA (ajuste X e Y)
    instance_create_layer(384, 704, "sensores", Obj_porta_real);

}

/// @description Configurações Dinâmicas
estado_mensagem = 0; 
timer_mensagem = 0;
indice_atual = 0;
sequencia_finalizada = false; // TRAVA: Impede que a sequência recomece
//para definir a quantidade de mensagens é simples é só adicionar ou retirar as mensagens que
//quiser no array mensagens
mensagens = [
   "a oportunidade é como uma JANELA as vezes a JANELA precisa \nser FECHADA para uma porta ser aberta.",
    "fechar a janela...",
	"aperte alt+f4 e depois entre de novo para ver a mágica"
];
//esse é o tempo que o texto fica na tela
duracao_texto = 480; 
//esse é o tempo de intervalo entre cada mensagem
duracao_pausa = 3600;