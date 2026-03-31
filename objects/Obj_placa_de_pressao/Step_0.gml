pressionado = place_meeting(x, y, Obj_player) || place_meeting(x, y, Obj_player_2);

// Percorre a lista de barreiras e avisa cada uma
for (var i = 0; i < array_length(minhas_barreiras); i++) {
    var _inst = minhas_barreiras[i];
    if (instance_exists(_inst)) {
        _inst.aberta = pressionado;
    }
}