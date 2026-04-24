timer++;

// EXATAMENTE NO MEIO DA TRANSIÇÃO (Frame 20), a gente divide as câmeras
if (timer == 20) {
	if(tipo == "ativar"){
    view_enabled = true;
    
    // Configura View 0 (P1)
    view_visible[0] = true;
    view_set_wport(0, window_get_width() / 2);
    view_set_hport(0, window_get_height());
    view_set_xport(0, 0);

    // Configura View 1 (P2)
    view_visible[1] = true;
    view_set_wport(1, window_get_width() / 2);
    view_set_hport(1, window_get_height());
    view_set_xport(1, window_get_width() / 2);
    
    // Aplica as câmeras nos objetos (P1 e P2)
    var cam1 = camera_create_view(0, 0, 640, 720, 0, Obj_player, -1, -1, 320, 360);
    var cam2 = camera_create_view(0, 0, 640, 720, 0, Obj_player_2, -1, -1, 320, 360);
    view_set_camera(0, cam1);
    view_set_camera(1, cam2);
}
else if (tipo == "desativar") {
        // --- NOVO CÓDIGO (VOLTAR AO NORMAL) ---
        view_visible[1] = false;
        
        // Reset da View 0 para tela cheia
        view_set_wport(0, window_get_width());
        view_set_hport(0, window_get_height());
        view_set_xport(0, 0);
        
        // Ajusta a câmera do P1 para o tamanho original
        camera_set_view_size(view_camera[0], 640, 360); 
        
        // Limpeza (Deletar P2 e Câmeras extras)
        with(Obj_Camera) {
            if (target == Obj_player_2 || target == noone) instance_destroy();
        }
        if (instance_exists(Obj_player_2)) instance_destroy(Obj_player_2);
    }
}
// Se o tempo acabou, o efeito some
if (timer >= duracao) {
    instance_destroy();
}