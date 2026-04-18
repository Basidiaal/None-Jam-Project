if (aberto) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _cx = _gui_w / 2;
    var _cy = _gui_h / 2;

    // 1. Fundo escurecido (Imersão total)
    draw_set_alpha(0.9);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    draw_set_alpha(1);

    // --- CAMADA DE TRÁS: OS ROLOS ---
    // Desenhamos os ícones antes da moldura para que a moldura esconda as bordas deles
    for (var i = 0; i < 3; i++) {
        var _rx = _cx - 105 + (i * 118); 
        // Desenhamos os ícones (ajustei a escala para 3 para parecerem maiores na tela)
        draw_sprite_ext(Spr_icones, rolos_pos[i], _rx, _cy - 65, 1, 1, 0, c_white, 1);
    }

    // --- CAMADA DA FRENTE: A MÁQUINA ---
    // Substituímos o retângulo cinza pelo seu sprite de primeira pessoa
    // Se o seu sprite for pequeno, aumentamos a escala (ex: 4, 4) para cobrir a tela
    draw_sprite_ext(Spr_maquina_frame, 0, _cx, _cy, 2.3, 2.3, 0, c_white, 1);

    // --- CAMADA DE TEXTO (INTERFACE DO TERMINAL) ---
    draw_set_halign(fa_center);
    draw_set_font(-1); // Use sua fonte de terminal se tiver

    // 4. Feedback de Velocidade (Estilo Monitor CRT)
    if (coluna_ativa > 0) {
        var _premio_alvo = [5, 10, 15, 20, 25, 30];
        var _valor = _premio_alvo[floor(rolos_pos[0])];
        
        // Texto piscando em amarelo no topo da máquina
        draw_set_color(c_yellow);
        draw_text(_cx, _cy - 160, "TARGET: " + string(_valor) + " FPS");
        
        if (_valor >= 20) {
            // Alerta de sobrecarga
            draw_set_color(c_red);
            var _piscando = (current_time % 500 < 250); // Efeito de piscar
            if (_piscando) draw_text(_cx, _cy - 140, "!!! OVERCLOCK CRITICAL !!!");
        }
    }

    // 5. Instruções Dinâmicas (Embaixo dos rolos)
    draw_set_color(c_white);

    if (estado == "idling" && !ganhou_nesta_sessao) {
        draw_text(_cx, _cy + 100, "[E] ENGAGE SEQUENCER");
    } 
    else if (estado == "resultado") {
        if (ganhou_nesta_sessao) {
            draw_set_color(c_lime);
            draw_text(_cx, _cy + 100, "SYNC COMPLETE");
        } else {
            draw_set_color(c_red);
            draw_text(_cx, _cy + 100, "SYNC FAILED");
        }
    }
    
    // Texto de ajuda pequeno no canto
    draw_set_alpha(0.5);
    draw_text(_cx, _cy + 160, "[ESC] TO ABORT");
    draw_set_alpha(1);
}