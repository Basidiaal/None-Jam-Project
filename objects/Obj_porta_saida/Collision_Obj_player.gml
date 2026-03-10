/// @description Lógica de transporte

if (trancada) {
    // Feedback de porta trancada
    if (keyboard_check_pressed(ord("E"))) {
        show_message("Caminho bloqueado. Resolva o Puzzle.");
 
    }
} else {
    // Se não estiver trancada, o player pode passar
   if (!trancada) {
    if (keyboard_check_pressed(ord("E"))) {
        // Guarda a posição onde o player deve aparecer na próxima sala
        global.target_x = destino_x;
        global.target_y = destino_y;
        
        // Vai para a sala
        room_goto(Sala_de_resolucao_do_puzzle);
	}	
    
}
}