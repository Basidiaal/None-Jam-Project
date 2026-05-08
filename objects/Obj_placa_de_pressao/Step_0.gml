if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = minha_velocidade; // Retoma a velocidade correta de cada objeto
}

pressionado = place_meeting(x, y, Obj_player) || place_meeting(x, y, Obj_player_2);

// Percorre a lista de barreiras e avisa cada uma
for (var i = 0; i < array_length(minhas_barreiras); i++) {
    var _inst = minhas_barreiras[i];
    if (instance_exists(_inst)) {
        _inst.aberta = pressionado;
    }
}