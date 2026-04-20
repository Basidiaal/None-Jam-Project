var f0 = floor(rolos_pos[0]);
var f1 = floor(rolos_pos[1]);
var f2 = floor(rolos_pos[2]);

if (f0 == f1 && f1 == f2) {
    // VITÓRIA
    var _premios = [5, 10, 15, 20, 25, 30];
    var _valor_ganho = _premios[f0];
    game_set_speed(game_get_speed(gamespeed_fps) + _valor_ganho, gamespeed_fps);
    
    ganhou_nesta_sessao = true; 
    alarm[0] = 90; // 1.5 segundos de comemoração
} else {
    // DERROTA
    ganhou_nesta_sessao = false;
    // O tempo aqui é o que o jogador verá os números errados antes de resetarem
    alarm[0] = 60; 
}