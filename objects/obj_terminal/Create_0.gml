function interagir_com_puzzle(_eh_p1) {
    var _gerente = Obj_gerenciador;
    
    // NOVO: Se a sequência ainda estiver passando, ignora o clique
    if (_gerente.exibindo_sequencia) {
        // Opcional: tocar um som de "erro" ou "sistema ocupado"
        // audio_play_sound(snd_sistema_ocupado, 1, false);
        exit; 
    }

    // ... restante do seu código (checar passo, cor_id, etc) ...

    var _passo_atual = _eh_p1 ? _gerente.passo_p1 : _gerente.passo_p2;
    
    if (_passo_atual < 4) {
        var _cor_alvo = _gerente.sequencia[_passo_atual];

        if (cor_id == _cor_alvo) {
            // ACERTOU!
            if (_eh_p1) {
                _gerente.passo_p1 += 1;
                _gerente.feedback_p1_tipo = 1; // V na tela 1
                _gerente.feedback_p1_timer = 30;
            } else {
                _gerente.passo_p2 += 1;
                _gerente.feedback_p2_tipo = 1; // V na tela 2
                _gerente.feedback_p2_timer = 30;
            }
        } else {
            // ERROU! (Reseta ambos, mas mostra o X só para quem errou)
            _gerente.passo_p1 = 0;
            _gerente.passo_p2 = 0;
            
            if (_eh_p1) {
                _gerente.feedback_p1_tipo = 2; // X na tela 1
                _gerente.feedback_p1_timer = 60;
            } else {
                _gerente.feedback_p2_tipo = 2; // X na tela 2
                _gerente.feedback_p2_timer = 60;
            }
        }
    }
}