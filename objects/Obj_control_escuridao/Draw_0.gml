// Se já sumiu por completo, não precisa fazer mais nada
if (escuridao_alfa <= 0) exit;

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_largura = camera_get_view_width(view_camera[0]);
var cam_altura = camera_get_view_height(view_camera[0]);

if (!surface_exists(surf_escuridao)) {
    surf_escuridao = surface_create(cam_largura, cam_altura);
}

surface_set_target(surf_escuridao);

// ALTERAÇÃO AQUI: Limpamos com BRANCO para a surface aceitar a cor externa depois
draw_clear_alpha(c_white, 1.0);

gpu_set_blendmode(bm_subtract);

// Seu retângulo de recorte do quarto
var quarto_x1 = 0 - cam_x; 
var quarto_y1 = 0 - cam_y;
var quarto_x2 = 180 - cam_x; // Largura do seu quarto
var quarto_y2 = room_height - cam_y;

draw_rectangle(quarto_x1, quarto_y1, quarto_x2, quarto_y2, false);

gpu_set_blendmode(bm_normal);
surface_reset_target();

// A MÁGICA ACONTECE AQUI:
// Usamos draw_surface_ext para poder aplicar a cor customizada ($210505) e o alfa gradual
draw_surface_ext(surf_escuridao, cam_x, cam_y, 1, 1, 0, $210505, escuridao_alfa);