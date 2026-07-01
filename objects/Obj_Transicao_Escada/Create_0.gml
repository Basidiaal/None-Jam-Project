alpha = 0;          // Controla a opacidade da tela preta
estado = 0;         // 0 = Escurecendo, 1 = Teleportando/Som, 2 = Clareando
velocidade_fade = 0.05; // Velocidade do efeito (aumente para ser mais rápido)

// Variáveis que a escada vai passar para este objeto
alvo_x = 0;
alvo_y = 0;
alvo_lado = 1;
// NOVA VARIÁVEL: Garante que o som só toque uma vez
som_iniciado = false;