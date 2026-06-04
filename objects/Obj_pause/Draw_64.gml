if (global.pause) {
    // Fundo escuro
	draw_set_font(Fnt_puzzle_portas)
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

var current_indices = (menu_state == "main") ? main_indices : settings_indices;
    var options = [];
    for (var i = 0; i < array_length(current_indices); i++) {
        options[i] = options_traducoes[current_indices[i]][Obj_main_menu.lang_index];
    }

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    
    for (var i = 0; i < array_length(options); i++) {
        var color = (i == index) ? c_red : c_white;
        var yy = (gui_h / 2 - 100) + (i * 60);
        
        draw_set_halign(fa_right);
        draw_text_color(gui_w / 2 - 20, yy, options[i], color, color, color, color, 1);
        
        draw_set_halign(fa_left);
        if (menu_state == "settings") {
            var val_x = gui_w / 2 + 20;
            
            if (i == 0) { // Resolução
                var r = global.resolutions[global.res_index];
                draw_text_color(val_x, yy, "< " + string(r[0]) + "x" + string(r[1]) + " >", color, color, color, color, 1);
            }
            
            if (i == 1) { // Tela Cheia (TRADUZIDO)
                var status = global.fullscreen ? txt_sim[Obj_main_menu.lang_index] : txt_nao[Obj_main_menu.lang_index];
                draw_text_color(val_x, yy, "< " + status + " >", color, color, color, color, 1);
            }

   

           if (i >= 2 && i <= 4) { // Barrinhas de Áudio
    var vol = (i == 2) ? global.vol_master : (i == 3 ? global.vol_music : global.vol_sfx);
    var bar_w = 200;
    var bar_h = 15;
    
    // --- AJUSTE DE ALINHAMENTO DA BARRA ---
    // Se quiser SUBIR a barra: aumente o número (ex: yy - 10)
    // Se quiser DESCER a barra: diminua o número (ex: yy - 2)
    var offset_barra =  -8; // Mude esse valor para alinhar perfeitamente
    
    // Fundo da barra
    draw_set_color(c_dkgray);
    draw_rectangle(val_x, yy - offset_barra, val_x + bar_w, yy + bar_h - offset_barra, false);
    
    // Preenchimento da barra
    draw_set_color(color);
    draw_rectangle(val_x, yy - offset_barra, val_x + (bar_w * vol), yy + bar_h - offset_barra, false);
    
    // --- PORCENTAGEM ---
    draw_set_color(c_white);
    // Aqui usamos a altura_ajustada que você já tem para alinhar o texto
    var altura_ajustada = yy ; 
    draw_text(val_x + bar_w + 15, altura_ajustada, string(floor(vol * 100)) + "%");
}
    }
}
}