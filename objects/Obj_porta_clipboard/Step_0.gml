if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = minha_velocidade; // Retoma a velocidade correta de cada objeto
}
// 1. Verifica se o jogador está perto e apertou E
if (!executando_fade && place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    
    if (global.pause) exit;

    if (clipboard_has_text()) {
        var _texto_copiado = clipboard_get_text();
        
        if (_texto_copiado == frase_correta) {
            // SUCESSO
            if (!aberta) {
                aberta = true;
                show_message(Obj_main_menu.texto_palavra_chave_certa[Obj_main_menu.lang_index]);
            }
            
            // Ativa o início da transição
            executando_fade = true; 
            
        } else {
            show_message( Obj_main_menu.texto_advertencia[Obj_main_menu.lang_index] + _texto_copiado + Obj_main_menu.texto_nao_e_a_chave[Obj_main_menu.lang_index]);
        }
    } else {
        show_message(Obj_main_menu.texto_palavra_chave_errada[Obj_main_menu.lang_index]);
    }
}

// 2. PROCESSO DE TRANSICÃO (FADE)
if (executando_fade) {
    persistent = true; // Necessário para atravessar rooms

    if (!mudei) {
        // Estágio 1: Escurecendo a tela
        alpha += 0.02; 
        if (alpha >= 1) {
            alpha = 1;
            mudei = true;
            
            // Uso das variáveis que você já tem no Variable Definitions
            room_goto(sala_destino);
            
            if (instance_exists(Obj_player)) {
                Obj_player.x = destino_x;
                Obj_player.y = destino_y;
            }
        }
    } else {
        // Estágio 2: Clareando a tela na sala nova
        alpha -= 0.02; 
        if (alpha <= 0) {
            instance_destroy(); // Remove o objeto após o serviço completo
        }
    }
}