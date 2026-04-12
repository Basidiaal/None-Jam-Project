function tirar_carta(_target_x, _target_y) {
    // Se o deck estiver vazio, recria com frames de 0 a 51
    if (ds_list_size(Obj_blackjack_controller.deck) <= 0) {
        for(var i=0; i<52; i++) ds_list_add(Obj_blackjack_controller.deck, i);
        ds_list_shuffle(Obj_blackjack_controller.deck);
    }
    
    var _frame = Obj_blackjack_controller.deck[| 0];
    ds_list_delete(Obj_blackjack_controller.deck, 0);
    
    // Retorna a Struct para a animação
    return {
        frame: _frame,
        curr_x: Obj_blackjack_controller.pos_deck_x,
        curr_y: Obj_blackjack_controller.pos_deck_y,
        target_x: _target_x,
        target_y: _target_y,
        alpha: 0
    };
}

function somar_mao(lista) {
    var total = 0;
    var ases = 0;
    for(var i=0; i<ds_list_size(lista); i++) {
        var _c = lista[| i];
        if (!is_struct(_c)) continue;
        var valor_real = (_c.frame mod 13) + 1;
        if (valor_real > 10) valor_real = 10;
        if (valor_real == 1) { valor_real = 11; ases++; }
        total += valor_real;
    }
    while (total > 21 && ases > 0) { total -= 10; ases--; }
    return total;
}

function somar_mao_visivel(lista, esconder_primeira) {
    var total = 0;
    var ases = 0;
    var inicio = esconder_primeira ? 1 : 0; 
    for(var i = inicio; i < ds_list_size(lista); i++) {
        var _c = lista[| i];
        if (!is_struct(_c)) continue;
        var valor_real = (_c.frame mod 13) + 1;
        if (valor_real > 10) valor_real = 10;
        if (valor_real == 1) { valor_real = 11; ases++; }
        total += valor_real;
    }
    while (total > 21 && ases > 0) { total -= 10; ases--; }
    return total;
}

function atualizar_visual_fichas(valor) {
    var ctrl = Obj_blackjack_controller;
    ds_list_clear(ctrl.fichas_visual_lista);
    
    var _valor_restante = valor;
    
    while (_valor_restante > 0) {
        var _escolha = 1;
        
        // AUMENTAMOS as chances de "quebrar" as fichas
        if (_valor_restante >= 25) {
            var _sorteio = random(1);
            if (_sorteio > 0.6) _escolha = 25;       // 40% de chance de ser uma de 25
            else if (_sorteio > 0.3) _escolha = 10;  // 30% de chance de usar uma de 10 e continuar quebrando o resto
            else _escolha = 5;                       // 30% de chance de usar uma de 5 e continuar quebrando
        } 
        else if (_valor_restante >= 10) {
            var _sorteio = random(1);
            if (_sorteio > 0.5) _escolha = 10;       // 50% de chance de ser uma de 10
            else if (_sorteio > 0.2) _escolha = 5;   // 30% de chance de ser uma de 5
            else _escolha = 1;                       // 20% de chance de começar a mandar moedas de 1
        }
        else if (_valor_restante >= 5) {
            if (random(1) > 0.4) _escolha = 5;       // 60% de chance de ser uma de 5
            else _escolha = 1;                       // 40% de chance de ser cinco moedas de 1
        } else {
            _escolha = 1;
        }
        
        // Proteção para não subtrair mais do que tem
        if (_escolha > _valor_restante) {
            if (_valor_restante >= 10) _escolha = 10;
            else if (_valor_restante >= 5) _escolha = 5;
            else _escolha = 1;
        }
        
        var _frame = 0;
        switch(_escolha) {
            case 25: _frame = 3; break;
            case 10: _frame = 2; break;
            case 5:  _frame = 1; break;
            case 1:  _frame = 0; break;
        }
        
        ds_list_add(ctrl.fichas_visual_lista, _frame);
        _valor_restante -= _escolha;
    }
}
function iniciar_partida() {
    var ctrl = Obj_blackjack_controller;
    ds_list_clear(ctrl.mao_player);
    ds_list_clear(ctrl.mao_dealer);
    
    // --- LÓGICA DE PRÊMIO DINÂMICO ---
    if (ctrl.aposta_fps == 10) {
        ctrl.fichas_inimigo_aposta = 25; 
        ctrl.atraso_dealer = 30;         
    } else {
        ctrl.fichas_inimigo_aposta = 10;
        ctrl.atraso_dealer = 45;
    }

    // ATUALIZA AS FICHAS COLORIDAS (Sorteia uma vez ao iniciar)
    atualizar_visual_fichas(ctrl.fichas_inimigo_aposta);

    var esp = ctrl.espacamento_cartas;

    // Cartas iniciais
    ds_list_add(ctrl.mao_player, tirar_carta(ctrl.pos_player_x - esp/2, ctrl.pos_player_y));
    ds_list_add(ctrl.mao_player, tirar_carta(ctrl.pos_player_x + esp/2, ctrl.pos_player_y));
    
    ds_list_add(ctrl.mao_dealer, tirar_carta(ctrl.pos_dealer_x - esp/2, ctrl.pos_dealer_y));
    ds_list_add(ctrl.mao_dealer, tirar_carta(ctrl.pos_dealer_x + esp/2, ctrl.pos_dealer_y));
    
    ctrl.revelar_dealer = false; 
    ctrl.estado = "player_vez";
}

