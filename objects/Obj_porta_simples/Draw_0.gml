draw_self();
    // 2. Só avança se o player estiver encostando nele
    if (place_meeting(x, y, Obj_player)) {
        
     
            
            // 3. Desenha o texto perfeitamente
            draw_set_halign(fa_center);
            draw_text(x , y - 150,  "[E]");
        
    }
