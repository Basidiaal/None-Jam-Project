function interagir_com_puzzle(_eh_p1) {
    var _gerente = Obj_gerenciador;
    
    // Define qual passo checar: o do P1 ou do P2
    var _passo_atual = _eh_p1 ? _gerente.passo_p1 : _gerente.passo_p2;
    
    // Se o player ainda não terminou seus 4 botões
    if (_passo_atual < 4) {
        var _cor_alvo = _gerente.sequencia[_passo_atual];

        if (cor_id == _cor_alvo) {
            // ACERTOU!
            if (_eh_p1) _gerente.passo_p1 += 1;
            else _gerente.passo_p2 += 1;
            
            
            // Efeito visual no terminal (opcional)
            image_index = 1; 
        } else {
            // ERROU! (Punição)
            _gerente.passo_p1 = 0;
            _gerente.passo_p2 = 0;
           
            
            // Faz todas as luzes dos terminais resetarem
            with(Obj_terminal) image_index = 0;
        }
    }
}