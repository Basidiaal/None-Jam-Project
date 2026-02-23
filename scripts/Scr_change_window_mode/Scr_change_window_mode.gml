// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Scr_change_window_mode(){

switch(argument0){
	case 0: window_set_fullscreen(true);
	global.tela_cheia = 1;
	ini_open("config.dat");
	 ini_write_real("Geral", "TelaCheia", global.tela_cheia);
	 ini_close();
	break;
	case 1: window_set_fullscreen(false);
	global.tela_cheia = 0;
	ini_open("config.dat");
	 ini_write_real("Geral", "TelaCheia", global.tela_cheia);
	 ini_close();
	 break;
}
}