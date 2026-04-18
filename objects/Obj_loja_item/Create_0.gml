// Definido na aba 'Variables' da Room ou aqui:
//nome_item = "Chave" ou "Restaurar Sistema"
// tipo = "chave" ou "fps"
// preco = 50 ou 20
raio_interacao = 70; // Define o tamanho da "aura" de toque
// Se a chave já foi comprada em algum momento, ela nem deve aparecer
if (tipo == "chave" && global.tem_chave_setor) {
    instance_destroy();
}

// Define o sprite baseado no tipo que você escreveu no Variable Definitions
if (tipo == "chave") {
    sprite_index = Spr_chave;
   // mask_index = Spr_chave; // Garante que a colisão use essa forma
} else if (tipo == "fps") {
    sprite_index = Spr_fps;
   // mask_index = Spr_fps;
}