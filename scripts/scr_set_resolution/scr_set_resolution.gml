function scr_set_resolution(_w, _h) {
    // 1. Muda o tamanho da janela
    window_set_size(_w, _h);
    
    // 2. Redimensiona o desenho interno do jogo (canvas)
    surface_resize(application_surface, _w, _h);
    
    // 3. Ajusta a interface (GUI) para que o texto do terminal não fique minúsculo
    display_set_gui_size(_w, _h);
    
    // 4. Centraliza a janela (importante para modo janela)
    // O ideal é chamar window_center() num alarme com delay de 1 ou 2 frames
    
    global.res_atual_w = _w;
}