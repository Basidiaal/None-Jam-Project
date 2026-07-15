if (room == rm_main_menu) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    draw_set_font(Fnt_puzzle_portas)
    
    // 1. Identifica qual lista de opções usar
    var options = options_main;
    if (menu_state == "settings") options = options_settings;
    if (menu_state == "credits") options = ["VOLTAR"];

    draw_set_valign(fa_middle);

    // --- DESIGN MODERNO DA TELA DE CRÉDITOS ---
    if (menu_state == "credits") {
        var card_x1 = gui_w * 0.38;
        var card_y1 = gui_h * 0.12;
        var card_x2 = gui_w * 0.92;
        var card_y2 = gui_h * 0.88;
        
        // 1. Fundo do Card (Vidro Escuro com Transparência)
        draw_set_alpha(0.85);
        draw_set_color(c_black);
        draw_roundrect_ext(card_x1, card_y1, card_x2, card_y2, 20, 20, false);
        
        // 2. Borda do Card (Branca Sutil)
        draw_set_alpha(0.2);
        draw_set_color(c_white);
        draw_roundrect_ext(card_x1, card_y1, card_x2, card_y2, 20, 20, true);
        
        // Borda Extra de Brilho
        draw_set_alpha(0.05);
        draw_roundrect_ext(card_x1 - 2, card_y1 - 2, card_x2 + 2, card_y2 + 2, 24, 24, true);
        draw_set_alpha(1.0);
        
        // 3. Textos e Conteúdo
        // Título Principal
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
        var title_y = card_y1 + 40;
        draw_text_transformed(card_x1 + (card_x2 - card_x1)/2, title_y, texto_creditos[lang_index], 1.3, 1.3, 0);
        
        // Agradecimento Especial (Cor Verde Neon)
        draw_set_color(make_color_rgb(0, 255, 180));
        var thank_y = title_y + 60;
        draw_text(card_x1 + (card_x2 - card_x1)/2, thank_y, texto_agradecimento[lang_index]);
        
        // Linha Divisória
        draw_set_color(c_white);
        draw_set_alpha(0.15);
        var line_y = thank_y + 50;
        draw_line_width(card_x1 + 40, line_y, card_x2 - 40, line_y, 2);
        draw_set_alpha(1.0);
        
        // Colunas
        var col_y = line_y + 40;
        var col_w = (card_x2 - card_x1 - 120) / 2;
        
        // Coluna 1: Desenvolvimento
        var col1_x = card_x1 + 50;
        draw_set_halign(fa_left);
        draw_set_color(make_color_rgb(180, 180, 180));
        draw_text(col1_x, col_y, texto_desenvolvimento[lang_index]);
        
        draw_set_color(c_white);
        draw_text_ext(col1_x, col_y + 60, texto_equipe[lang_index], -1, col_w);
        
        // Coluna 2: Redes Sociais
        var col2_x = card_x1 + 70 + col_w;
        draw_set_halign(fa_left);
        draw_set_color(make_color_rgb(180, 180, 180));
        draw_text(col2_x, col_y, texto_redes[lang_index]);
        
        draw_set_color(c_white);
        draw_text_ext(col2_x, col_y + 60, texto_siga[lang_index], -1, col_w - 20);
        
        // Restaurar alinhamentos padrão para o loop de opções
        draw_set_valign(fa_middle);
        draw_set_halign(fa_left);
    }

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
                draw_set_color(c_white);
                draw_rectangle(bar_x, yy - 8, bar_x + bar_w, yy + 8, false);

                // 2. Preenchimento da barra (Vermelho se selecionado, Cinza se não)
                var cor_preenchimento = (i == index) ? c_black : c_gray;
                draw_set_color(cor_preenchimento);
                draw_rectangle(bar_x, yy - 8, bar_x + (bar_w * vol), yy + 8, false);
                
                // 3. Porcentagem na frente da barra
                // Mantemos branco para combinar com o tema, mas você pode mudar para cor_preenchimento se preferir
                draw_set_color(c_white); 
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