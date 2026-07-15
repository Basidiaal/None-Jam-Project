// 1. Garante que ele puxe qualquer código padrão que esteja no Create do pai
event_inherited(); 
frame_da_mao = 0;
// 2. Configura as informações exclusivas deste item
nome_exibicao = "Tábua"; // O texto que vai aparecer na GUI do inventário
id_item = "tabua";                 // IMPORTANTE: Tem que ser EXATAMENTE igual ao "id_necessario" da escada

// 3. Ajustes de Game Feel baseados no seu Sprite
// Em vez de usar a posição do player aqui, use um valor fixo de game feel.
// Esse valor representa quantos pixels a tábua deve subir ou descer em relação 
// ao ponto exato onde ela foi jogada.
meu_offset_y = -16; // Tente iniciar com 0 ou a metade da altura da sprite da tábua (ex: 16)

// Altere se a origem do sprite da tábua não for no meio/centro
//som_drop = Snd_drop_madeira;       // Coloque o som dele caindo no chão (se tiver um específico)