/// @desc Lógica de ativar as luzes
ativado = true;
//audio_play_sound(snd_energia_on, 10, false);

// Liga as luzes da sala (Exemplo)
with(obj_luz_pai) {
    acesa = true;
}

show_debug_message("As luzes acenderam!");