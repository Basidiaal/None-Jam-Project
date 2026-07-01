if (target == noone) exit;

if (instance_exists(target)) {
    
    // =========================================================================
    // CONFIGURAÇÃO DINÂMICA POR SALA (Altura e Folga do Chão)
    // =========================================================================
    var offset_y = -120;             // Altura padrão (câmera mais para cima)
    var folga_abaixo_do_chao = 0;    // Por padrão, nenhuma sala mostra o vazio do fundo

    switch (room) {
        case Sala_1: 
            // Substitua pelo nome exato da sua Room que quer a câmera baixa
            offset_y = -135;              // Traz a câmera mais para baixo
            folga_abaixo_do_chao = 150;  // Permite que ela passe 150 pixels além do fim da room
            break;
            
       // case Outra_Sala_Se_Quiser:
          //  offset_y = 0;
           // folga_abaixo_do_chao = 100;  // Outra configuração para uma sala diferente
           // break;
    }
    // =========================================================================
    
    // 1. Se foi ativado o teleporte, pula direto com o ajuste de altura
    if (teleportar_camera) {
        x = target.x;
        y = target.y + offset_y; 
        teleportar_camera = false; 
    } else {
        // Segue suave mantendo o ajuste de altura
        x = lerp(x, target.x, .1);
        y = lerp(y, target.y + offset_y, .1);
    }
    
    // =========================================================================
    // 2. SISTEMA DE TRAVA DE BORDAS (Aplicando a folga dinâmica)
    // =========================================================================
    var cam_largura = camera_get_view_width(view_camera[0]);
    var cam_altura = camera_get_view_height(view_camera[0]);
    
    var limite_x_min = cam_largura / 2;
    var limite_x_max = room_width - (cam_largura / 2);
    var limite_y_min = cam_altura / 2;
    
    // Aqui somamos a folga que foi definida lá no switch(room)
    var limite_y_max = (room_height + folga_abaixo_do_chao) - (cam_altura / 2);
    
    x = clamp(x, limite_x_min, limite_x_max);
    y = clamp(y, limite_y_min, limite_y_max);
    
    // 3. Atualiza a Viewport do jogo
    camera_set_view_pos(view_camera[0], x - (cam_largura / 2), y - (cam_altura / 2));
}