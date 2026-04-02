if (!instance_exists(Obj_gerenciador)) exit;
var _gerente = Obj_gerenciador;

// 1. Pega o feedback específico desta tela
var _meu_feedback = sou_tela_1 ? _gerente.feedback_p1_tipo : _gerente.feedback_p2_tipo;

// 2. PRIORIDADE: Feedback individual
if (_meu_feedback != 0) {
    image_index = (_meu_feedback == 1) ? 13 : 14;
} 
// 3. SEGUNDA PRIORIDADE: Sequência em exibição
else if (_gerente.exibindo_sequencia) {
    var _cor_da_vez = _gerente.sequencia[_gerente.indice_exibicao];
    switch (_gerente.nivel_atual) {
        case 1: image_index = sou_tela_1 ? _cor_da_vez : _cor_da_vez + 4; break;
        case 2: image_index = sou_tela_1 ? _cor_da_vez + 4 : _cor_da_vez; break;
        case 3: image_index = _cor_da_vez + 8; break;
    }
} 
// 4. TERCEIRA PRIORIDADE: Concluído (Sinal de OK)
else if ((sou_tela_1 && _gerente.passo_p1 >= 4) || (!sou_tela_1 && _gerente.passo_p2 >= 4)) {
    image_index = 13; 
}
// 5. PADRÃO: Standby
else {
    image_index = 12; 
}