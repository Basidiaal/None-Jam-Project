
if(!ativo){
	image_speed = 0;
	exit;
}
if(global.pause)exit;


//sistema de colisão e movimento
var _velh = sign(velh);
var _velv = sign(velv);


//horizontal
repeat(abs(velh))
{
	
	if(place_meeting(x + _velh, y, Obj_Block)){
	velh = 0;
	break;
	}
	if(place_meeting(x + _velh, y, Obj_barreira)){
	velh = 0;
	 estado = "parado";
	break;
	}
	if(place_meeting(x + _velh, y, Obj_barreira_final)){
	velh = 0;
	 estado = "parado";
	break;
	}
	
	if(place_meeting(x + _velh, y, Obj_colisao_porta_inicio)){
	velh = 0;
	 estado = "parado";
	break;
	}
	
	// VERIFICAÇÃO DA PORTA
    var _inst_porta = instance_place(x + _velh, y, Obj_porta_cassino);
    if (_inst_porta != noone) {
        // SÓ para o player se a porta NÃO estiver aberta
        if (_inst_porta.aberta == false) {
            velh = 0;
			 estado = "parado";
            break;
        }
    }
	x += _velh;
	
}

//vertical
repeat(abs(velv)){

  if(place_meeting(x, y + _velv,Obj_Block)){
	  velv = 0;
	
	  break;
  }
  if(place_meeting(x, y + _velv,Obj_barreira)){
	  velv = 0;
	   estado = "parado";
	  break;
  }
   if(place_meeting(x, y + _velv,Obj_barreira_final)){
	  velv = 0;
	   estado = "parado";
	  break;
  }
 
   if(place_meeting(x, y + _velv, Obj_colisao_porta_inicio)){
	  velv = 0;
	   estado = "parado";
	  break;
  }
 
 // VERIFICAÇÃO DA PORTA
    var _inst_porta_v = instance_place(x, y + _velv, Obj_porta_cassino);
    if (_inst_porta_v != noone) {
        // SÓ para o player se a porta NÃO estiver aberta
        if (_inst_porta_v.aberta == false) {
            velv = 0;
			 estado = "parado";
            break;
        }
    }
  y += _velv;
	
}

// Pega a posição atual da câmera
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

// Arredonda a posição para o número inteiro mais próximo
// 'floor' arredonda para baixo, 'round' para o mais próximo. Teste ambos.
camera_set_view_pos(view_camera[0], floor(_cam_x), floor(_cam_y));