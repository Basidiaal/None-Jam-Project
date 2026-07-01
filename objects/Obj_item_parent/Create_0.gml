/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
nome_exibicao = "Item";
id_item = "item_generico";

// Ajuste manual: quantos pixels do centro até o 'chão' do sprite?
// Se o seu sprite tem 32x32 e a origem é no meio (16,16), 
// o offset para o chão seria 16.
meu_offset_y = 16;

// Variável para o som de drop (coloque um som genérico como padrão)
som_drop = Snd_drop_padrao;


// No Create
minha_velocidade = image_speed;

// No Create do Objeto Pai dos Itens:
tempo_espera_drop = 2;