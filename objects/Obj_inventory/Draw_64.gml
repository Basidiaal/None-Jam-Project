if (item_segurando != noone) {
    draw_set_font(Fnt_puzzle_portas); // Use sua fonte temática
    draw_set_color(c_aqua);
    draw_text(30, 30, "LINK ATIVO: " + string_upper(item_segurando.nome));
}