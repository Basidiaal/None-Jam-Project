randomize();
// No Create do Obj_blackjack_controller
fichas_visual_lista = ds_list_create(); 

// Inicialize também o valor, caso o Draw tente ler antes da primeira aposta
fichas_inimigo_aposta = 0;
// Proporção da tela que o feltro deve ocupar (0.95 = 95%)
proporcao_feltro = 0.85;

// Pegamos o tamanho da GUI (que se adapta à janela automaticamente)
largura_gui = display_get_gui_width();
altura_gui = display_get_gui_height();

// Centralizamos a posição da mesa
mesa_x = largura_gui / 2;
mesa_y = altura_gui / 2;

estado = "apostando";
aposta_fps = 0;
fichas_inimigo_aposta = 10;
mao_player = ds_list_create();
mao_dealer = ds_list_create();
deck = ds_list_create();

for(var i=0; i<52; i++) ds_list_add(deck, i);
ds_list_shuffle(deck);

mensagem = "Quanto FPS deseja apostar?";

largura_gui = display_get_gui_width();
altura_gui = display_get_gui_height();
mesa_x = largura_gui / 2;
mesa_y = altura_gui / 2;

pos_player_x = largura_gui / 2;
pos_player_y = altura_gui - 200;
pos_dealer_x = largura_gui / 2;
pos_dealer_y = 200;
pos_deck_x = largura_gui - 220;
pos_deck_y = 380;

espacamento_cartas = 60;
revelar_dealer = false;

pos_pote_central_x = largura_gui / 2;
pos_pote_central_y = altura_gui / 2 + 50; 
pos_fichas_player_x = 150; 
pos_fichas_player_y = altura_gui - 100;

timer_dealer = 0;
atraso_dealer = 45;


