image_speed = 0;

// ... Seus códigos anteriores do Create do Pedestal ...
estado = "bloqueado"; 
image_speed = 0;
image_index = 0;



// --- NOVA CHECAGEM DE SALA DIFERENTE ---
// Se o jogador já resolveu o puzzle em outra sala antes de entrar aqui:
if (global.puzzle_resolvido) {
    estado = "disponivel";
    image_speed = 0;
    image_index = image_number - 2; // Nasce parado no frame dele Aberto com o Item!
}