var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
var _fps_ok = (game_get_speed(gamespeed_fps) >= 60);

if (_dist < 50 && keyboard_check_pressed(ord("E"))) {
    if (global.tem_chave_setor && _fps_ok) {
        // Sucesso: Vai para a próxima sala
        room_goto(rm_corredor_tecnico);
    } 
    else {
        // Mensagem de erro dependendo do que falta
        if (!global.tem_chave_setor) {
            show_debug_message("A porta requer a Chave do Setor.");
        } else if (!_fps_ok) {
            show_debug_message("Erro de Sincronia: Estabilize o sistema em 60 FPS para sair.");
        }
    }
}