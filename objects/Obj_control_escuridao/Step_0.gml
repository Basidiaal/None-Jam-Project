if (deve_sumir) {
    if (escuridao_alfa > 0) {
        escuridao_alfa -= 0.1; // Altere esse valor para mudar a velocidade (menor = mais lento)
    } else {
        instance_destroy(); // Destrói o objeto de vez quando sumir por completo para economizar memória
    }
}