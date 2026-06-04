// Pega o que o jogador digita
texto_atual = keyboard_string;

if (keyboard_check_pressed(vk_enter)) {
    var _esperado = string(global.terminal_alvo_w) + "x" + string(global.terminal_alvo_h);
    
    if (texto_atual == _esperado) {
        show_message("SUCESSO: Padrão reconhecido.");
        global.bloco_resolvido[global.terminal_bloco_id] = true;
        scr_set_resolution(global.terminal_alvo_w, global.terminal_alvo_h);
    } else {
        show_message("ERRO: Resolução inválida.");
    }
    instance_destroy(); // Fecha a telinha
}