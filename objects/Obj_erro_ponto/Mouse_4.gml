if (!clicado && meu_id != -1) {
    if (!global.erros_clicados[meu_id]) {
        clicado = true;
        global.erros_clicados[meu_id] = true;
        global.erros_encontrados += 1;
       

        // Opcional: Criar um efeito visual no local
      
    }
}