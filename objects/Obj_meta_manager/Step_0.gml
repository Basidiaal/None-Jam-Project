// Sistema de Dicas Progressivas (A cada 2 minutos)
if (global.puzzle_stage == 4 && global.interacted_count >= 5) {
    timer_dicas += delta_time / 1000000; 

    if (timer_dicas >= 120 && fase_da_dica == 0) {
        show_message("Dica 2: JANELA... FECHADA...");
        fase_da_dica = 1;
    }
    if (timer_dicas >= 240 && fase_da_dica == 1) {
        show_message("Dica Final: aperte alt+f4 e veja a mágica acontecer.");
        fase_da_dica = 2;
    }

}