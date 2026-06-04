// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Scr_atualizar_textos(){

    // Atualiza as opções do Menu Principal
    Obj_main_menu.options_main[0] = Obj_main_menu.texto_iniciar[Obj_main_menu.lang_index];
    Obj_main_menu.options_main[1] = Obj_main_menu.texto_idioma_label[Obj_main_menu.lang_index];
    Obj_main_menu.options_main[2] = Obj_main_menu.texto_config[Obj_main_menu.lang_index];
    Obj_main_menu.options_main[3] = Obj_main_menu.texto_creditos[Obj_main_menu.lang_index]; // Se for igual em todos, pode deixar fixo
    Obj_main_menu.options_main[4] = Obj_main_menu.texto_sair[Obj_main_menu.lang_index]; // Exemplo rápido
    
    // Atualiza as opções de Configurações
    Obj_main_menu.options_settings[0] = Obj_main_menu.texto_resolucao[Obj_main_menu.lang_index];
    Obj_main_menu.options_settings[1] = Obj_main_menu.texto_tela[Obj_main_menu.lang_index];
	Obj_main_menu.options_settings[2] = Obj_main_menu.texto_volume_geral[Obj_main_menu.lang_index];
	Obj_main_menu.options_settings[3] = Obj_main_menu.texto_musica[Obj_main_menu.lang_index];
	Obj_main_menu.options_settings[4] = Obj_main_menu.texto_efeitos[Obj_main_menu.lang_index];
	Obj_main_menu.options_settings[5] = Obj_main_menu.texto_voltar[Obj_main_menu.lang_index];
    // ... complete para os outros

}