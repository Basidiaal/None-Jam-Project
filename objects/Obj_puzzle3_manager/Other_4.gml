/// @description Inicia a "Invasão"

// 1. Pegamos o caminho e trocamos as barras invertidas do Windows (\) por barras normais (/)
// Isso evita que o navegador se confunda com o caminho
var _caminho_limpo = string_replace_all(working_directory + "foto_sala.png", "\\", "/");

// 2. Abrimos usando o caminho absoluto sem forçar o protocolo manualmente, 
// ou usando apenas o nome do arquivo se ele estiver nos Included Files
if (file_exists("foto_sala.png")) {
    url_open(_caminho_limpo); 
} else {
    show_message("Erro: foto_sala.png não encontrada em: " + _caminho_limpo);
}

// 3. Minimiza o jogo
window_set_rectangle(-10000, -10000, window_get_width(), window_get_height());

// 4. Alarme para a mensagem
alarm[0] = 60;