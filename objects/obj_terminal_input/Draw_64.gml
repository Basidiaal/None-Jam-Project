// Desenha um retângulo preto no centro e o texto de keyboard_string
draw_set_color(c_black);
draw_rectangle(view_wport[0]/2 - 100, view_hport[0]/2 - 20, view_wport[0]/2 + 100, view_hport[0]/2 + 20, false);
draw_set_color(c_lime);
draw_text(view_wport[0]/2, view_hport[0]/2, texto_atual);