if (state == "fade_in") {
    alpha += fade_speed;
    if (alpha >= 1) {
        alpha = 1;
        state = "fade_out";
        
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
        instance_destroy(); // O fade termina e o objeto se destrói
    }
}