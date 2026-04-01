randomize();
nivel_atual = 1; 
sequencia = [0, 1, 2, 3]; 
array_shuffle_ext(sequencia);

// Progresso individual de cada sala
passo_p1 = 0; 
passo_p2 = 0; 

// Bloqueio para evitar que terminem o puzzle antes de chegar no nível 3
puzzle_completo = false;



// Novas variáveis para o Carrossel da Tela
exibindo_sequencia = false; // Começa desligada
timer_sequencia = 0;
indice_exibicao = 0;   // Qual posição da sequência a tela mostra agora (0 a 3)
tempo_cada_frame = 60; // 1 segundo por cor (ajuste se quiser mais rápido)


