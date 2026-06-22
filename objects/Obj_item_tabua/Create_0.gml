// 1. Garante que ele puxe qualquer código padrão que esteja no Create do pai
event_inherited(); 

// 2. Configura as informações exclusivas deste item
nome_exibicao = "Tábua de Madeira"; // O texto que vai aparecer na GUI do inventário
id_item = "tabua";                 // IMPORTANTE: Tem que ser EXATAMENTE igual ao "id_necessario" da escada

// 3. Ajustes de Game Feel baseados no seu Sprite
meu_offset_y = 16;                 // Altere se a origem do sprite da tábua não for no meio/centro
som_drop = Snd_drop_madeira;       // Coloque o som dele caindo no chão (se tiver um específico)