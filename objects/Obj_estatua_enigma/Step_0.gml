// 1. Atualiza o frame de acordo com as partes
// Lógica binária simples: Cabeça vale 1, Braço vale 2, Perna vale 4
image_index = (tem_cabeca * 1) + (tem_braco * 2) + (tem_perna * 4);

// 2. Interação para colocar peças
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E")) && !movendo) {
    var _inv = Obj_inventory;
    var _item = _inv.item_segurando;

    if (_item != noone) {
        var _colocou = false;
        
        if (_item.id_unico == "peca_cabeca" && !tem_cabeca) { tem_cabeca = true; _colocou = true; }
        if (_item.id_unico == "peca_braco"  && !tem_braco)  { tem_braco  = true; _colocou = true; }
        if (_item.id_unico == "peca_perna"  && !tem_perna)  { tem_perna  = true; _colocou = true; }

        if (_colocou) {
            audio_play_sound(Snd_encaixe_pedra, 10, false);
            _inv.item_segurando = noone; // Consome o item
            
            // Se completou tudo, inicia movimento
            if (tem_cabeca && tem_braco && tem_perna) {
                movendo = true;
                
            }
        }
    }
}

// 3. Movimento da estátua completa
if (movendo) {
    // A. INICIAR O SOM
    // Se ainda não estiver tocando, damos o play
    if (som_arrastando == noone || !audio_is_playing(som_arrastando)) {
        som_arrastando = audio_play_sound(Snd_estatua_arrastando, 10, true);
    }

    // B. CÁLCULO MATEMÁTICO DO VOLUME (Igual à pintura)
    var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
    var _vol = 1 - (_dist / dist_maxima_som);
    _vol = clamp(_vol, 0, 1);
    
    // Aplicamos o volume calculado
    audio_sound_gain(som_arrastando, _vol, 0);

    // C. MOVIMENTO FÍSICO
    if (x < x_alvo) {
        x += velocidade;
    } else {
        x = x_alvo;
        movendo = false;
        
		// A estátua parou, agora sim avisamos a parede para revelar a porta
        if (instance_exists(Obj_parede_revelavel)) {
            Obj_parede_revelavel.iniciar_revelacao = true;
        }
		
        // D. FINALIZAR O SOM
        // Quando a estátua para, o som deve parar
        if (audio_is_playing(som_arrastando)) {
            audio_stop_sound(som_arrastando);
            som_arrastando = noone;
        }
        
        // Som de impacto final opcional
       // var _impacto = audio_play_sound(Snd_estatua_parou, 10, false);
       // audio_sound_gain(_impacto, _vol, 0);
    }
}