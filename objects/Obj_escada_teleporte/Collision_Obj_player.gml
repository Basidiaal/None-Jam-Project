if (keyboard_check_pressed(ord("E"))) { // Ou sua tecla de interação
    if (instance_exists(Obj_player)) {
        
        // 1. Move o Player
        Obj_player.x = destino_x_escada;
        Obj_player.y = destino_y_escada;
        Obj_player.xscale = destino_lado;
        
        // 2. Avisa a câmera para pular instantaneamente junto com ele
        if (instance_exists(Obj_Camera)) {
            Obj_Camera.teleportar_camera = true;
        }
		
        // Opcional: Adicione um som de passos ou efeito visual de transição aqui
    }
}