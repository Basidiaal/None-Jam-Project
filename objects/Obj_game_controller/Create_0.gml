//função que salva o valor do ds_menu_audio
save_audio = function()
{
	
 ini_open("audio.ini");
 
 with(Obj_pause)
 {
	 var _grid = ds_grid_write(ds_menu_audio);
	 
	 ini_write_string("grid","grid", _grid);
	 
 }
	
	ini_close();
}
//função que carrega o valor do ds_menu_audio
load_audio = function()
{
	ini_open("audio.ini");
	var _grid = ini_read_string("grid","grid","");
	
	with(Obj_pause){
		ds_grid_read(ds_menu_audio, _grid);
		
	}
	ini_close();
	
}
//função que salva o valor do ds_menu_graphics
save_graphics = function()
{
	
 ini_open("graphics.ini");
 
 with(Obj_pause)
 {
	 var _grid = ds_grid_write(ds_menu_graphics);
	 
	 ini_write_string("grid","grid", _grid);
	 
 }
	
	ini_close();
}
//função que carrega o valor do ds_menu_graphics
load_graphics = function()
{
	ini_open("graphics.ini");
	var _grid = ini_read_string("grid","grid","");
	
	with(Obj_pause){
		ds_grid_read(ds_menu_graphics, _grid);
		
	}
	ini_close();
	
}
//função que salva o valor do ds_menu_controls
save_controls = function()
{
	
 ini_open("controls.ini");
 
 with(Obj_pause)
 {
	 var _grid = ds_grid_write(ds_menu_controls);
	 
	 ini_write_string("grid","grid", _grid);
	 
 }
	
	ini_close();
}
//função que carrega o valor do ds_menu_controls
load_controls = function()
{
	ini_open("controls.ini");
	var _grid = ini_read_string("grid","grid","");
	
	with(Obj_pause){
		ds_grid_read(ds_menu_controls, _grid);
		
	}
	ini_close();
	
}


global.pause = true;

global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

global.key_revert = ord("X");
global.key_enter = vk_enter;
global.key_left = vk_left;
global.key_right = vk_right
global.key_up = vk_up;
global.key_down = vk_down;

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sound_effects);


