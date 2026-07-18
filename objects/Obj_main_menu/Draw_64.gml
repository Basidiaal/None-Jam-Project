if (room == rm_main_menu) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    draw_set_font(Fnt_puzzle_portas)
    
    // 1. Identifica qual lista de opções usar
    var options = options_main;
    if (menu_state == "settings") options = options_settings;
    if (menu_state == "credits") options = ["VOLTAR"];

    draw_set_valign(fa_middle);

    // 2. Loop de Desenho das Opções
    for (var i = 0; i < array_length(options); i++) {
        var yy = 350 + (i * 60); 
        var xx = 100;            // Alinhado à esquerda
        var txt = options[i];

        // Lógica para a linha de IDIOMA
        if (menu_state == "main" && i == 1) {
            var _lang_display = "";
            switch(lang_index) {
                case 0: _lang_display = "Português >"; break;
                case 1: _lang_display = "< English >"; break;
                case 2: _lang_display = "< Español"; break;
            }
            txt = options[i] + ": " + _lang_display;
        }

        if (menu_state == "settings") {
            if (i == 0) txt += ": " + string(global.resolutions[global.res_index][0]) + "x" + string(global.resolutions[global.res_index][1]);
            
            if (i == 1) {
                var _sim = ["SIM", "YES", "SI"];
                var _nao = ["NÃO", "NO", "NO"];
                txt += ": < " + (global.fullscreen ? _sim[lang_index] : _nao[lang_index]) + " >";
            }

            // --- DESENHO DAS BARRINHAS COM MUDANÇA DE COR AO SELECIONAR ---
            if (i >= 2 && i <= 4) {
                var vol = (i == 2) ? global.vol_master : (i == 3 ? global.vol_music : global.vol_sfx);
                
                var bar_w = 200;
                var bar_h = 16;
                var bar_x = xx + 380; 

                // 1. Fundo da barra (Sempre Branco)
                draw_set_color(c_gray);
                draw_rectangle(bar_x, yy - 8, bar_x + bar_w, yy + 8, false);

                // 2. Preenchimento da barra (Vermelho se selecionado, Cinza se não)
                var cor_preenchimento = (i == index) ? c_black : c_gray;
                draw_set_color(cor_preenchimento);
                draw_rectangle(bar_x, yy - 8, bar_x + (bar_w * vol), yy + 8, false);
                
                // 3. Porcentagem na frente da barra
                // Mantemos branco para combinar com o tema, mas você pode mudar para cor_preenchimento se preferir
                draw_set_color(c_gray); 
                draw_set_halign(fa_left);
                draw_text(bar_x + bar_w + 15, yy, string(floor(vol * 100)) + "%");
            }
        }

        // --- SISTEMA DE SELEÇÃO E DESTAQUE (Mantido Original) ---
        if (i == index) {
            var padding = 10;
            var txt_w = string_width(">" + txt) + (padding * 2);
            var txt_h = string_height(txt) + 5;
            
            draw_set_color(c_white);
            draw_rectangle(xx - padding, yy - (txt_h/2), xx + txt_w - padding, yy + (txt_h/2), false);
            
            draw_set_halign(fa_left);
            draw_set_color(c_black);
            draw_text(xx, yy, "> " + txt);
        } 
        else {
            draw_set_halign(fa_left);
            draw_set_color(c_gray);
            draw_text(xx, yy, txt);
        }
    }

    // 3. DESENHO DO ÍCONE DE REDE SOCIAL
    var social_x = gui_w - 80;
    var social_y = gui_h - 80;
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var social_scale = 1;

    if (point_in_circle(mx, my, social_x, social_y, 32)) {
        social_scale = 1.2;
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        draw_text(social_x - 40, social_y, "Siga-nos!");
    }

    draw_sprite_ext(social_sprite, 0, social_x, social_y, social_scale, social_scale, 0, c_white, 1);
}