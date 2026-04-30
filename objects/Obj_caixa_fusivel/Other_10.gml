/// @desc Ativar Mecanismo da Pintura
ativado = true;


if (instance_exists(Obj_pintura_secreta)) {
    Obj_pintura_secreta.subir = true; // Manda a pintura subir
	//audio_play_sound(Snd_pintura_subindo, 10 , false);
}

//global.texto_ui = "MECANISMO DE ELEVAÇÃO ATIVADO.";
//global.exibir_ui = true;
//alarm[0] = 90;