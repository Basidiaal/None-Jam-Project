// 1. Bloqueio para o Menu Principal
if (room == rm_main_menu) { 
    global.pause = false;
    exit; 
}

// 2. Tecla para alternar Pause (ESC)
if (keyboard_check_pressed(vk_escape)) {
    global.pause = !global.pause;
    
    if (global.pause) audio_pause_all();
    else audio_resume_all();
    
    menu_state = "main";
    index = 0;
}

// 3. Lógica interna do Pause
if (global.pause) {
    // --- SISTEMA DE TRADUÇÃO DINÂMICA ---
    // Identifica quais índices usar baseado no estado do menu
    var current_indices = (menu_state == "main") ? main_indices : settings_indices;
    var options = [];

    // Monta a lista de palavras traduzidas em tempo real
    for (var i = 0; i < array_length(current_indices); i++) {
        var row = current_indices[i];
        // Nota: Certifique-se de que global.lang_index existe ou use Obj_main_menu.lang_index
        options[i] = options_traducoes[row][Obj_main_menu.lang_index]; 
    }

    // --- NAVEGAÇÃO VERTICAL ---
    var move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
    index += move;

    if (index < 0) index = array_length(options) - 1;
    if (index >= array_length(options)) index = 0;

    // --- LÓGICA LATERAL (Ajustes de Configurações) ---
    if (menu_state == "settings") {
        var side_press = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
        var side_hold = (keyboard_check(vk_right) - keyboard_check(vk_left)) * 0.01;

        switch(index) {
            case 0: // RESOLUÇÃO
                if (side_press != 0) {
                    global.res_index += side_press;
                    if (global.res_index < 0) global.res_index = array_length(global.resolutions) - 1;
                    if (global.res_index >= array_length(global.resolutions)) global.res_index = 0;
                    
                    var r = global.resolutions[global.res_index];
                    window_set_size(r[0], r[1]);
                    surface_resize(application_surface, r[0], r[1]);
                    alarm[0] = 1; 
                }
                break;

            case 1: // TELA CHEIA
                if (side_press != 0) {
                    global.fullscreen = !global.fullscreen;
                    window_set_fullscreen(global.fullscreen);
                }
                break;

            case 2: // VOLUME GERAL
                if (side_hold != 0) {
                    global.vol_master = clamp(global.vol_master + side_hold, 0, 1);
                    audio_master_gain(global.vol_master);
                }
                break;

            case 3: // MÚSICA
                if (side_hold != 0) {
                    global.vol_music = clamp(global.vol_music + side_hold, 0, 1);
                    audio_group_set_gain(audiogroup_music, global.vol_music, 0);
                }
                break;

            case 4: // EFEITOS
                if (side_hold != 0) {
                    global.vol_sfx = clamp(global.vol_sfx + side_hold, 0, 1);
                    audio_group_set_gain(audiogroup_sound_effects, global.vol_sfx, 0);
                }
                break;
        }
    }

    // --- SELEÇÃO (ENTER) ---
    if (keyboard_check_pressed(vk_enter)) {
        if (menu_state == "main") {
            switch(index) {
                case 0: global.pause = false; audio_resume_all(); break;
                case 1: menu_state = "settings"; index = 0; break;
                case 2: game_end(); break;
            }
        } else {
            // No menu de settings, index 5 é o "Voltar" (baseado no settings_indices)
            if (index == 5) { 
                menu_state = "main";
                index = 1; 
            }
        }
    }
}