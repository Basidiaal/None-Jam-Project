draw_self();
// Feedback de interação por colisão lateral
if (place_meeting(x, y, Obj_player)) {
    draw_set_halign(fa_center);
    draw_text(x, y - (sprite_height + 10), "[E] INTERAGIR");
}