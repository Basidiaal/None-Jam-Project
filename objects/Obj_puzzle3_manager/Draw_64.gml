// HUD Simples
draw_set_font(Fnt_puzzle_portas);
draw_set_color(c_white);
draw_set_halign(fa_left);

var _txt = "Erros: " + string(global.erros_encontrados) + " / 7";
draw_text(30, 30, _txt);

if (global.erros_encontrados == 6) {
    draw_set_color(c_red);
    draw_text(30, 60, "ALERTA: Anomalia local não identificada.");
}