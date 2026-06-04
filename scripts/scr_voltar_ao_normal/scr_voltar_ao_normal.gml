function scr_voltar_ao_normal() {
    // Desativar a divisão de tela
    view_visible[1] = false;
    
    // Fazer a View 0 ocupar a tela toda
    view_set_wport(0, window_get_width());
    view_set_hport(0, window_get_height());
    view_set_xport(0, 0);
    
    // Ajustar o tamanho da câmera do P1 para o padrão (ex: 1280x720 ou 640x360)
    camera_set_view_size(view_camera[0], 640, 360); 


// 1. Localiza a câmera que estava seguindo o Player 2 antes de deletá-lo
    with(Obj_Camera) {
        if (target == Obj_player_2) {
            instance_destroy(); // Deleta a câmera extra
        }
    }

    // 2. Agora sim, deleta o Player 2 com segurança
    if (instance_exists(Obj_player_2)) {
        instance_destroy(Obj_player_2);
    }
}