image_speed = 0;
image_index = cor_do_terminal;
// 1. Checa se o Player 1 está colidindo e apertou E
if (place_meeting(x, y, Obj_player)) {
    if (keyboard_check_pressed(ord("E"))) {
        interagir_com_puzzle(true); // true = sou player 1
    }
}

// 2. Checa se o Player 2 está colidindo e apertou E 
// (Dica: se eles usarem o mesmo teclado, talvez o P2 use outra tecla, como "Enter" ou "P")
if (place_meeting(x, y, Obj_player_2)) {
    if (keyboard_check_pressed(vk_enter)) {
        interagir_com_puzzle(false); // false = sou player 2
    }
}