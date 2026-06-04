if (global.pause) {
    exit;
} 
if (global.puzzle_stage == 4 && global.interacted_count >= 5) {
    timer_dicas += delta_time / 1000000; 

    if (timer_dicas >= 120 && fase_da_dica == 0) {
        show_message(Obj_main_menu.texto_dica2[Obj_main_menu.lang_index]);
        fase_da_dica = 1;
    }
    if (timer_dicas >= 240 && fase_da_dica == 1) {
        show_message(Obj_main_menu.texto_dica_final[Obj_main_menu.lang_index]);
        fase_da_dica = 2;
    }

}