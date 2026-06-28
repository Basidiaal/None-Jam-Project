if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = minha_velocidade; 
}

if (!instance_exists(Obj_gerenciador)) exit;
var _gerente = Obj_gerenciador;

var _meu_feedback = sou_tela_1 ? _gerente.feedback_p1_tipo : _gerente.feedback_p2_tipo;


// =========================================================================
// 0. PRIORIDADE ABSOLUTA: Desafio Totalmente Concluído (Fim das 3 fases)
// =========================================================================
if (global.puzzle_completo) {
    image_index = 18; // Trava o frame número 18 fixo na tela
} 
// 1. PRIORIDADE MÁXIMA: Feedbacks (V, X ou Fase Concluída)
else if (_meu_feedback != 0) {
    if (_meu_feedback == 1) image_index = 13; // Frame V
    else if (_meu_feedback == 2) image_index = 14; // Frame X
    else if (_meu_feedback == 3) image_index = 12; // Frame Fase Concluída
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
// =========================================================================
// 5. PADRÃO: Standby Dinâmico (Travado por Nível Atual)
// =========================================================================
else {
    // Se o desafio global ainda não começou no Level 1
    if (!desafio_iniciado) {
        if (sou_tela_1) {
            image_index += minha_velocidade;
            if (image_index < 19 || image_index >= 22) image_index = 19;
        } else {
            image_index = 12; // Tela 2 preta no início
        }
    } 
    else {
        // CHECAGEM SUPREMA: O nível que o gerenciador está rodando é MAIOR
        // do que o nível que este monitor registrou que foi concluído?
        // Se sim, significa que o Level está ATIVO (em andamento), não importa se errou ou acertou!
        
        // Crie uma variável local no monitor (ex: meu_nivel_concluido = 0 no Create)
        // para sabermos se estamos aguardando a ativação do próximo nível.
        // Se preferir não criar variáveis extras, use a lógica baseada na intro:
        
        var _nivel_em_andamento = (_gerente.intro_mostrada || _gerente.exibindo_sequencia || _gerente.feedback_p1_tipo != 0 || _gerente.feedback_p2_tipo != 0 || (_gerente.passo_p1 > 0 || _gerente.passo_p2 > 0));
        
        // Se o jogador errou, o gerenciador reseta os passos para 0, MAS a intro_mostrada CONTINUA true!
        // Então vamos travar a tela preta enquanto a intro_mostrada for true e o puzzle não acabar.
        if (_gerente.intro_mostrada && !global.puzzle_completo) {
            image_index = 12; // FORÇA TELA PRETA (Não importa se errou ou está no passo 0!)
        }
        else {
            // Se intro_mostrada é false, significa que o nível acabou de verdade e o gerenciador limpou os estados
            if (global.puzzle_completo) {
                image_index = 18; // Fim do jogo (Level 3 concluído)
            } 
            else {
                // Aguardando o jogador interagir para iniciar o PRÓXIMO nível
                if (sou_tela_1) {
                    image_index += minha_velocidade;
                    if (image_index < 19 || image_index >= 22) image_index = 19;
                } else {
                    image_index = 12;
                }
            }
        }
    }
}