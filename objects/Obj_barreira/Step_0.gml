// 1. Checar se há players embaixo (Sua lógica)
var _obstaculo = place_meeting(x, y + vel_descida, Obj_player) || place_meeting(x, y + vel_descida, Obj_player_2);

// 2. Definir destino (Sua lógica)
var _destino = aberta ? y_alvo : y_inicial;

// 3. Definir qual velocidade usar (Sua lógica)
var _subindo = (y > _destino);
var _vel_atual = _subindo ? vel_subida : vel_descida;

// 4. Lógica de movimento inteligente (ADAPTADA)
if (y != _destino) {
    if (_subindo) {
        // Se estiver subindo, o caminho é sempre livre
        if (abs(y - _destino) > _vel_atual) y -= _vel_atual;
        else y = _destino;
    } 
    else {
        // SE ESTIVER DESCENDO
        if (!_obstaculo) {
            // Caminho livre: desce na velocidade máxima
            if (abs(y - _destino) > _vel_atual) y += _vel_atual;
            else y = _destino;
        } 
        else {
            // TEM ALGUÉM EMBAIXO:
            // Em vez de parar de uma vez, desce pixel por pixel até chegar perto
            // O loop para quando detectar colisão no próximo pixel (y + 1)
            while (!place_meeting(x, y + 1, Obj_player) && !place_meeting(x, y + 1, Obj_player_2) && y < _destino) {
                y += 1;
            }
            // Aqui a barreira para exatamente encostada/1px acima, sem bugar o player
        }
    }
}