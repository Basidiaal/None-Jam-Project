if (room != rm_main_menu) exit; // Se não for a sala do menu, ignora o resto do código

// Controle de Créditos Rolantes
if (menu_state == "credits") {
    credits_scroll_y -= 1.5;
    
    // Volta se passar muito da tela
    if (credits_scroll_y < -1200) {
        menu_state = "main";
        index = 3;
    }
    
    // Volta ao pressionar ESC ou botão do mouse
    if (keyboard_check_pressed(vk_escape) || mouse_check_button_pressed(mb_any)) {
        menu_state = "main";
        index = 3;
    }
    exit;
}

// 1. Identificar qual menu estamos olhando
var options = options_main;
if (menu_state == "settings") options = options_settings;
if (menu_state == "credits") options = ["Voltar"];

// 2. Navegação Vertical (Cima/Baixo)
var move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
if (move != 0) {
    index += move;
    if (index < 0) index = array_length(options) - 1;
    if (index >= array_length(options)) index = 0;
}

// 3. Lógica Lateral (Mudar Idioma, Volume, Resolução)
var side_press = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
var side_hold = (keyboard_check(vk_right) - keyboard_check(vk_left)) * 0.01;

if (menu_state == "main" && index == 1) { // Linha do IDIOMA
    if (side_press != 0) {
        lang_index = clamp(lang_index + side_press, 0, array_length(langs) - 1);
     Scr_atualizar_textos()
	}
}

if (menu_state == "settings") {
    switch(index) {
        case 0: // RESOLUÇÃO
            if (side_press != 0) {
                global.res_index = (global.res_index + side_press + array_length(global.resolutions)) % array_length(global.resolutions);
                var r = global.resolutions[global.res_index];
                window_set_size(r[0], r[1]);
                surface_resize(application_surface, r[0], r[1]);
                alarm[0] = 1; // Para centralizar a janela
            }
            break;
        case 1: // TELA CHEIA
            if (side_press != 0) {
                global.fullscreen = !global.fullscreen;
                window_set_fullscreen(global.fullscreen);
            }
            break;
        case 2: global.vol_master = clamp(global.vol_master + side_hold, 0, 1); audio_master_gain(global.vol_master); break;
        case 3: global.vol_music = clamp(global.vol_music + side_hold, 0, 1); audio_group_set_gain(audiogroup_music, global.vol_music, 0); break;
        case 4: global.vol_sfx = clamp(global.vol_sfx + side_hold, 0, 1); audio_group_set_gain(audiogroup_sound_effects, global.vol_sfx, 0); break;
    }
}

// 4. Seleção com Enter
if (keyboard_check_pressed(vk_enter)) {
    if (menu_state == "main") {
        switch(index) {
            case 0: room_goto(Sala_principal); break;
            case 2: menu_state = "settings"; index = 0; break;
            case 3: 
                menu_state = "credits"; 
                index = 0; 
                credits_scroll_y = display_get_gui_height();
                keyboard_clear(vk_enter);
                break;
            case 4: game_end(); break;
        }
    } else if (menu_state == "settings" && index == 5) {
        menu_state = "main"; index = 2; // Volta para Configurações
    } else if (menu_state == "credits") {
        menu_state = "main"; index = 3; // Volta para Créditos
    }
}

// 5. Clique nos Ícones de Redes Sociais
if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var start_x = gui_w - 60 - (array_length(social_networks) - 1) * 65;
    var social_y = gui_h - 60;
    
    for (var s = 0; s < array_length(social_networks); s++) {
        var net = social_networks[s];
        var icon_x = start_x + (s * 65);
        
        if (point_in_circle(mx, my, icon_x, social_y, 25)) {
            url_open(net.url);
            break;
        }
    }
}