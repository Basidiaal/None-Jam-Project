// Se o jogador chegar perto e apertar E
if (place_meeting(x, y, Obj_player) && keyboard_check_pressed(ord("E"))) {
    // Cria o visualizador e passa as informações para ele
    var _inst = instance_create_layer(0, 0, "Instances", Obj_documento_view);
    _inst.texto = texto_documento;
    _inst.sprite_fundo = sprite_documento;
 
    // Trava o jogador
    if (instance_exists(Obj_player)) Obj_player.ativo = false;
}