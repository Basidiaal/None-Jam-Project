randomize();
nivel_atual = 1; 
sequencia = [0, 1, 2, 3]; 
array_shuffle_ext(sequencia);

// Progresso individual de cada sala
passo_p1 = 0; 
passo_p2 = 0; 

// Bloqueio para evitar que terminem o puzzle antes de chegar no nível 3
global.puzzle_completo = false;

global.item_coletado = false;

// Novas variáveis para o Carrossel da Tela
exibindo_sequencia = false; // Começa desligada
timer_sequencia = 0;
indice_exibicao = 0;   // Qual posição da sequência a tela mostra agora (0 a 3)
tempo_cada_frame = 60; // 1 segundo por cor (ajuste se quiser mais rápido)


// Controle de Intro e Feedback
intro_mostrada = false; // Indica se o "Fase X" já apareceu neste nível
exibindo_intro = false;  // Estado visual
timer_intro = 0;
tempo_cada_intro = 90;  // 1.5 segundos de anúncio da fase

// ... suas variáveis já existentes (randomize, nivel_atual, etc) ...

// ... suas outras variáveis ...

// Feedback Individual para as Telas
feedback_p1_tipo = 0;  // 0: nada, 1: V, 2: X
feedback_p1_timer = 0;

feedback_p2_tipo = 0;  // 0: nada, 1: V, 2: X
feedback_p2_timer = 0;