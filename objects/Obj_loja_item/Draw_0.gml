
// 1. Desenha o sprite do item (Chave ou FPS)
draw_self(); 


// 2. Lógica de proximidade para mostrar os textos
var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);

if (_dist < raio_interacao) {
    draw_set_halign(fa_center);
    
    // Mostra o nome definido lá no Variable Definitions
    draw_set_color(c_white);
    draw_text(x, y - 55, nome_item); 

    // Lógica de cor do preço que fizemos antes...
    var _cor_preco = (global.fichas_atuais >= preco) ? c_yellow : c_red;
    
    // Se for FPS e já estiver em 60, muda a mensagem
    if (tipo == "fps" && game_get_speed(gamespeed_fps) >= 60) {
        draw_set_color(c_lime);
        draw_text(x, y - 35, "SISTEMA ESTÁVEL");
    } else {
        draw_set_color(_cor_preco);
        draw_text(x, y - 35, string(preco) + " FICHAS");
    }
}