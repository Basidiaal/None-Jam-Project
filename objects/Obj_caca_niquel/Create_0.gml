aberto = false;
estado = "idling"; // idling, rodando, resultado
coluna_ativa = 0;
base_vel = 12; // Velocidade fixa do primeiro rolo
ganhou_nesta_sessao = false;

// Multiplicadores de velocidade (Exemplos para você testar)
// Ícone 0 (5 FPS): Vel 2 = base * 1.0, Vel 3 = base * 1.0
// Ícone 5 (30 FPS): Vel 2 = base * 2.0, Vel 3 = base * 4.0
mult_v2 = [1.0, 1.5, 1.8, 2.0, 2.5, 3.0]; // Ajuste o 1.5, 1.8... conforme desejar
mult_v3 = [1.0, 1.8, 2.2, 3.0, 4.0, 5.0]; 

for (var i = 0; i < 3; i++) {
    rolos_pos[i] = 0;
    rolos_vel[i] = 0;
}