global.fichas = 0;
global.fichas_objetivo = 500;
global.fps_multiplicador = 1.0; // 1.0 = 100% da velocidade (60 FPS)
global.blackjack_ativo = false;
// Este código roda automaticamente no início do jogo
global.fps_minimo = 10;
global.fps_padrao = 60;
global.fichas_atuais = 0;
global.fichas_objetivo = 100;

global.em_jogo = false;

// Garante que o jogo comece na velocidade máxima
game_set_speed(global.fps_padrao, gamespeed_fps);