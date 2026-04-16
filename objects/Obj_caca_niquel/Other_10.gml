var f0 = floor(rolos_pos[0]);
var f1 = floor(rolos_pos[1]);
var f2 = floor(rolos_pos[2]);

if (f0 == f1 && f1 == f2) {
    // LÓGICA DE GANHAR (Aumentar FPS)
    var _premios = [5, 10, 15, 20, 25, 30];
    var _valor_ganho = _premios[f0];
    game_set_speed(game_get_speed(gamespeed_fps) + _valor_ganho, gamespeed_fps);
    
    // MARCAR VITÓRIA
    ganhou_nesta_sessao = true; 
    
    // Opcional: Você pode aumentar o tempo do alarme para 
    // o player comemorar antes do popup fechar sozinho
    alarm[0] = 120; 
} else {
    // SE PERDEU
    ganhou_nesta_sessao = false;
    alarm[0] = 60; 
}