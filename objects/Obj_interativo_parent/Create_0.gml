/// @desc Variáveis Base de Interação

// O "RG" do item que o jogador precisa estar segurando para ativar este objeto.
// Ex: "chave_bronze", "fusivel_energia", etc.
id_necessario = ""; 

// Define se o item deve sumir da mão do jogador após o uso.
// true = some (ex: fusível, consumível), false = fica (ex: cartão de acesso).
consumivel = false;

// Controle para saber se o objeto já foi acionado (evita repetir animações/sons).
ativado = false;

// Mantém o sprite parado no primeiro frame (útil para objetos com estados 'fechado/aberto').
image_speed = 0;
image_index = 0;