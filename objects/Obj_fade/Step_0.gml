// PRIMEIRA LINHA DO STEP DO OBJ_FADE:
if (variable_global_exists("item_coletado_neste_frame") && global.item_coletado_neste_frame == true) {
    global.item_coletado_neste_frame = false; // Reseta a trava
    if (instance_exists(Obj_player)) {
        Obj_player.frozen = false; // Descongela o player se ele tiver sido congelado pela porta
    }
    instance_destroy(); // Destrói o fade IMEDIATAMENTE, cancelando a ida para a outra sala
    exit; // Para o código aqui
}

if (global.pause) {
    exit; 
} 

if (state == "esperando_animacao") {
    if (instance_exists(Obj_player)) {
        Obj_player.velh = 0;
        Obj_player.velv = 0;
        
        // Se a animação parou (image_speed == 0) ou chegou no último frame:
        if (Obj_player.image_speed == 0 || Obj_player.image_index >= Obj_player.image_number - 1) {
            state = "fade_in"; 
        }
    } else {
        state = "fade_in";
    }
    exit; 
}
// -----------------------------------------

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