if (keyboard_check_pressed(ord("E")) && place_meeting(x, y, Obj_player)) {
    var _gerente = Obj_gerenciador;
    
    if (!_gerente.exibindo_sequencia && !_gerente.exibindo_intro && _gerente.feedback_p1_tipo == 0) {
        
        // =======================================================
        // AVISAMOS O MONITOR QUE O DESAFIO COMEÇOU:
        // (Isso vai desligar a animação inicial dos frames 20-22)
        // =======================================================
        with(Obj_tela) { // Substitua pelo nome real do objeto do seu monitor
            desafio_iniciado = true;
        }
        
        if (!_gerente.intro_mostrada) {
            _gerente.exibindo_intro = true;
            _gerente.timer_intro = 0;
        } else {
            _gerente.exibindo_sequencia = true;
            _gerente.timer_sequencia = 0;
            _gerente.indice_exibicao = 0;
        }
    }
}