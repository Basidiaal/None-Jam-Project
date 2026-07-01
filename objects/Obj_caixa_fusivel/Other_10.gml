/// @desc Ativar Mecanismo da Pintura
ativado = true;
image_index = 1; // Muda o sprite para a caixa com o fusível/fio dentro

if (instance_exists(Obj_pintura_secreta)) {
    Obj_pintura_secreta.subir = true; // Manda a pintura subir
    //audio_play_sound(Snd_pintura_subindo, 10 , false);
}