/// @desc Limpar áudio da memória
if (variable_instance_exists(id, "meu_emissor")) {
    if (meu_emissor != noone) {
        if (audio_emitter_exists(meu_emissor)) {
            audio_emitter_free(meu_emissor);
        }
    }
}

// Também paramos o som manual se ele existir
if (som_loop != noone) {
    if (audio_is_playing(som_loop)) {
        audio_stop_sound(som_loop);
    }
}