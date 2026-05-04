
// Room Start da Room_Cassino
global.fichas_atuais = 0;   // Começa liso toda vez que entra
global.tem_chave_setor = false;
global.frames_estoque = 0;  // Quantos frames ele comprou


global.pause = true;

global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

global.key_revert = ord("X");
global.key_enter = vk_enter;
global.key_left = vk_left;
global.key_right = vk_right
global.key_up = vk_up;
global.key_down = vk_down;

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sound_effects);


