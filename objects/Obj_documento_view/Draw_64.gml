var _sw = display_get_gui_width();
var _sh = display_get_gui_height();
// No Draw GUI do seu obj_documento_view
draw_set_font(Fnt_puzzle_portas); // Certifique-se de selecionar a fonte certa!

// 1. Desenha um fundo escuro (overlay) para dar foco ao documento
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(0, 0, _sw, _sh, false);
draw_set_alpha(1.0);

// 2. Desenha o papel centralizado
var _escala = 2; // Ajuste conforme o tamanho do seu sprite
if (sprite_exists(Spr_documento_gui)) {
    draw_sprite_ext(Spr_documento_gui, 0, _sw/2, _sh/2, _escala, _escala, 0, c_white, 1);
}

// 3. Desenha o texto por cima
draw_set_color(c_black); // Texto geralmente preto no papel
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw_text_ext faz o texto quebrar linha automaticamente
draw_text_ext(_sw/2, _sh/2, texto, 20, sprite_get_width(Spr_documento_gui) * _escala - margem);

// 4. Instrução para fechar
draw_set_color(c_white);
draw_text(_sw/2, _sh - 50, "Pressione Enter para fechar");