if(!ativo){
	image_speed = 0;
	exit;
}
if(global.pause)exit;
//troca de lado
var tamanho_customizado = 1.3; 
var tamanho_customizado_y = 1.5;
// troca de lado
if(velh != 0) xscale = sign(velh);

// Aplica o lado multiplicando pelo tamanho desejado
image_xscale = xscale * tamanho_customizado;
//para a proporção y
image_yscale = tamanho_customizado_y;


//exibindo estado da entidade manualmente
if(position_meeting(mouse_x,mouse_y,id)){
	
	if(mouse_check_button_released(mb_left)){
	mostra_estado = !mostra_estado;
	}
}

image_speed = (img_spd / room_speed)