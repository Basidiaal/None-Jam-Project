
//já mudei de room
if(mudei){
	
	alpha -= .01;
}
else//ainda não mudei de room
{
	
	alpha += .01;
}


//quando o alpha passar de 1,mudo de room
if(alpha >= 1)
{
	
room_goto(Destino);
  

  
  //11/11/2025 esse codigo não vai ser mais necessario pois não vamos transferir
  //o mesmo player para diferentes rooms e sim vai ter um player em cada room
 //controlando a posição do player
 //Obj_Player.x = Destino_x
 //Obj_Player.y = Destino_y
 


}

//me destruindo depois de estar transparente e ter mudado de room
if(mudei && alpha <= 0){
instance_destroy();
}