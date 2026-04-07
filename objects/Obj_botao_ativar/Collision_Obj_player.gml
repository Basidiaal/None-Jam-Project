if (keyboard_check_pressed(ord("E")) && place_meeting(x, y, Obj_player)) {
    var _gerente = Obj_gerenciador;
    
    // Só funciona se não estiver passando nada na tela
    if (!_gerente.exibindo_sequencia && !_gerente.exibindo_intro && _gerente.feedback_p1_tipo == 0) {
        
        if (!_gerente.intro_mostrada) {
            // Primeira vez: Mostra "Fase X"
            _gerente.exibindo_intro = true;
            _gerente.timer_intro = 0;
        } else {
            // Tentativa seguinte: Mostra as cores direto
            _gerente.exibindo_sequencia = true;
            _gerente.timer_sequencia = 0;
            _gerente.indice_exibicao = 0;
        }
    }
}