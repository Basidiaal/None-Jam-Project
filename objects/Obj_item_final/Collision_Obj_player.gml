/// @desc Coleta o item e volta ao normal
if (keyboard_check_pressed(ord("E"))) {
    global.item_coletado = true;

    // 1. Cria o glitch e avisa que é para DESATIVAR
    var _inst = instance_create_layer(x, y, "Instances", Obj_glitch_split);
    _inst.tipo = "desativar";

    // 2. Destrói o item
    instance_destroy();
}