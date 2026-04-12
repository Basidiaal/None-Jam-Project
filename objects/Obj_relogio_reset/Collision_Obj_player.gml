// No evento de colisão/interação do Obj_relogio_reset
if (keyboard_check_pressed(ord("E"))) {
    game_set_speed(60, gamespeed_fps); // Volta ao normal
    global.fichas_atuais = 0;          // Zera o progresso
    instance_create_depth(x, y, -1000, Obj_efeito_flash);
    //show_message("Sua realidade foi restaurada... mas o preço foi seu progresso.");
}