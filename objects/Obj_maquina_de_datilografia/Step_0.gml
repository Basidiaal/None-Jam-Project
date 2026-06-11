// Se o jogador estiver na sala certa, o objeto fica visível e ativo
if (room == sala_original) {
    visible = true;
} else {
    // Se mudou de sala, ele fica invisível para não assombrar o cenário
    visible = false;
}