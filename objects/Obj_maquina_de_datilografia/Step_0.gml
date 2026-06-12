// Se o jogador estiver na sala certa, o objeto fica visível e ativo
// RESTRUTURADO: Controla apenas se o sprite do cenário deve aparecer, 
// sem desligar os eventos de desenho da GUI.

if (room == sala_original) {
    // Na sala original, usamos a sprite normal da máquina
    sprite_index = Spr_maquina_de_datilografia; // Substitua pelo nome real da sua sprite de máquina se for diferente
} else {
    // Nas outras salas, transformamos a sprite em "nada" para sumir do cenário
    sprite_index = -1; 
	mask_index = -1;
}