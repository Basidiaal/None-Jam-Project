// 1. Desenha o próprio sprite da estátua (que atualiza o frame pelo image_index no Step)
draw_self();



// 3. Checa o item que o jogador está segurando
var _item = Obj_inventory.item_segurando;
var _mostrar_prompt = false;

// Se a estátua já terminou de se mover ou está se movendo, NUNCA mostra o prompt
if (!movendo && (x < x_alvo)) {
    if (_item != noone) {
        // O prompt [E] SÓ aparece se o jogador tiver a peça certa E a estátua ainda NÃO tiver essa peça encaixada
        if (_item.id_unico == "peca_cabeca" && !tem_cabeca) { _mostrar_prompt = true; }
        if (_item.id_unico == "peca_braco"  && !tem_braco)  { _mostrar_prompt = true; }
        if (_item.id_unico == "peca_perna"  && !tem_perna)  { _mostrar_prompt = true; }
    }
}

// 4. Desenha o prompt se a condição for verdadeira e o player estiver encostando
if (_mostrar_prompt) {
    var _dist = place_meeting(x, y, Obj_player);
    if (_dist) {
        draw_set_halign(fa_center);
        draw_set_font(Fnt_puzzle_portas); // Mantém a sua fonte padronizada
        draw_set_color(c_white);
        
        // Desenha o [E] na altura calculada dinamicamente
        draw_text(x + 51, y - 25, "[E]");
    }
}