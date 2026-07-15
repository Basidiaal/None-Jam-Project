if (room == rm_main_menu) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    draw_set_font(Fnt_puzzle_portas)
    
    // 1. Identifica qual lista de opções usar
    var options = options_main;
    if (menu_state == "settings") options = options_settings;
    if (menu_state == "credits") options = [];

    draw_set_valign(fa_middle);

    // --- DESIGN MODERNO DA TELA DE CRÉDITOS (SCROLLING CREDITS) ---
    if (menu_state == "credits") {
        // 1. Cobertura Preta em Tela Cheia (100% opaca)
        draw_set_alpha(1.0);
        draw_set_color(c_black);
        draw_rectangle(0, 0, gui_w, gui_h, false);
        
        // 2. Desenhar os créditos a partir de credits_scroll_y
        var current_y = credits_scroll_y;
        var list = credits_list[lang_index];
        
        for (var j = 0; j < array_length(list); j++) {
            var item = list[j];
            
            // Só desenha se estiver visível na tela (otimização)
            if (current_y > -200 && current_y < gui_h + 200) {
                if (item.type == "logo") {
                    draw_set_font(Fnt_puzzle_portas);
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_top);
                    draw_set_color(c_white);
                    // Desenha o logo "ESC_" limpo usando a própria fonte do jogo
                    draw_text_transformed(gui_w / 2, current_y, "ESC_", 3.0, 3.0, 0);
                }
                else if (item.type == "header") {
                    draw_set_font(Fnt_puzzle_portas);
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_top);
                    draw_set_color(make_color_rgb(0, 255, 180)); // Verde Neon / Ciano para Título da Seção
                    draw_text_transformed(gui_w / 2, current_y, item.text, 1.2, 1.2, 0);
                }
                else if (item.type == "role") {
                    draw_set_font(Fnt_puzzle_portas);
                    draw_set_valign(fa_top);
                    
                    // Nome do profissional (Negrito/Branco, à esquerda do centro)
                    draw_set_halign(fa_right);
                    draw_set_color(c_white);
                    draw_text(gui_w / 2 - 15, current_y, item.name);
                    
                    // Cargo/Função (Cinza, à direita do centro)
                    draw_set_halign(fa_left);
                    draw_set_color(make_color_rgb(160, 160, 160));
                    draw_text(gui_w / 2 + 15, current_y, item.title);
                }
                else if (item.type == "thanks") {
                    draw_set_font(Fnt_puzzle_portas);
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_top);
                    draw_set_color(c_white);
                    draw_text(gui_w / 2, current_y, item.text);
                }
            }
            
            // Incrementa o Y para o próximo item
            if (item.type == "logo") current_y += 130;
            else if (item.type == "header") current_y += 55;
            else if (item.type == "role") current_y += 42;
            else if (item.type == "space") current_y += item.val;
            else if (item.type == "thanks") current_y += 50;
        }
        
        // Dica de saída por ESC estacionária no canto superior direito
        draw_set_font(Fnt_puzzle_portas);
        draw_set_halign(fa_right);
        draw_set_valign(fa_top);
        draw_set_color(make_color_rgb(100, 100, 100)); // cinza discreto
        var esc_txt = "[ESC] Voltar";
        if (lang_index == 1) esc_txt = "[ESC] Back";
        else if (lang_index == 2) esc_txt = "[ESC] Volver";
        draw_text(gui_w - 45, 35, esc_txt);
        
        // Restaurar alinhamentos padrão para o loop de opções
        draw_set_valign(fa_middle);
        draw_set_halign(fa_left);
    }

    // --- DESIGN MODERNO DA TELA DE CONFIGURAÇÕES ---
    if (menu_state == "settings") {
        var set_x1 = gui_w * 0.22;
        var set_y1 = gui_h * 0.12;
        var set_x2 = gui_w * 0.78;
        var set_y2 = gui_h * 0.88;
        
        // 1. Fundo do Card (Vidro Escuro com Transparência)
        draw_set_alpha(0.85);
        draw_set_color(c_black);
        draw_roundrect_ext(set_x1, set_y1, set_x2, set_y2, 20, 20, false);
        
        // 2. Borda do Card (Branca Sutil)
        draw_set_alpha(0.2);
        draw_set_color(c_white);
        draw_roundrect_ext(set_x1, set_y1, set_x2, set_y2, 20, 20, true);
        
        // Borda Extra de Brilho
        draw_set_alpha(0.05);
        draw_roundrect_ext(set_x1 - 2, set_y1 - 2, set_x2 + 2, set_y2 + 2, 24, 24, true);
        draw_set_alpha(1.0);
        
        // 3. Título das Configurações
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
        draw_text_transformed(gui_w / 2, set_y1 + 35, texto_config[lang_index], 1.3, 1.3, 0);
        
        // Linha Divisória
        draw_set_color(c_white);
        draw_set_alpha(0.15);
        draw_line_width(set_x1 + 40, set_y1 + 90, set_x2 - 40, set_y1 + 90, 2);
        draw_set_alpha(1.0);
        
        // Restaurar alinhamento para o loop
        draw_set_valign(fa_middle);
        draw_set_halign(fa_left);
    }

    // 2. Loop de Desenho das Opções
    for (var i = 0; i < array_length(options); i++) {
        var yy = 350 + (i * 60); 
        var xx = 100;            // Alinhado à esquerda
        
        if (menu_state == "settings") {
            var set_x1 = gui_w * 0.22;
            var set_y1 = gui_h * 0.12;
            xx = set_x1 + 80;
            yy = set_y1 + 140 + (i * 65);
        }
        
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
            if (i == 0) txt += ":  < " + string(global.resolutions[global.res_index][0]) + "x" + string(global.resolutions[global.res_index][1]) + " >";
            
            if (i == 1) {
                var _sim = ["SIM", "YES", "SI"];
                var _nao = ["NÃO", "NO", "NO"];
                txt += ":  < " + (global.fullscreen ? _sim[lang_index] : _nao[lang_index]) + " >";
            }

            // --- DESENHO DAS BARRINHAS COM MUDANÇA DE COR AO SELECIONAR ---
            if (i >= 2 && i <= 4) {
                var vol = (i == 2) ? global.vol_master : (i == 3 ? global.vol_music : global.vol_sfx);
                
                var bar_w = 200;
                var bar_x = (gui_w * 0.78) - bar_w - 110; 

                // 1. Fundo da barra (Escuro)
                draw_set_color(make_color_rgb(60, 60, 60));
                draw_rectangle(bar_x, yy - 8, bar_x + bar_w, yy + 8, false);

                // 2. Preenchimento da barra (Branco se selecionado, Cinza Claro se não)
                var cor_preenchimento = (i == index) ? c_white : c_gray;
                draw_set_color(cor_preenchimento);
                draw_rectangle(bar_x, yy - 8, bar_x + (bar_w * vol), yy + 8, false);
                
                // 3. Porcentagem
                draw_set_color(c_white); 
                draw_set_halign(fa_left);
                draw_text(bar_x + bar_w + 20, yy, string(floor(vol * 100)) + "%");
            }
        }

        // --- SISTEMA DE SELEÇÃO E DESTAQUE ---
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

    // 3. DESENHO DOS ÍCONES DE REDES SOCIAIS (Instagram, X, TikTok)
    var start_x = gui_w - 60 - (array_length(social_networks) - 1) * 65;
    var social_y = gui_h - 60;
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    var hovered_name = "";
    
    for (var s = 0; s < array_length(social_networks); s++) {
        var net = social_networks[s];
        var icon_x = start_x + (s * 65);
        var icon_scale = 1.0;
        
        if (point_in_circle(mx, my, icon_x, social_y, 25)) {
            icon_scale = 1.2;
            hovered_name = net.name;
        }
        
        draw_sprite_ext(net.sprite, 0, icon_x, social_y, icon_scale, icon_scale, 0, c_white, 1);
    }
    
    // Desenha o texto de hover à esquerda dos ícones se houver um selecionado
    if (hovered_name != "") {
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        draw_set_valign(fa_middle);
        draw_set_font(Fnt_puzzle_portas);
        draw_text(start_x - 30, social_y, hovered_name);
    }
}