if (ganhou_nesta_sessao) {
    // Se ganhou, fecha o minigame e libera o player
    aberto = false;
    global.minigame_ativo = "nenhum";
    estado = "idling";
    ganhou_nesta_sessao = false; 
} else {
    // SE PERDEU:
    estado = "idling";
    coluna_ativa = 0;
    
    // SOLUÇÃO PROBLEMA 1: Reseta a posição dos rolos visualmente
    for (var i = 0; i < 3; i++) {
        rolos_pos[i] = 0; // Faz os rolos voltarem ao ícone inicial
        rolos_vel[i] = 0; // Garante que estão parados
    }
}