// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Scr_change_volume(){
var type = menu_option[page];

switch(type){
 case 0: audio_master_gain(argument0);
         
		 ini_open("config.dat");
        global.master_volume = argument0;
		ini_write_real("Geral","VolumeGeral", global.master_volume);
   ini_close();
   Obj_game_controller.save_audio();
		
 
 break;
 case 1: audio_group_set_gain(audiogroup_sound_effects,argument0,0);
 
                ini_open("config.dat");
        global.effects_volume = argument0;
		ini_write_real("Geral","EffectsVolume", global.effects_volume);
   ini_close();
   Obj_game_controller.save_audio();
	   break;
 case 2: audio_group_set_gain(audiogroup_music,argument0,0);
 
     ini_open("config.dat");
        global.music_volume = argument0;
		ini_write_real("Geral","MusicVolume", global.music_volume);
   ini_close();
   Obj_game_controller.save_audio();
 break;
	
}
}