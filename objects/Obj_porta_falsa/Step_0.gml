/// @description Interação com a porta
// Verifica se o player está perto e apertou a tecla E
if (place_meeting(x, y, Obj_player)) {
    if (keyboard_check(ord("E"))) {
        
        // Avisa o gerenciador que esta porta foi testada
        if (instance_exists(Obj_meta_manager)) {
            Obj_meta_manager.contar_porta = true; 
            // 'id' serve para o gerente saber qual porta foi (opcional)
        }
        
        // Teleporta o jogador de volta para o início da sala (ou para uma sala de transição)
        room_restart(); 
    }
}