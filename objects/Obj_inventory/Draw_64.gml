if (item_segurando != noone) {
    draw_set_font(Fnt_puzzle_portas);
    draw_set_color(c_aqua);
    
    var _txt = "ITEM: ";
    var _x_pos = 30;
    var _y_pos = 30;
    
    draw_text(_x_pos, _y_pos, _txt);
    
    var _largura_texto = string_width(_txt);
    var _sprite_x = _x_pos + _largura_texto + 10;
    var _sprite_y = _y_pos; // Alinhado com o topo do texto

    // 1. Pegamos a sprite e a escala que queremos
    var _spr = item_segurando.sprite;
    var _escala = 0.5;

    // 2. COMPENSAÇÃO DE ORIGEM
    // Multiplicamos o offset pela escala para que o ajuste seja proporcional ao tamanho reduzido
    var _ajuste_x = sprite_get_xoffset(_spr) * _escala;
    var _ajuste_y = sprite_get_yoffset(_spr) * _escala;

    // 3. Desenha somando o ajuste
    // Isso faz com que, não importa onde esteja o ponto no editor, 
    // ele desenhe como se a origem fosse no canto superior esquerdo.
    draw_sprite_ext(_spr, 0, _sprite_x + _ajuste_x, _sprite_y + _ajuste_y, _escala, _escala, 0, c_white, 1);
}