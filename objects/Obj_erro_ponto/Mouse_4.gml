if (global.pause) {
    
    exit; // Para o código aqui e não executa o que vem abaixo
} 
if (!clicado) {
    clicado = true;
    global.erros_clicados[meu_id] = true;
    global.erros_encontrados += 1;
    

}