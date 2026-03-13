// Fechar o documento
if (keyboard_check_pressed(vk_enter)) {
    if (instance_exists(Obj_player)) Obj_player.ativo = true;
    instance_destroy();
}