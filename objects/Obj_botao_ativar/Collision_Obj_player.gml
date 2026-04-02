
// Se o jogador interagir com o botão de ativação:
if (keyboard_check_pressed(ord("E")) && place_meeting(x, y, Obj_player)) {
    if (!Obj_gerenciador.exibindo_sequencia) {
        Obj_gerenciador.exibindo_sequencia = true;
        Obj_gerenciador.timer_sequencia = 0;
        Obj_gerenciador.indice_exibicao = 0;
        
        
    }
}