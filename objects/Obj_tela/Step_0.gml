if (!instance_exists(Obj_gerenciador)) exit;

var _gerente = Obj_gerenciador;

if (_gerente.exibindo_sequencia) {
    var _cor_da_vez = _gerente.sequencia[_gerente.indice_exibicao];

    switch (_gerente.nivel_atual) {
        case 1: image_index = sou_tela_1 ? _cor_da_vez : _cor_da_vez + 4; break;
        case 2: image_index = sou_tela_1 ? _cor_da_vez + 4 : _cor_da_vez; break;
        case 3: image_index = _cor_da_vez + 8; break;
    }
} else {
    // Frame 13: Tela em "Standby" ou desligada enquanto ninguém aperta o botão
    image_index = 12; 
    
    // Se o player já terminou, mantém o OK (Frame 12) mesmo com a tela desligada
    if (sou_tela_1 && _gerente.passo_p1 >= 4) image_index = 12;
    if (!sou_tela_1 && _gerente.passo_p2 >= 4) image_index = 12;
}