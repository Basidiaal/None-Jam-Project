// Timers de Feedback (V, X, Concluído)
if (feedback_p1_timer > 0) feedback_p1_timer--; else feedback_p1_tipo = 0;
if (feedback_p2_timer > 0) feedback_p2_timer--; else feedback_p2_tipo = 0;

// Lógica da Intro (Fase 1, 2, 3)
if (exibindo_intro) {
    timer_intro++;
    if (timer_intro >= tempo_cada_intro) {
        exibindo_intro = false;
        intro_mostrada = true; // Marca que já viu a intro deste nível
        
        // Inicia a sequência automaticamente após a intro
        exibindo_sequencia = true;
        timer_sequencia = 0;
        indice_exibicao = 0;
    }
}

// Carrossel da Sequência
if (exibindo_sequencia) {
    timer_sequencia++;
    if (timer_sequencia >= tempo_cada_frame) {
        timer_sequencia = 0;
        indice_exibicao++;
        if (indice_exibicao > 3) {
            exibindo_sequencia = false;
            indice_exibicao = 0;
        }
    }
}

// Avanço de Nível e Feedback de Conclusão
if (passo_p1 == 4 && passo_p2 == 4) {
    // Ativa feedback de "Fase Concluída" nas duas telas
    feedback_p1_tipo = 3; 
    feedback_p1_timer = 120;
    feedback_p2_tipo = 3;
    feedback_p2_timer = 120;

    if (nivel_atual < 3) {
        nivel_atual += 1;
        passo_p1 = 0;
        passo_p2 = 0;
        intro_mostrada = false; // Reset para mostrar a intro da PRÓXIMA fase
        array_shuffle_ext(sequencia);
    } else {
        puzzle_completo = true;
    }
}