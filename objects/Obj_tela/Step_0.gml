// 1. Verifica se o gerenciador existe para não dar erro
if (!instance_exists(Obj_gerenciador)) exit;

var _gerente = Obj_gerenciador;

// 2. Descobre qual o passo atual (se é o meu ou do meu parceiro)
var _passo = sou_tela_1 ? _gerente.passo_p1 : _gerente.passo_p2;

// 3. Lógica de exibição baseada nos níveis que você definiu
if (_passo < 4) {
    var _cor_alvo = _gerente.sequencia[_passo];

    switch (_gerente.nivel_atual) {
        case 1:
            // P1 vê COR (0-3), P2 vê NOME (4-7)
            image_index = sou_tela_1 ? _cor_alvo : _cor_alvo + 4;
            break;
            
        case 2:
            // P1 vê NOME (4-7), P2 vê COR (0-3)
            image_index = sou_tela_1 ? _cor_alvo + 4 : _cor_alvo;
            break;
            
        case 3:
            // AMBOS vêm STROOP (8-11)
            image_index = _cor_alvo + 8;
            break;
    }
} else {
    // Se o player já terminou os 4 dele, mostra um frame de "OK" (ex: frame 12)
    image_index = 12; 
}