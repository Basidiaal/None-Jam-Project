draw_self();

// 1. Criamos uma variável para checar se o player está segurando o item correto.
// Substitua "Id_da_Chave_ou_Tabua" pelo id_unico ou nome do item que tranca/destranca essa porta
var _tem_o_item = (Obj_inventory.item_segurando != noone && Obj_inventory.item_segurando.id_unico == "chave_porta_trancada");

// 2. A condição para desenhar o prompt:
// SE a porta NÃO estiver trancada...
// OU SE ela estiver trancada, mas o jogador tiver o item na mão:
if (!trancada || (trancada && _tem_o_item)) {
    
    // 3. Só avança se o player estiver encostando nela
    if (place_meeting(x, y, Obj_player)) {
        
        draw_set_halign(fa_center);
        draw_set_font(Fnt_puzzle_portas); // Garante a fonte padrão
        draw_set_color(c_white);
        
        // Desenha o prompt [E] acima da porta
        draw_text(x, y - 150, "[E]");
    }
}