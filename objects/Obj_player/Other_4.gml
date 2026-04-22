var cam = instance_create_layer(x,y,layer,Obj_Camera);
cam.target = id;


// Se as variáveis globais de posição tiverem sido definidas, move o player
if (variable_global_exists("player_start_x")) {
    x = global.player_start_x;
    y = global.player_start_y;
}

// Quando entrar em qualquer sala, verifica se há uma posição de destino salva
if (global.target_x != 0 || global.target_y != 0) {
    x = global.target_x;
    y = global.target_y;
    
    // Reseta para 0 para não teleportar o player em transições normais depois
    global.target_x = 0;
    global.target_y = 0;
}
