// Verifica se pressionou E e está colidindo, aplicando o efeito específico de Sala_7 antes do parent destruir o objeto
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    if (room == Sala_7 && instance_exists(Obj_gatilho)) {
        // Cria o glitch e avisa que é para DESATIVAR
        var _inst = instance_create_layer(x, y, "Instances", Obj_glitch_split);
        _inst.tipo = "desativar";
        
        // Destrói o gatilho rosa e libera o caminho
        instance_destroy(Obj_gatilho);
        global.liberar_caminho = true;
    }
}

// Executa a lógica de coleta padrão do pai (que lida com animação de pegar no chão/alto e inventory)
event_inherited();