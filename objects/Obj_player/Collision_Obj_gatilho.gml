/// @desc Ativa o P2 com Glitch
if (!instance_exists(Obj_player_2)) {
    // 1. Cria o objeto de efeito que vai cuidar de tudo
    instance_create_layer(x, y, "Instances", Obj_glitch_split);
    
    // 2. Cria o Player 2 na posição do puzzle dele
    instance_create_layer(400, 300, "Instances", Obj_player_2);
}