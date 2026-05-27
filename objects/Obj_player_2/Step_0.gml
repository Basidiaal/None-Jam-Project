if(!ativo){
	
	image_speed = 0;
	exit;
}

if(instance_exists(Obj_transition)){
velh = 0;
velv = 0;
sprite_index = Spr_Player_idle;
	exit;
}
if (global.pause) {
    image_speed = 0;
    exit; // Para o código aqui e não executa o que vem abaixo
} else {
    image_speed = 1; // Retoma a animação (ou a velocidade que você usa)
}






//variaveis
var right,left,jump;
var chao = place_meeting(x,y + 1,Obj_Block);


right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
jump = keyboard_check(vk_up);




if(current_life <= 0) estado = "death";




//aplicando gravidade
if(!chao){
	if(velv < max_velv * 2){
velv += GRAVIDADE * mass
	}
}
//diminuindo o dash timer
if(dash_timer > 0) dash_timer--;

//codigo de movimentação
velh = (right - left) * max_velh

if(right and left)
	{
	estado = "parado"
	velh=0;
	}

//estate machine
switch(estado)
{
	#region parado
	case "parado":
	{
	//comportamento do estado
	sprite_index = Spr_Player_idle;
	
	//troca de estado:movendo
	if(right || left){
	
	estado = "movendo";
	}
	//pulando parado
	else if (jump || velv != 0){
		
	estado = "pulando";
	velv = (-max_velv * jump);
		image_index = 0;
	}
	
	
	
		
	
	
	break;
	}
	#endregion
	
	#region movendo
	case "movendo":
	{
		sprite_index = Spr_Player_run;
		
		
		//troca de estado:parado
		if(abs(velh) < .1){
			estado = "parado"
			velh = 0;
		}
		//pulando enquanto corre
	else if (jump || velv != 0){
		
	    estado = "pulando";
	     velv = (-max_velv * jump);
		 	image_index = 0;
	} 
		
	
		
	
		
		break;
	}
	#endregion
	
	
	
	
	case "death":
	{
		
		
	
		velh = 0;
	 if(sprite_index != Spr_Player_death){
		 image_index = 0;
		 sprite_index = Spr_Player_death;
	 }
		
		//ficando parado no final da animação
		if(image_index >= image_number-1){
			image_index = image_number-1;
		
		//mostrando a tela de game over
		if(global.game_over == false){
			//eu preciso instanciar ela no x e y da camera
			var _cam_x = camera_get_view_x(view_camera[0])
			var _cam_y = camera_get_view_y(view_camera[0])
		layer_sequence_create("Sequences", _cam_x, _cam_y, Sq_game_over);
		
	
		
		//avisando que o game_over ocorreu
		global.game_over = true;
		}
             
		}
		
		break;
	}
	
	
		
}

 


