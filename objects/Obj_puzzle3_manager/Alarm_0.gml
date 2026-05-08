// Dentro do evento Alarm 0
if (global.pause) {
    alarm[0] = 1; // Adia o alarme para o próximo frame
    exit;         // Sai e não executa o código de ataque/interação agora
}
/// @description Mensagem sobre o navegador
show_message(Obj_main_menu.texto_instrucao[Obj_main_menu.lang_index]);