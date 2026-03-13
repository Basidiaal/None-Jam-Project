if(instance_exists(Obj_documento_view))global.pause = false;

 

var pause;
pause = keyboard_check_pressed(vk_escape);
 
 if(pause){
	global.pause = !global.pause;
	
}
 /*
 if(keyboard_check(vk_up)){
	 game_over = true;
 }
 else{
	 
	 game_over = false;
 }