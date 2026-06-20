if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
	image_index = 1;
	mask_index = -1;
	// Código de abrir a porta:
if (instance_exists(Obj_control_escuridao)) {
    Obj_control_escuridao.deve_sumir = true;
}

// (Não se esqueça de destruir o bloco invisível de colisão da porta aqui também!)
if (instance_exists(Obj_colisao_porta_inicio)) {
    instance_destroy(Obj_colisao_porta_inicio);
}
}