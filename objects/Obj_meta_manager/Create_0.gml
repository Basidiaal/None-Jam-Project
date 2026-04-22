timer_dicas = 0;
fase_da_dica = 0;

// Lógica Meta: Verifica se o jogador reiniciou o jogo
if (file_exists("save_meta.ini")) {
    ini_open("save_meta.ini");
    var reiniciou = ini_read_real("Status", "restart_feito", 0);
    ini_close();
    
    if (reiniciou == 1) {
        global.puzzle_stage = 5; // Pula para a porta final única
    }
}