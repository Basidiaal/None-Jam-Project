// 1. Muda o sprite para mostrar a escada consertada (muda de frame ou muda o sprite inteiro)
image_index = 1; // Supondo que o Frame 0 é quebrada e o Frame 1 é consertada

// Opcional: se forem sprites totalmente diferentes, use:
// sprite_index = Spr_escada_consertada;

// 2. Destrava o teleporte que está posicionado em cima desta escada específica
// Usamos instance_nearest para encontrar o gatilho de teleporte mais próximo
var _gatilho = instance_nearest(x, y, obj_escada_teleporte);
if (_gatilho != noone) {
    _gatilho.esta_trancada = false; // Libera o teleporte!
}

// 3. Marca como ativado para evitar que gaste mais itens se o player interagir de novo
ativado = true; 

// Opcional: Toque um som de martelada/madeira quebrando
// audio_play_sound(Snd_conserto_escada, 10, false);