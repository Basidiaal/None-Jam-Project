global.pause = false;
// --- PARTE 1: GERENCIAR VISIBILIDADE E POSIÇÃO ---
var _total = instance_number(Obj_porta);

for (var i = 0; i < _total; i++;) {
    var _inst = instance_find(Obj_porta, i);
    
    var _limite = 0;
    if (global.puzzle_stage == 1) _limite = 2;
    else if (global.puzzle_stage == 2) _limite = 3;
    else if (global.puzzle_stage == 3) _limite = 4;
    else if (global.puzzle_stage == 4) _limite = 5;
    else if (global.puzzle_stage == 5) _limite = 1;

    // Se o ID da porta for maior que o permitido no estágio, ela some
    if (_inst.door_id > _limite) {
        _inst.visible = false; 
        _inst.x = -2000; 
    } else {
        _inst.visible = true;
        _inst.x = _inst.xstart; // Devolve para o lugar original
        _inst.image_blend = c_white; // Reseta cor (caso tenha ficado vermelha no erro)
        _inst.ja_clicou = false;    // Reseta o clique para o novo estágio
    }
}

// --- PARTE 2: DEFINIR QUAL É A REAL (O código que você perguntou) ---
with(Obj_porta) {
    is_real_door = false; // Resetamos todas para falso primeiro

    if (global.puzzle_stage == 1) {
        if (door_id == 2) is_real_door = true; 
    }
    else if (global.puzzle_stage == 2) {
        if (door_id == 1) is_real_door = true; 
    }
    else if (global.puzzle_stage == 3) {
        if (door_id == 4) is_real_door = true; 
    }
    // No Stage 4, o código pula as condições e todas continuam FALSE (correto!)
    
    else if (global.puzzle_stage == 5) {
        is_real_door = true; 
    }
}