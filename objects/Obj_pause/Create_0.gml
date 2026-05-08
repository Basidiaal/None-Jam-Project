menu_state = "main"; 
index = 0;

// Definição das traduções [Português, Inglês, Espanhol]
// Organize na mesma ordem que as opções aparecem
options_traducoes = [
    ["Retomar", "Resume", "Reanudar"],           // index 0
    ["Configurações", "Settings", "Ajustes"],   // index 1
    ["Sair", "Quit", "Salir"],                   // index 2
    ["Resolução", "Resolution", "Resolución"],   // index 3
    ["Tela Cheia", "Fullscreen", "Pantalla Completa"], // index 4
    ["Volume Geral", "Master Volume", "Volumen General"], // index 5
    ["Música", "Music", "Música"],               // index 6
    ["Efeitos", "SFX", "Efectos"],               // index 7
    ["Voltar", "Back", "Volver"]                 // index 8
];

// Listas de índices para cada menu
// Isso aponta para qual linha da 'options_traducoes' cada menu usa
main_indices = [0, 1, 2];
settings_indices = [3, 4, 5, 6, 7, 8];

// Palavras soltas
txt_sim = ["SIM", "YES", "SI"];
txt_nao = ["NÃO", "NO", "NO"];