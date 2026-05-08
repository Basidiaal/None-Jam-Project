if (global.pause) {
    image_speed = 0;
    exit; // Para o código aqui e não executa o que vem abaixo
} else {
    image_speed = 1; // Retoma a animação (ou a velocidade que você usa)
}

//checar se estou colidindo com o player
var player = place_meeting(x,y,Obj_player);

//se o player está colidindo comigo
if(player and keyboard_check(ord("E"))){
	
	//codigo da transição
	var tran = instance_create_layer(0,0,layer,Obj_transition);
	tran.Destino = Destino;
	tran.Destino_x = Destino_x;
	tran.Destino_y = Destino_y;
	
	
}