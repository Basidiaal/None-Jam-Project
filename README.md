# Esc_ (None Jam Project)

Este é um jogo de **Escape Room Meta** desenvolvido no **GameMaker Studio 2** (versão 2.3+). O jogo mistura a resolução de quebra-cabeças clássicos com mecânicas inovadoras que interagem diretamente com o motor do jogo e com o sistema operacional do próprio jogador.

## 🎮 De que se trata o jogo?

O jogo é uma aventura de escape room recheada de elementos de quebra-cabeças e humor/hostilidade provindos de um **Antagonista** misterioso. Suas principais mecânicas incluem:

*   **Aposta de FPS (Blackjack):** Um mini-game de Blackjack onde você aposta a própria taxa de quadros (FPS) do jogo.
*   **Caça-Níquel de Frames:** Uma máquina de caça-níqueis para recuperar ou ganhar mais frames (FPS).
*   **Puzzle das 7 Diferenças:** Comparação entre o cenário em que o jogador está inserido em tempo real e uma imagem de referência estática (`datafiles/foto_sala.png`).
*   **Interações com a Área de Transferência (Clipboard):** O Antagonista desafia você a descobrir e copiar uma palavra-chave para a área de transferência do seu próprio computador (Ctrl+C) para prosseguir.
*   **Mecânicas de Meta-Jogo:** Puzzles que envolvem ações como fechar a janela do jogo (Alt+F4) ou reiniciar o jogo para liberar novos caminhos e interações (usando salvamento persistente `save_meta.ini`).
*   **Controle de Estabilidade do Sistema:** Eventos onde você precisa estabilizar o jogo a 60 FPS ou lidar com itens como o `Virus.exe` que derrubam o desempenho do jogo.
*   **Suporte a múltiplos idiomas:** Totalmente localizado em Português, Inglês e Espanhol.

---

## 🛠️ Como Executar o Projeto

Para abrir e rodar o projeto no seu computador, siga os passos abaixo:

### Pré-requisitos
*   **GameMaker Studio 2** instalado (versão compatível com a v2.3.0 ou superior).

### Passo a Passo

1.  **Clonar ou baixar o repositório:** Certifique-se de que todos os arquivos do projeto estão em uma pasta local.
2.  **Abrir o GameMaker Studio 2:**
    *   Abra o GameMaker.
    *   Selecione **Open Project** (Abrir Projeto).
    *   Navegue até a pasta do projeto e selecione o arquivo principal: **`None-Jam-Project.yyp`**.
3.  **Executar o Jogo (Play):**
    *   No canto superior esquerdo ou no topo da tela do GameMaker, certifique-se de que o alvo de compilação (Target) está configurado para **Test** ou **Windows** (VM ou YYC).
    *   Pressione **F5** no teclado ou clique no botão de **Play** (triângulo verde) na barra de ferramentas superior para compilar e iniciar o jogo.

---

## 📂 Estrutura Principal do Projeto

*   **`None-Jam-Project.yyp`**: Arquivo principal de definição do projeto do GameMaker.
*   **`objects/`**: Contém todos os objetos de lógica do jogo (como o jogador, portais, gerência de blackjack, menus e meta-puzzles).
*   **`rooms/`**: Contém as fases do jogo, iniciando por `rm_init` (inicialização), `rm_main_menu` (menu principal) e as salas de puzzle.
*   **`scripts/`**: Código e funções GML reutilizáveis (como lógica de blackjack, banco de dados de itens e atualizações de idiomas).
*   **`sprites/` & `sounds/`**: Recursos visuais e sonoros do jogo.
*   **`datafiles/`**: Contém arquivos externos usados em tempo de execução, como o mapa/foto da sala de referências.
