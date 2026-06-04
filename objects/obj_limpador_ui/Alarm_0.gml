// Dentro do evento Alarm 0
if (global.pause) {
    alarm[0] = 1; // Adia o alarme para o próximo frame
    exit;         // Sai e não executa o código de ataque/interação agora
}
global.exibir_ui = false;
instance_destroy();