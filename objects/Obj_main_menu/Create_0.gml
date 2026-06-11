global.puzzle_resolvido = false
if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}
// Controle de Navegação
index = 0;
menu_state = "main"; // Estados: "main", "settings", "credits"

// Listas de Opções
options_main = ["Iniciar Jogo", "Idioma", "Configurações", "Créditos", "Sair"];
options_settings = ["Resolução", "Tela Cheia", "Volume Geral", "Música", "Efeitos", "Voltar"];

// Sistema de Idioma
langs = ["Português", "English", "Español"];


// Configuração da Rede Social (YouTube)
social_sprite = Spr_instagram; // Substitua pelo seu sprite
social_url = "https://www.instagram.com/__kaio707/";








// 0 = Português, 1 = Inglês, 2 = Espanhol
lang_index = 0; 


// Criamos uma matriz: [ID_DO_TEXTO, IDIOMA]
// Texto de Iniciar
texto_iniciar[0] = "INICIAR JOGO";
texto_iniciar[1] = "START GAME";
texto_iniciar[2] = "INICIAR JUEGO";

// Texto de Configurações
texto_config[0] = "CONFIGURAÇÕES";
texto_config[1] = "SETTINGS";
texto_config[2] = "CONFIGURACIÓN";

// Texto de Idioma (o nome da opção)
texto_idioma_label[0] = "IDIOMA";
texto_idioma_label[1] = "LANGUAGE";
texto_idioma_label[2] = "IDIOMA";

texto_creditos[0] = "CRÉDITOS";
texto_creditos[1] = "CREDITS";
texto_creditos[2] = "CRÉDITOS";

texto_sair[0] = "SAIR"
texto_sair[1] = "EXIT";
texto_sair[2] = "SALIR";

texto_resolucao[0] = "RESOLUÇÃO";
texto_resolucao[1] = "RESOLUTION";
texto_resolucao[2] = "RESOLUCIÓN";

texto_tela[0] = "TELA CHEIA";
texto_tela[1] = "FULL SCREEN";
texto_tela[2] = "PANTALLA COMPLETA";

texto_volume_geral[0] = "VOLUME GERAL";
texto_volume_geral[1] = "MASTER VOLUME";
texto_volume_geral[2] = "VOLUMEN GENERAL";

texto_musica[0] = "MÚSICA";
texto_musica[1] = "MUSIC";
texto_musica[2] = "MÚSICA";

texto_efeitos[0] = "SFX";
texto_efeitos[1] = "SFX";
texto_efeitos[2] = "SFX";

texto_voltar[0] = "VOLTAR";
texto_voltar[1] = "BACK";
texto_voltar[2] = "ATRÁS";

texto_chave[0] = "Chave";
texto_chave[1] = "Key";
texto_chave[2] = "Llave";

texto_jogar_blackjack[0] = "Jogar Blackjack?";
texto_jogar_blackjack[1] = "Play Blackjack?";
texto_jogar_blackjack[2] = "Jugar al Blackjack";

texto_aposta[0] = "Quanto FPS deseja apostar?"
texto_aposta[1] = "How many FPS do you want to bet on?"
texto_aposta[2] = "A cuántos FPS quieres apostar?"

texto_pedir[0] = "H (PEDIR)";
texto_pedir[1] = "H (HIT)";
texto_pedir[2] = "H (PEDIR)";

texto_manter[0] = "S (MANTER)";
texto_manter[1] = "S (STAND)";
texto_manter[2] = "S (MANTENER)";

texto_continuar[0] = "CONTINUAR";
texto_continuar[1] = "CONTINUE";
texto_continuar[2] = "CONTINUAR";

texto_soma[0] = "Sua Soma:";
texto_soma[1] = "Your Sum:";
texto_soma[2] = "Su Suma:";

texto_vitoria[0] = "Vitória! + "
texto_vitoria[1] = "Victory! + "
texto_vitoria[2] = "Victoria! + "

texto_fichas[0] = " Fichas.";
texto_fichas[1] = " Chips.";
texto_fichas[2] = " Fichas.";

texto_derrota[0] = "Derrota! Você perdeu ";
texto_derrota[1] = "Defeat! You lost";
texto_derrota[2] = "Derrota! Has perdido ";

texto_fps_insuficiente[0] = "FPS insuficiente! Reabasteça no Caça-Níquel";
texto_fps_insuficiente[1] = "Insufficient FPS! Refill at the Slot Machine.";
texto_fps_insuficiente[2] = "FPS insuficiente! Recarga en la Tragamonedas.";

texto_empate[0] = "Empate";
texto_empate[1] = "Draw";
texto_empate[2] = "Empate";

texto_recuperar_fps[0] = "[E] RECUPERAR\nFPS"
texto_recuperar_fps[1] = "[E] RECOVER\nFPS"
texto_recuperar_fps[2] = "[E] RECUPERAR\nFPS"

texto_alvo[0] = "ALVO :";
texto_alvo[1] = "TARGET :";
texto_alvo[2] = "BLANCO :";

texto_sobrecarga[0] = "!!! SOBRECARGA CRÍTICA !!!";
texto_sobrecarga[1] = "!!! OVERCLOCK CRITICAL !!!";
texto_sobrecarga[2] = "!!! SOBRECARGA CRÍTICA !!!";

texto_sincronizacao_concluida[0] = "SINCRONIZAÇÃO CONCLUÍDA";
texto_sincronizacao_concluida[1] = "SYNC COMPLETE";
texto_sincronizacao_concluida[2] = "SINCRONIZACIÓN COMPLETADA";

texto_sincronizacao_falhou[0] = "SINCRONIZAÇÃO FALHOU";
texto_sincronizacao_concluida[1] = "SYNC FAILED";
texto_sincronizacao_concluida[2] = "SINCRONIZACIÓN FALLIDA";

