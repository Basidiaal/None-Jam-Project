randomize();

if (exibindo_sequencia) {
    timer_sequencia++;

    if (timer_sequencia >= tempo_cada_frame) {
        timer_sequencia = 0;
        indice_exibicao++;
        
        // Se já mostrou as 4 cores (0, 1, 2, 3), desliga a tela
        if (indice_exibicao > 3) {
            exibindo_sequencia = false;
            indice_exibicao = 0; // Reseta para a próxima vez
        }
    }
}

// ... mantenha sua lógica original de avanço de nível abaixo ...

// Lógica de Avanço de Nível (MANTENHA A SUA ORIGINAL)
if (passo_p1 == 4 && passo_p2 == 4) {
    if (nivel_atual < 3) {
        nivel_atual += 1;
        passo_p1 = 0;
        passo_p2 = 0;
        array_shuffle_ext(sequencia);
    } else {
        puzzle_completo = true;
    }
}
