

if(instance_exists(Obj_transition)){
velh = 0;
velv = 0;
sprite_index = Spr_Player_idle;
	exit;
}
if(global.pause){
	image_speed = 0;
	exit;
}

	


//image_speed = 1;
//controlando a minha invencibilidade
if(invincible && timer_invincible > 0){
timer_invincible--;
}
else{
	invincible = false;
}


//variaveis
var right,left,jump,attack,dash,defend;
var chao = place_meeting(x,y + 1,Obj_Block);


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check(vk_space);
attack = keyboard_check(ord("J"));
defend = keyboard_check(ord("K"));
dash = keyboard_check_pressed(ord("L"));



if(current_life <= 0) estado = "death";

if(attack_buff > 0) attack_buff -=1;


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
	else if(attack){
		estado = "ataque";
		velh = 0;
			image_index = 0;
	}
	else if(dash && dash_timer <= 0){
	 estado = "dash";
	 image_index = 0;
	}
	else if(defend){
	estado = "defend";
	velh = 0
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
		else if(attack){
		estado = "ataque";
		velh = 0;
		image_index = 0;
	}
	else if(dash){
	 estado = "dash";
	 image_index = 0;
	}
		
	
		
		break;
	}
	#endregion
	
	#region pulando
	case "pulando":
	{
		//animação de caindo
		if(velv > 0){
			sprite_index = Spr_Player_fall
		}
		//animação de pulo
		else{
			sprite_index = Spr_Player_jump;
			//garantindo que a animação não se repita
			if(image_index >= image_number-1){
			 image_index = image_number-1	
			}
		}
		if(attack){
			estado = "ataque aéreo";
		}
		if(chao){
			estado = "parado";
			velh = 0;
		}
	
	
	 break;
	}
	#endregion
	
	#region ataque aéreo
	case "ataque aéreo":
	{
	//checando se troquei de sprite
	if(sprite_index != Spr_Player_air_attack){
		sprite_index = Spr_Player_air_attack;
		image_index = 0;
	}
	
	//criando o objeto de dano
	
		if(image_index >= 2 && dano == noone && i_can){
			dano       = instance_create_layer(x + sprite_width/2 + velh * 2,y - sprite_height/2,layer,Obj_dano);
		    dano.dano   = Attack;
			dano.pai   = id;
			i_can = false;
		}
	
	//saindo do estado
	if(image_index >= image_number - 1){
		estado = "pulando";
		i_can = true;
			if(dano){
				instance_destroy(dano,false);
				dano = noone;
			}
	}
	
	if(chao){
		estado = "parado";
		i_can = true;
			if(dano){
				instance_destroy(dano,false);
				dano = noone;
			}
	}
	
	break;
	}
	#endregion
	
	#region ataque
	case "ataque":
	{
		
		velh = 0;
		
		if(combo == 0){
		sprite_index = Spr_Player_attack;
		attack_mult = 1;
		}
		else if(combo == 1){
		sprite_index = Spr_Player_attack2;
		//aumentando o dano do combo 1
		attack_mult = 2;
		}
		else if(combo == 2){
		sprite_index = Spr_Player_attack3;
		//aumentando o dano do combo 2
		attack_mult = 3;
		}
		
		//criando o objeto de dano
		if(image_index >= 2 && dano == noone && i_can){
			dano       = instance_create_layer(x + sprite_width/4,y - sprite_height/2,layer,Obj_dano);
		    dano.dano   = Attack * attack_mult;
			dano.pai   = id;
			i_can = false;
		}
		
		//configurando com o buff(intervalo) do combo
		if(attack && combo < 2){
		//sempre que eu atacar o buff reinicia
		attack_buff = room_speed;	
		}
		
		if(attack_buff && combo < 2 && image_index >= image_number-1){
		 combo++;	
		 image_index = 0;
		 	i_can = true;
			if(dano){
				instance_destroy(dano,false);
				dano = noone;
			}
			//zerar o buffer
			attack_buff = 0;
		}
		
		if(image_index > image_number-1){
			estado = "parado";
			velh = 0;
			combo = 0;
			i_can = true;
			attack_mult = 1;
			if(dano){
				instance_destroy(dano,false);
				dano = noone;
			}
		}	
		if(dash && dash_timer <= 0){
	    estado = "dash";
	    image_index = 0;
		combo = 0;
		if(dano){
		instance_destroy(dano,false);
		dano = noone;
		}
	}
	//caso o player tenha que mudar para o estado caindo no meio do ataque
	if (velv != 0 ){
		
	estado = "pulando";
	image_index = 0;
	}
		break;
		
	}
	#endregion
	
	#region
	case "dash":
	{
		
		if(sprite_index != Spr_Player_dash){
		 image_index = 0;
		 sprite_index = Spr_Player_dash;
	 }
		
		//velocidade
		velh = image_xscale * dash_vel;
		//saindo do estado
		if(image_index >= image_number-1 || !chao){
			estado = "parado";
			//resetando o timer do dash
			dash_timer = dash_delay;
		}
		break;
	}
	#endregion
	
	#region
	case "defend":
	{
		velh = 0;
		if(sprite_index != Spr_Player_defend){
			image_index = 0;
			sprite_index = Spr_Player_defend;
			
		}
		if(image_index >= image_number-1){
			image_speed = 0;
			}
		invincible = true;
		
		if(keyboard_check_released(ord("K"))){
		 estado = "parado";	
		}
		
		break;
	}
	#endregion
	
	case "hit":
	{
		if(sprite_index != Spr_Player_hit){
			
			sprite_index = Spr_Player_hit;
			image_index = 0;
			
			//deixando invencivel
			invincible = true;
			timer_invincible = invincible_timer;
		}
		
		//ficando parado ao levar dano 
		velh = 0;
		
		//saindo do estado
		
		//checando se eu devo morrer
		
		if(current_life > 0){
		if(image_index >= image_number-1){
		   estado = "parado";	
		}
		}
		else{
		if(image_index >= image_number-1){
			estado = "death"
		}
		}
		
	  break;	
	}
	
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

 


