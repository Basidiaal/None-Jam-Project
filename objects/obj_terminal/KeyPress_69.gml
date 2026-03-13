if (place_meeting(x, y, Obj_player)) {
    // Passa os dados para o controlador antes de abrir o teclado
    global.terminal_alvo_w = target_w;
    global.terminal_alvo_h = target_h;
    global.terminal_bloco_id = bloco_id;
    
    // Cria a tela de input
    instance_create_layer(0, 0, "Instances", obj_terminal_input);
}