if (global.pause) {
   
    exit; // Para o código aqui e não executa o que vem abaixo
} 
// Fechar o documento
if (keyboard_check_pressed(ord("E"))) {
    if (instance_exists(Obj_player)) Obj_player.ativo = true;
    instance_destroy();
}