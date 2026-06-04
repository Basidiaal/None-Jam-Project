if (global.pause) {

    exit; // Para o código aqui e não executa o que vem abaixo
} 
if (state == "fade_in") {
	Obj_player.velh = 0
	Obj_player.velv = 0
    alpha += fade_speed;
    if (alpha >= 1) {
        alpha = 1;
        state = "fade_out";
        
        // Quando a tela está totalmente preta, mudamos de sala ou reiniciamos
        if (target_room == "restart") {
            room_restart();
			
        } else {
            room_goto(target_room);
        }
    }
} else if (state == "fade_out") {
    alpha -= fade_speed_close;
    if (alpha <= 0) {
        // Quando o fade sumir totalmente, liberamos o player
        if (instance_exists(Obj_player)) {
            Obj_player.frozen = false;
        }
        instance_destroy(); 
    }
}