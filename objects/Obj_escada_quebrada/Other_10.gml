// 1. Muda o sprite para o frame consertado
image_index = 1; 

// 2. Destrava o teleporte mais próximo
var _gatilho = instance_nearest(x, y, Obj_escada_teleporte);
if (_gatilho != noone) {
    _gatilho.esta_trancada = false; 
}

// 3. Marca como ativado
ativado = true; 

// =======================================================
// A SOLUÇÃO: Limpa o input do teclado deste frame.
// Isso impede que o obj_escada_teleporte leia o "E" agora!
// =======================================================
io_clear();