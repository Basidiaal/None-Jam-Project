// 1. Calcula a distância entre o centro do item e o centro do player
var _dist = point_distance(x, y, Obj_player.x, Obj_player.y);
var _fps_atual = game_get_speed(gamespeed_fps);

// 2. Verifica se o player está dentro do círculo de interação
if (_dist < raio_interacao) {
    
    // OPCIONAL: Feedback visual para o player saber que pode apertar E
    // Isso ajuda muito no "feel" do jogo
    // draw_text(x, y - 50, "PRESSIONAR E"); 

    if (keyboard_check_pressed(ord("E"))) {
        
        // --- COMPRANDO A CHAVE ---
        if (tipo == "chave") {
            if (global.fichas_atuais >= preco) {
                global.fichas_atuais -= preco;
                global.tem_chave_setor = true;
                instance_destroy(); 
            }
        }
        
        // --- RESTAURANDO FPS ---
        else if (tipo == "fps") {
            if (_fps_atual < 60) {
                if (global.fichas_atuais >= preco) {
                    global.fichas_atuais -= preco;
                    game_set_speed(60, gamespeed_fps);
                }
            }
        }
    }
}