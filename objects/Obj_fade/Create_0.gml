alpha = 0;
mudei = false;
fade_speed = .02; // Velocidade do fade (ajuste como preferir)
fade_speed_close = .04
fade_color = c_black;
target_room = noone;
state = "fade_in"; // "fade_in" (escurecendo) ou "fade_out" (clareando)

// NOVO: Por padrão ele NÃO espera animação, a menos que a porta mande esperar!
esperar_animacao = false;
