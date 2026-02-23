// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Scr_change_resolution(){
  switch(argument0){
	case 0:
	 window_set_size(384,316);
	 window_center();
		Obj_game_controller.save_graphics();
	
	 
	 ini_open("config.dat");
	var _width = 384;
	var _height = 316;
	
	ini_write_real("Geral", "IndiceResolucao", global.indice_resolucao);
    ini_write_real("Geral", "Largura", _width);                  
    ini_write_real("Geral", "Altura", _height);

ini_close();
	
break;  
	case 1: 
	window_set_size(768,432);
	 window_center();
	Obj_game_controller.save_graphics();
	 
	 ini_open("config.dat");
	var _width = 768;
	var _height = 432;
	
	ini_write_real("Geral", "IndiceResolucao", global.indice_resolucao);
    ini_write_real("Geral", "Largura", _width);                  
    ini_write_real("Geral", "Altura", _height);

ini_close();
	break;  
	case 2: 
	window_set_size(1152,648);
	 window_center();
	 Obj_game_controller.save_graphics();
	 
	 ini_open("config.dat");
	var _width = 1152;
	var _height = 648;
	
	ini_write_real("Geral", "IndiceResolucao", global.indice_resolucao);
    ini_write_real("Geral", "Largura", _width);                  
    ini_write_real("Geral", "Altura", _height);

ini_close();
	break;  
	case 3: 
	window_set_size(1536,874);
	 window_center();
	 Obj_game_controller.save_graphics();
	 
	 ini_open("config.dat");
	var _width = 1536;
	var _height = 874;
	
	ini_write_real("Geral", "IndiceResolucao", global.indice_resolucao);
    ini_write_real("Geral", "Largura", _width);                  
    ini_write_real("Geral", "Altura", _height);

ini_close();
	break;  
	case 4: 
	window_set_size(1920,1080);
	 window_center();
	 Obj_game_controller.save_graphics();
	 
	 ini_open("config.dat");
	var _width = 1920;
	var _height = 1080;
	
	ini_write_real("Geral", "IndiceResolucao", global.indice_resolucao);
    ini_write_real("Geral", "Largura", _width);                  
    ini_write_real("Geral", "Altura", _height);

ini_close();
	break;  
  }
}