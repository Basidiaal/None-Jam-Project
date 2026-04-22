// Sistema de Dicas Progressivas (A cada 2 minutos)
if (global.puzzle_stage == 4 && global.interacted_count >= 5) {
    timer_dicas += delta_time / 1000000; 

    if (timer_dicas >= 120 && fase_da_dica == 0) {
        show_message("Dica 1: O sistema parece travado em um loop... você já tentou 'rebootar'?");
        fase_da_dica = 1;
    }
    if (timer_dicas >= 240 && fase_da_dica == 1) {
        show_message("Dica 2: A saída não aparecerá enquanto este processo estiver ativo.");
        fase_da_dica = 2;
    }
    if (timer_dicas >= 360 && fase_da_dica == 2) {
        show_message("Dica Final: Feche o jogo e abra-o novamente para quebrar o ciclo.");
        fase_da_dica = 3;
    }
}