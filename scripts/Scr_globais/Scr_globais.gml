// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações




global.game_over = false;


function reinicia_jogo(){
	Obj_Player.estado = "parado"
	Obj_Player.current_life = Obj_Player.max_life;
	room_restart()
	
if(file_exists("checkpoint")){
ini_open("checkpoint");
Obj_checkpoint.sprite_index = Spr_enable_checkpoint;
Obj_Camera.x = ini_read_real("Camera","CamX",Obj_Camera.x);
Obj_Camera.y = ini_read_real("Camera","CamY",Obj_Camera.y);
Obj_Player.x = ini_read_real("Player","PosX",Obj_Player.x);
Obj_Player.y = ini_read_real("Player","PosY",Obj_Player.y);
ini_close();
}
global.game_over = false;
}