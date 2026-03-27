// 1. Se o jogo estiver pausado (lendo bilhete), ignora a porta
if (global.pausado) exit;

// 2. Lógica do Fade
if (executando_fade) {
    persistent = true; // A porta precisa "viajar" entre as salas para terminar o fade

    if (!mudei) {
        alpha += 0.02; // Velocidade de escurecimento
        if (alpha >= 1) {
            alpha = 1;
            mudei = true;
            if (room_exists(destino)) room_goto(destino);
            
            // Move o jogador na nova sala
            if (instance_exists(obj_player)) {
                obj_player.x = destino_x;
                obj_player.y = destino_y;
            }
        }
    } else {
        alpha -= 0.02; // Velocidade de clareamento
        if (alpha <= 0) {
            instance_destroy(); // A porta termina o serviço e se deleta
        }
    }
}