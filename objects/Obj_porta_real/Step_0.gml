/// @description Interação Final
if (place_meeting(x, y, Obj_player)) {
    if (keyboard_check_pressed(ord("E"))) {
        // Limpa os dados do meta-puzzle para não ficar preso no loop
        if (file_exists("meta_data.ini")) file_delete("meta_data.ini");
        
        // Teleporta para a PRÓXIMA SALA (o fim do puzzle)
        room_goto(Sala_3);
    }
}