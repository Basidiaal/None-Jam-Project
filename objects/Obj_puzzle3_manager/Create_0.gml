global.target_x = -1;
global.target_y = -1;

// Inicialização do Estado
global.erros_encontrados = 0;
global.total_erros = 7;
for (var i = 0; i < 7; i++) global.erros_clicados[i] = false;

// Configuração de Dicas (2 minutos = 7200 frames a 60fps)
timer_dica = 0;
dica_limite = 7200; 
sequencia_dicas = 0; // Para não repetir a mesma dica

// Mensagens de Dica
mensagens_dica = [
/*
    "DICA 1: Compare a foto com o que você vê agora. Algo está faltando... ou sobrando.",
    "DICA 2: A foto foi tirada antes de você entrar nesta sala.",
    "DICA FINAL: Você é a única coisa que não pertence a esta imagem. Clique em si mesmo."
*/
];