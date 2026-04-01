// Tela do Player 1 (Sempre olha para o passo_p1)
if (passo_p1 < 4) {
    var _cor_p1 = sequencia[passo_p1];
    if (nivel_atual == 1) Obj_tela.image_index = _cor_p1;     // Mostra Cor
    if (nivel_atual == 2) Obj_tela.image_index = _cor_p1 + 4; // Mostra Nome
    if (nivel_atual == 3) Obj_tela.image_index = _cor_p1 + 8; // Mostra Stroop
} else {
    Obj_tela.image_index = 12; // Frame de "OK" ou "Aguardando Parceiro"
}

// Tela do Player 2 (Sempre olha para o passo_p2)
if (passo_p2 < 4) {
    var _cor_p2 = sequencia[passo_p2];
    if (nivel_atual == 1) Obj_tela.image_index = _cor_p2 + 4; // Mostra Nome
    if (nivel_atual == 2) Obj_tela.image_index = _cor_p2;     // Mostra Cor
    if (nivel_atual == 3) Obj_tela.image_index = _cor_p2 + 8; // Mostra Stroop
} else {
    Obj_tela.image_index = 12; // Frame de "OK"
}

// Lógica de Avanço de Nível: Ambos terminaram seus 4 passos?
if (passo_p1 == 4 && passo_p2 == 4) {
    if (nivel_atual < 3) {
        nivel_atual += 1;
        passo_p1 = 0;
        passo_p2 = 0;
        array_shuffle_ext(sequencia);
      
    } else {
        puzzle_completo = true; // Fim do desafio!
    }
}