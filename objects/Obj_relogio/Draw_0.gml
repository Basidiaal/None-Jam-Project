draw_self(); // Desenha o relógio com seus respectivos ponteiros

// Mostra o prompt [E] se o player tiver um ponteiro útil na mão
if (place_meeting(x, y, Obj_player)) {
    var _inv = Obj_inventory;
    var _item = _inv.item_segurando;
    
    if (_item != noone) {
        var _mostrar_prompt = false;
        
        if (_item.id_unico == "ponteiro_horas"   && !tem_horas)   _mostrar_prompt = true;
        if (_item.id_unico == "ponteiro_minutos" && !tem_minutos) _mostrar_prompt = true;
        
        if (_mostrar_prompt) {
            draw_set_halign(fa_center);
            draw_text(x + 27, bbox_top - 60, "[E]");
        }
    }
}