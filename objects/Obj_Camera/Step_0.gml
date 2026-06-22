if (target == noone) exit;

if (instance_exists(target)) {
    
    // VARIÁVEL DE AJUSTE: Mude esse número para controlar a altura da câmera.
    // Valores positivos (como 32) jogam a câmera mais para BAIXO, mostrando mais o chão.
    var offset_y = -120; 

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
    
    // ==========================================
    // 2. SISTEMA DE TRAVA DE BORDAS
    // ==========================================
    var cam_largura = camera_get_view_width(view_camera[0]);
    var cam_altura = camera_get_view_height(view_camera[0]);
    
    var limite_x_min = cam_largura / 2;
    var limite_x_max = room_width - (cam_largura / 2);
    var limite_y_min = cam_altura / 2;
    var limite_y_max = room_height - (cam_altura / 2);
    
    x = clamp(x, limite_x_min, limite_x_max);
    y = clamp(y, limite_y_min, limite_y_max);
    
    // 3. Atualiza a Viewport do jogo
    camera_set_view_pos(view_camera[0], x - (cam_largura / 2), y - (cam_altura / 2));
}