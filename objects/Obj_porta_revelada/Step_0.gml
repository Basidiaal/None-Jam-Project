if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = minha_velocidade; // Retoma a velocidade correta de cada objeto
}

event_inherited()
event_inherited()

// 1. Primeiro, checamos se a pintura ainda está na frente com segurança
if (instance_exists(Obj_pintura_secreta)) {
    // Pegamos a ID real da pintura presente na sala atual
    var _pintura = instance_find(Obj_pintura_secreta, 0);
    
    // Se a pintura ainda está se movendo ou não atingiu o alvo
    if (_pintura.y > _pintura.y_alvo + 5) {
        bloqueada = true;
    } else {
        bloqueada = false;
    }
} else {
    // Se a pintura foi destruída ou não existe mais na sala, a porta desloqueia automaticamente
    bloqueada = false;
}

// 2. Lógica de Interação
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    if (!bloqueada) {
        // 1. Alimenta a posição onde o player DEVE nascer de verdade
        global.player_start_x = target_x;
        global.player_start_y = target_y;

        // 2. FORÇA O RESET das variáveis de target para 0!
        // Isso impede que a segunda checagem do Room Start do Player jogue ele no limbo
        global.target_x = 0;
        global.target_y = 0;

        // 3. Cria o fade para a sala certa
        var _fade = instance_create_depth(0, 0, -9999, Obj_fade);
        _fade.target_room = sala_destino; // Usando 'sala_destino' das Variable Definitions
    }
}