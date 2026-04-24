// Se o desafio acabou, ele começa a subir
if (global.puzzle_completo) {
    subindo = true;
}

if (subindo) {
    // O alvo é a posição inicial MENOS a distância (pois no GM o Y diminui para cima)
    var _alvo = y_inicial - distancia_para_subir;

    if (y > _alvo) {
        y -= velocidade_subida;
        
        // Efeito de tremor opcional
        x += random_range(-1, 1); 
    } else {
        y = _alvo; // Garante que pare exatamente no alvo
        subindo = false;
    }
}