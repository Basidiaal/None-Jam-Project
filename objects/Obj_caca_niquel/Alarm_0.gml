if (ganhou_nesta_sessao) {
    // Se ganhou, fecha o minigame e libera o player
    aberto = false;
    global.minigame_ativo = "nenhum";
    estado = "idling";
    ganhou_nesta_sessao = false; // Reset para a próxima vez que ele encontrar a máquina
} else {
    // Se não ganhou, permite jogar de novo sem fechar o popup
    estado = "idling";
    coluna_ativa = 0;
}