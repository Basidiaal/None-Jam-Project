/// @description Desenhar Mensagem Atual
if (estado_mensagem == 1) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	draw_set_font(Fnt_puzzle_portas);
    
    var _x = display_get_gui_width() / 2;
    var _y = display_get_gui_height()-650;
    
    // Pega o texto da array dinamicamente
    var _texto = mensagens[indice_atual];

    // Efeito de Fade (In e Out)
    var _alpha = 1;
    if (timer_mensagem < 30) _alpha = timer_mensagem / 30; 
    if (timer_mensagem > (duracao_texto - 30)) _alpha = (duracao_texto - timer_mensagem) / 30;

    draw_set_alpha(_alpha);
    draw_set_color(c_white);
    draw_text(_x, _y, _texto);
    draw_set_alpha(1);
}





    

   

   