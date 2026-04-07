if (!instance_exists(Obj_gerenciador)) exit;
var _gerente = Obj_gerenciador;

var _meu_feedback = sou_tela_1 ? _gerente.feedback_p1_tipo : _gerente.feedback_p2_tipo;

// 1. PRIORIDADE MÁXIMA: Feedbacks (V, X ou Fase Concluída)
if (_meu_feedback != 0) {
    if (_meu_feedback == 1) image_index = 13; // Frame V
    else if (_meu_feedback == 2) image_index = 14; // Frame X
    else if (_meu_feedback == 3) image_index = 18; // Frame Fase Concluída
} 
// 2. SEGUNDA PRIORIDADE: Intro de Nível (Fase 1, 2 ou 3)
else if (_gerente.exibindo_intro) {
    if (_gerente.nivel_atual == 1) image_index = 15;
    if (_gerente.nivel_atual == 2) image_index = 16;
    if (_gerente.nivel_atual == 3) image_index = 17;
}
// 3. TERCEIRA PRIORIDADE: Sequência em exibição
else if (_gerente.exibindo_sequencia) {
    var _cor_da_vez = _gerente.sequencia[_gerente.indice_exibicao];
    switch (_gerente.nivel_atual) {
        case 1: image_index = sou_tela_1 ? _cor_da_vez : _cor_da_vez + 4; break;
        case 2: image_index = sou_tela_1 ? _cor_da_vez + 4 : _cor_da_vez; break;
        case 3: image_index = _cor_da_vez + 8; break;
    }
} 
// 4. QUARTA PRIORIDADE: Estado de OK (V fixo quando o player termina sua parte)
else if ((sou_tela_1 && _gerente.passo_p1 >= 4) || (!sou_tela_1 && _gerente.passo_p2 >= 4)) {
    image_index = 13; 
}
// 5. PADRÃO: Standby
else {
    image_index = 12; 
}