texto_ativar[0] = "[E] LIGAR CAÇA-NÍQUEL"
texto_ativar[1] = "[E] TURN ON THE SLOT MACHINE"
texto_ativar[2] = "[E] ENCEDE LA TRAGAMONEDAS"

texto_sair2[0] = "[ESC] PARA SAIR" 
texto_sair2[1] = "[ESC] TO EXIT"
texto_sair2[2] = "[ESC] PARA SALIR"

texto_falta_chave_e_fps[0] = "FPS BAIXO E CARTÃO DE \nACESSO NECESSÁRIA.";
texto_falta_chave_e_fps[1] = "LOW FPS AND KEYCARD REQUIRED.";
texto_falta_chave_e_fps[2] = "FPS BAJO Y SE REQUIERE \nTARJETA DE ACESSO.";


texto_falta_chave[0] = "CARTÂO DE ACESSO NECESSÁRIO.";
texto_falta_chave[1] = "KEYCARD REQUIRED.";
texto_falta_chave[2] = "REQUIERE TARJETA DE ACESSO.";

texto_falta_fps[0] = "ESTABILIZE EM 60 FPS";
texto_falta_fps[1] = "STABILIZE AT 60 FPS";
texto_falta_fps[2] = "ESTABILIZAR EN 60 FPS";

texto_item_liberado[0] = "ACESSO CONCEDIDO, UM ITEM FOI LIBERADO";
texto_item_liberado[1] = "ACESS GRANTED, AN ITEM HAS BEEN UNLOCKED";
texto_item_liberado[2] = "ACCESO CONCEDIDO, SE HA DESBLOQUEADO UN OBJETO";

texto_dica1[0] = "Dica 1:  a oportunidade é como uma JANELA as vezes a JANELA precisa \nser FECHADA para uma porta ser aberta.";
texto_dica1[1] = "Tip 1: Opportunity is like a WINDOW. Sometimes the WINDOW needs \nto be CLOSED for a door to open.";
texto_dica1[2] = "Consejo 1: La oportunidad es como una VENTANA. A veces la VENTANA \ndebe ser CERRADA para que una puerta se abra.";

texto_dica2[0] = "Dica 2: JANELA... FECHADA...";
texto_dica2[1] = "Tip 2: WINDOW... CLOSED...";
texto_dica2[2] = "Pista 2: VENTANA... CERRADA...";

texto_dica_final[0] = "Dica Final: aperte alt+f4 e veja a mágica acontecer.";
texto_dica_final[1] = "Final Tip: press Alt+F4 and see the magic happen.";
texto_dica_final[2] = "Consejo Final: presiona Alt+F4 y mira cómo sucede la magia.";

porta_trancada[0] = "Caminho bloqueado. Resolva o Puzzle.";
porta_trancada[1] = "Path blocked. Solve the puzzle.";
porta_trancada[2] = "Camino bloqueado.Resuelve el puzzle";

texto_instrucao[0] = "Encontre as 7 diferenças da sala em que VOCÊ está \ncomparado a imagem que você recebeu.";
texto_instrucao[1] = "Find the 7 differences between the room YOU are in \nand the image you received.";
texto_instrucao[2] = "Encuentra las 7 diferencias entre la habitación \nen la que TÚ estás y la imagen que recibiste.";

texto_instrucao2[0] = "Porta bloqueada. Resolva o puzzle no bilhete \nao lado da porta.";
texto_instrucao2[1] = "Door blocked. Solve the puzzle on the note \nnext to the door.";
texto_instrucao2[2] = "Puerta bloqueada. Resuelve el acertijo en la \nnota al lado de la puerta.";

texto_advertencia[0] = "O ANTAGONISTA: O que é isso que você está carregando?";
texto_advertencia[1] = "THE ANTAGONIST: What is that you are carrying?";
texto_advertencia[2] = "EL ANTAGONISTA: ¿Qué es eso que estás cargando?"

texto_nao_e_a_chave[0] = " não é a chave...";
texto_nao_e_a_chave[1] = "it is not the key...";
texto_nao_e_a_chave[2] = "no es la llave..."

texto_palavra_chave_errada[0] = "O ANTAGONISTA:Sua Área de transferência está vazia, \nserá que você entendeu mesmo o puzzle? seu idiota. encontre a palavra chave"
texto_palavra_chave_errada[1] = "THE ANTAGONIST: Your clipboard is empty. Did you actually \nunderstand the puzzle? You idiot. Find the keyword.";
texto_palavra_chave_errada[2] = "EL ANTAGONISTA: Tu portapapeles está vacío. ¿De verdad \nentendiste el acertijo? Idiota. Encuentra la palabra clave.";

texto_palavra_chave_certa[0] = "O ANTAGONISTA: Palavra chave correta. Parece que você tem cerebro afinal .";
texto_palavra_chave_certa[1] = "THE ANTAGONIST: Correct keyword. It seems you have a brain after all.";
texto_palavra_chave_certa[2] = "EL ANTAGONISTA: Palabra clave correcta. Parece que después de todo sí tienes cerebro.";

texto_pressione_e[0] = "Pressione E para fechar";
texto_pressione_e[1] = "Press E to close";
texto_pressione_e[2] = "Presiona E para cerrar";

texto_sistema[0] = "SISTEMA ESTÁVEL";
texto_sistema[1] = "SYSTEM STABLE";
texto_sistema[2] = "SISTEMA ESTABLE";

sprite_texto[0] = Spr_documento_gui;
sprite_texto[1] = Spr_documento_gui_1;
sprite_texto[2] = Spr_documento_gui_2;

// ... e assim por diante para Créditos, Sair, Voltar, etc.
Scr_atualizar_textos()