function finalizar_partida(venceu) {
    var ctrl = Obj_blackjack_controller;
    if (venceu) {
        global.fichas_atuais += ctrl.fichas_inimigo_aposta;
        ctrl.mensagem = "Vitória! + " + string(ctrl.fichas_inimigo_aposta) + " Fichas.";
    } else {
        var novo_fps = game_get_speed(gamespeed_fps) - ctrl.aposta_fps;
        game_set_speed(max(global.fps_minimo, novo_fps), gamespeed_fps);
        ctrl.mensagem = "Derrota! Você perdeu " + string(ctrl.aposta_fps) + " FPS.";
    }
    ctrl.revelar_dealer = true;
    ctrl.estado = "resultado";
}

// FUNÇÃO DE DESENHO: Agora ela lê a lista já sorteada pelo controlador
function draw_chip_stack(_x, _y, _amount, _usar_lista_sorteada) {
    var ctrl = Obj_blackjack_controller;
    
    // Configurações visuais
    var _max_por_pilha = 10; 
    var _espacamento_h = 35;
    var _offset_v = 4;
    var _total_desenhado = 0;

    if (_usar_lista_sorteada) {
        // --- LÓGICA PARA A MESA (Usa o sorteio aleatório) ---
        var _lista = ctrl.fichas_visual_lista;
        if (!ds_exists(_lista, ds_type_list)) return;
        
        for (var i = 0; i < ds_list_size(_lista); i++) {
            var _coluna = i div _max_por_pilha;
            var _altura = i mod _max_por_pilha;
            draw_sprite(Spr_ficha, _lista[| i], _x + (_coluna * _espacamento_h), _y - (_altura * _offset_v));
        }
    } else {
        // --- LÓGICA PARA O PLAYER (Sempre a maior ficha primeiro para o Total) ---
        var _valor_restante = _amount;
        var _tipos = [
            {v: 25, f: 3}, {v: 10, f: 2}, {v: 5, f: 1}, {v: 1, f: 0}
        ];

        for (var i = 0; i < array_length(_tipos); i++) {
            while (_valor_restante >= _tipos[i].v) {
                var _col = _total_desenhado div _max_por_pilha;
                var _alt = _total_desenhado mod _max_por_pilha;
                
                draw_sprite(Spr_ficha, _tipos[i].f, _x + (_col * _espacamento_h), _y - (_alt * _offset_v));
                
                _valor_restante -= _tipos[i].v;
                _total_desenhado++;
            }
        }
    }
}