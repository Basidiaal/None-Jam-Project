if (global.pause) {
    exit; 
} 

if (state == "fade_in") {
    Obj_player.velh = 0;
    Obj_player.velv = 0;
    alpha += fade_speed;
    
    if (alpha >= 1) {
        alpha = 1;
        state = "fade_out";
        
        // Se houver coordenadas salvas para o player, movemos ele ANTES de abrir a nova sala
        if (variable_instance_exists(id, "target_x") && target_x != undefined) {
            if (instance_exists(Obj_player)) {
                Obj_player.x = target_x;
                Obj_player.y = target_y;
            }
        }
        
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
        if (instance_exists(Obj_player)) {
            Obj_player.frozen = false;
        }
        instance_destroy(); 
    }
}