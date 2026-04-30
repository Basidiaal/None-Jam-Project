depth = -y;

if (subir) {
    // 1. Tocar o som se ele ainda não estiver tocando
    if (som_loop == noone || !audio_is_playing(som_loop)) {
        som_loop = audio_play_sound(Snd_pintura_subindo, 10, true);
    }

    // 2. CÁLCULO MATEMÁTICO DO VOLUME
    // Calculamos a distância entre a pintura e o player
    var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
    
    // Transformamos a distância em um valor de 0 a 1 (Volume)
    // Se a distância for 0, o volume é 1. Se for 300, o volume é 0.
    // Lógica Linear (a que você tem agora)
var _vol = 1 - (_dist / dist_maxima);

// Lógica Suave (o som fica "cheio" por mais tempo e cai no final)
// var _vol = sqrt(clamp(1 - (_dist / dist_maxima), 0, 1)); 

_vol = clamp(_vol, 0, 1);
audio_sound_gain(som_loop, _vol, 0);
    
    // "Clamp" garante que o volume não fique negativo (menor que 0)
    _vol = clamp(_vol, 0, 1);

    // 3. Aplicar o volume ao som que está tocando
    audio_sound_gain(som_loop, _vol, 0); 

    // 4. Lógica de movimento original
    if (y > y_alvo) {
        y -= velocidade_subida;
    } else {
        y = y_alvo;
        subir = false;
        
        // Parar o som ao terminar
        if (audio_is_playing(som_loop)) {
            audio_stop_sound(som_loop);
            som_loop = noone;
        }
        
        // Som de impacto final (também com volume calculado)
        //var _impacto = audio_play_sound(Snd_pintura_travou, 10, false);
        //audio_sound_gain(_impacto, _vol, 0);
    }
}