event_inherited();
id_necessario = ""; // Deixe vazio, pois checaremos 3 itens diferentes
image_speed = 0;

// Estado das partes (false = faltando, true = colocada)
tem_cabeca = false;
tem_braco  = false;
tem_perna  = false;

movendo = false;
x_alvo = x + 200; // Move para o lado
velocidade = 1;


// Variáveis de Áudio Manual
som_arrastando = noone;
dist_maxima_som = 400; // Ajuste o alcance do som aqui