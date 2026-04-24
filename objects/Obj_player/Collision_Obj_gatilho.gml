/// @desc Ativa o P2 com Glitch
if (!instance_exists(Obj_player_2)) {
    // 1. Cria o glitch e avisa que é para ATIVAR
    var _inst = instance_create_layer(x, y, "Instances", Obj_glitch_split);
    _inst.tipo = "ativar"; 
    
    // 2. Cria o Player 2 na posição do puzzle
    instance_create_layer(11100, 300, "Instances", Obj_player_2);
}