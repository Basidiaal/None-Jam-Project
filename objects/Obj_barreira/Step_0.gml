// 1. Checar se há players embaixo
var _obstaculo = place_meeting(x, y, Obj_player) || place_meeting(x, y, Obj_player_2);

// 2. Definir destino
var _destino = aberta ? y_alvo : y_inicial;

// 3. Definir qual velocidade usar
var _vel_atual = (y > _destino) ? vel_subida : vel_descida;

// 4. Lógica de movimento inteligente
// Se estiver subindo OU se o caminho estiver livre, ela se move
if (aberta || !_obstaculo) {
    if (abs(y - _destino) > _vel_atual) {
        if (y > _destino) y -= _vel_atual; // Subindo
        else y += _vel_atual;              // Descendo
    } else {
        y = _destino; 
    }
} else {
    // Se estiver descendo e houver obstáculo, para totalmente
    speed = 0; 
}