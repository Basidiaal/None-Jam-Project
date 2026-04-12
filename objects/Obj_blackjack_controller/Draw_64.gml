/// Evento Draw GUI - Obj_blackjack_controller

// 1. CONFIGURAÇÕES DE ESCALA E ANCORAGEM (O "Coração" do sistema)
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// Proporção e Escala
var _escala_mesa = (_gui_w * proporcao_feltro) / sprite_get_width(Spr_mesa_feltro);
var _largura_total_mesa = sprite_get_width(Spr_mesa_feltro) * _escala_mesa;
var _altura_total_mesa = sprite_get_height(Spr_mesa_feltro) * _escala_mesa;

// Pontos de Ancoragem do Feltro
var _mesa_x1 = (_gui_w / 2) - (_largura_total_mesa / 2); // Borda Esquerda
var _mesa_y1 = (_gui_h / 2) - (_altura_total_mesa / 2);  // Borda Superior
var _mesa_x2 = (_gui_w / 2) + (_largura_total_mesa / 2); // Borda Direita
var _mesa_y2 = (_gui_h / 2) + (_altura_total_mesa / 2);  // Borda Inferior
var _centro_x = _gui_w / 2;
var _centro_y = _gui_h / 2;

// --- DESENHA O FELTRO ---
draw_sprite_ext(Spr_mesa_feltro, 0, _centro_x, _centro_y, _escala_mesa, _escala_mesa, 0, c_white, 1);

// 2. CONFIGURAÇÕES GERAIS DE TEXTO
draw_set_font(Fnt_puzzle_portas);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// 3. ELEMENTOS VISUAIS DA MESA (Agora relativos às bordas)

// Deck visual (Canto superior direito da mesa)
var _deck_x = _mesa_x2 - 100;
var _deck_y = _mesa_y1 + 100;
for(var i=0; i<3; i++) draw_sprite(Spr_carta_verso, 0, _deck_x + (i*2), _deck_y - (i*2));

// Cartas Player e Dealer (Usando as posições que as structs já possuem, 
// mas lembre-se de que o 'target' delas no Step deve ser baseado na mesa!)
for(var i=0; i<ds_list_size(mao_player); i++) {
    var _c = mao_player[| i];
    if (is_struct(_c)) draw_sprite_ext(Spr_cartas_frente, _c.frame, _c.curr_x, _c.curr_y, 1, 1, 0, c_white, _c.alpha);
}

for(var i=0; i<ds_list_size(mao_dealer); i++) {
    var _c = mao_dealer[| i];
    if (is_struct(_c)) {
        if (i == 0 && !revelar_dealer) draw_sprite(Spr_carta_verso, 0, _c.curr_x, _c.curr_y);
        else draw_sprite(Spr_cartas_frente, _c.frame, _c.curr_x, _c.curr_y);
    }
}

// 4. UI DE FICHAS (Ancoradas)

// Fichas do Jogador (Canto inferior esquerdo da mesa)
var _fichas_p_x = _mesa_x1 + 80;
var _fichas_p_y = _mesa_y2 - 80;
draw_chip_stack(_fichas_p_x, _fichas_p_y, global.fichas_atuais, false);

var num_colunas_player = max(1, ceil(global.fichas_atuais / 50)); 
var offset_texto = 60 + (num_colunas_player - 1) * 35;
draw_set_halign(fa_left);
draw_text(_fichas_p_x + offset_texto, _fichas_p_y, "Total: " + string(global.fichas_atuais));

// Pote Central (Centro da mesa, levemente acima do meio)
if (estado != "apostando" && estado != "resultado") {
    draw_chip_stack(_centro_x - 20, _centro_y - 20, 0, true);
}

// 5. INTERFACE DE ESTADOS (Ancorada na base da mesa)
draw_set_halign(fa_center);
var _btn_y = _mesa_y2 - 120; // Botões ficam sempre a 120px da borda inferior da mesa

if (estado == "apostando") {
    // 5 FPS
    draw_sprite_ext(Spr_botoes_gui, 4, _centro_x - 120, _btn_y, 2, 2, 0, c_white, 1);
    draw_text(_centro_x - 120, _btn_y - 50, "5 FPS");

    // 10 FPS
    draw_sprite_ext(Spr_botoes_gui, 5, _centro_x + 120, _btn_y, 2, 2, 0, c_white, 1);
    draw_text(_centro_x + 120, _btn_y - 50, "10 FPS");
    
    draw_text(_centro_x, _btn_y + 80, mensagem);
}

if (estado == "player_vez") {
	
    draw_sprite_ext(Spr_botoes_gui, 2, _centro_x - 120, _btn_y, 2, 2, 0, c_white, 1);
    draw_text(_centro_x - 120, _btn_y - 40, "H (HIT)");
    
    draw_sprite_ext(Spr_botoes_gui, 1, _centro_x + 120, _btn_y, 2, 2, 0, c_white, 1);
    draw_text(_centro_x + 120, _btn_y - 40, "S (STAND)");
    
   // PONTUAÇÃO ANCORADA À ESCALA
    // Multiplicamos o deslocamento (80 e 120) pela escala da mesa
	
  // --- PONTUAÇÃO ANCORADA E ESCALADA ---
    var _tamanho_texto = _escala_mesa * 0.3; // Ajuste o 0.8 se ainda achar grande ou pequeno
    
    // Texto do Jogador (Abaixo do centro)
    draw_text_transformed(_centro_x, _centro_y + (10 * _escala_mesa), "Sua Soma: " + string(somar_mao(mao_player)), _tamanho_texto, _tamanho_texto, 0);
    
    // Texto do Dealer (Acima do centro)
    draw_text_transformed(_centro_x, _centro_y - (30 * _escala_mesa), "Dealer: ? + " + string(somar_mao_visivel(mao_dealer, true)), _tamanho_texto, _tamanho_texto, 0);


}

// 6. ESTADO: RESULTADO
if (estado == "resultado") {
    draw_set_color(c_yellow); 
    draw_text(_centro_x, _centro_y, mensagem);

    var _space_y = _mesa_y2 - 100;
    draw_set_color(c_white);
    draw_text(_centro_x, _space_y + 45, "CONTINUAR");
    draw_sprite_ext(Spr_botoes_gui, 3, _centro_x, _space_y, 2, 2, 0, c_white, 1);
}

// 7. BOTÃO SAIR (Canto superior esquerdo do feltro)
var _esc_x = _mesa_x1 + 60; 
var _esc_y = _mesa_y1 + 60;

draw_set_halign(fa_center);
draw_text(_esc_x, _esc_y + 35, "SAIR");
draw_sprite_ext(Spr_botoes_gui, 0, _esc_x, _esc_y, 2, 2, 0, c_white, 1);

// Reseta o desenho
draw_set_halign(fa_left);
draw_set_valign(fa_top);