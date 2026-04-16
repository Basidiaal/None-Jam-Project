// 1. SAÍDA SEGURA (ESC)
if (keyboard_check_pressed(vk_escape)) {
    // 1. Limpa o estado do teclado para que outros objetos 
    // pensem que nada foi pressionado neste frame.
    io_clear(); 

    instance_destroy();
    exit; // Impede que o código abaixo rode no frame de destruição
}

// 2. LÓGICA DE APOSTAS (Sempre ouve se o estado for apostando)
if (estado == "apostando") {
	
    var fps_disp = game_get_speed(gamespeed_fps);
    if (keyboard_check_pressed(ord("1"))) {
        if (fps_disp - 5 >= global.fps_minimo) { aposta_fps = 5; iniciar_partida(); }
        else mensagem = "FPS insuficiente!";
    }
    if (keyboard_check_pressed(ord("2"))) {
        if (fps_disp - 10 >= global.fps_minimo) { aposta_fps = 10; iniciar_partida(); }
        else mensagem = "FPS insuficiente!";
    }
}

// 3. TRAVA DE SEGURANÇA PARA ANIMAÇÕES
// Se as listas não existem (momento da destruição), para o código aqui
if (!ds_exists(mao_player, ds_type_list) || !ds_exists(mao_dealer, ds_type_list)) exit;

// --- LÓGICA DE ANIMAÇÃO (LERP) ---
var listas = [mao_player, mao_dealer];
for (var j=0; j<2; j++) {
    var _lista = listas[j];
    for (var i=0; i<ds_list_size(_lista); i++) {
        var _c = _lista[| i];
        if (is_struct(_c)) {
            _c.curr_x = lerp(_c.curr_x, _c.target_x, 0.15);
            _c.curr_y = lerp(_c.curr_y, _c.target_y, 0.15);
            _c.alpha = lerp(_c.alpha, 1, 0.1);
        }
    }
}

// 4. CONTINUIDADE DOS ESTADOS (Player Vez, Dealer Vez)
if (estado == "player_vez") {
    if (keyboard_check_pressed(ord("H"))) {
        var nx = pos_player_x + (ds_list_size(mao_player) * (espacamento_cartas/2));
        ds_list_add(mao_player, tirar_carta(nx, pos_player_y));
        if (somar_mao(mao_player) > 21) finalizar_partida(false);
    }
    if (keyboard_check_pressed(ord("S"))) {
        estado = "dealer_vez";
        timer_dealer = atraso_dealer;
    }
}

if (estado == "dealer_vez") {
    if (timer_dealer > 0) timer_dealer--;
    else {
        var sd = somar_mao(mao_dealer);
        var sp = somar_mao(mao_player);
        if (sd < 17) {
            var nx = pos_dealer_x + (ds_list_size(mao_dealer) * (espacamento_cartas/2));
            ds_list_add(mao_dealer, tirar_carta(nx, pos_dealer_y));
            timer_dealer = atraso_dealer;
            if (somar_mao(mao_dealer) > 21) finalizar_partida(true);
        } else {
            if (sp > sd) finalizar_partida(true);
            else if (sp < sd) finalizar_partida(false);
            else { mensagem = "Empate!"; estado = "resultado"; }
        }
    }
}

// 5. ESPAÇO PARA CONTINUAR OU FINALIZAR
if (estado == "resultado") {
    if (keyboard_check_pressed(vk_space)) {
        if (global.fichas_atuais >= global.fichas_objetivo) {
            instance_destroy();
            exit;
        }

        // Animação de saída das cartas
        for(var i=0; i<ds_list_size(mao_player); i++) {
            var _c = mao_player[| i];
            if (is_struct(_c)) _c.target_x = -200; 
        }
        for(var i=0; i<ds_list_size(mao_dealer); i++) {
            var _c = mao_dealer[| i];
            if (is_struct(_c)) _c.target_x = largura_gui + 200;
        }
        
        estado = "apostando";
        mensagem = "Quanto FPS deseja apostar?";
    }
}