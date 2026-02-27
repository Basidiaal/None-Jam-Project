/*
if(place_meeting(x,y,Obj_player)){
	fps_dinamico = 5
	game_set_speed(fps_dinamico,gamespeed_fps)
}else{
	if(game_get_speed(gamespeed_fps) <= 5){
		fps_dinamico += incremento;
		if(fps_dinamico > fps_maximo)fps_dinamico = fps_maximo
	}
	game_set_speed(fps_dinamico,gamespeed_fps)
}