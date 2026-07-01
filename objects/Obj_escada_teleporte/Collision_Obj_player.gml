if (keyboard_check_pressed(ord("E"))) { 
    // Se a escada estiver trancada, o código para aqui
    if (esta_trancada) exit;
    
    // Evita criar mais de uma transição ao mesmo tempo se o jogador apertar repetido
    if (!instance_exists(Obj_Transicao_Escada)) {
        if (instance_exists(Obj_player)) {
            
            // Cria a transição
            var transicao = instance_create_depth(0, 0, -9999, Obj_Transicao_Escada);
            
            // Passa os dados da escada para a transição resolver
            transicao.alvo_x = destino_x_escada;
            transicao.alvo_y = destino_y_escada;
            transicao.alvo_lado = destino_lado;
            
        }
    }
}