// Deleta as listas para não dar Memory Leak (travamento por falta de RAM)
ds_list_destroy(mao_player);
ds_list_destroy(mao_dealer);
ds_list_destroy(deck);
