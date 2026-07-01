if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = minha_velocidade; 
}

// -------------------------------------------------------------------------
// LÓGICA DE VALIDAÇÃO DO ITEM E PROMPT [E]
// -------------------------------------------------------------------------
mostrar_prompt_E = false; // Reseta a cada frame

// Só verifica se a caixa ainda não tiver sido ativada
if (!ativado) {
    // 1. Checa se o player está encostando na caixa de fusível
    if (place_meeting(x, y, Obj_player)) {
        
        // 2. Checa se o inventário existe e se o jogador está segurando o item correto
        if (instance_exists(Obj_inventory) && Obj_inventory.item_segurando != noone) {
            
            // Compara o id único guardado na struct do inventário com o que a caixa precisa
            if (Obj_inventory.item_segurando.id_unico == id_necessario) {
                
                mostrar_prompt_E = true; // Ativa o prompt!
                
                // 3. Se apertar "E" com o item correto em mãos:
                if (keyboard_check_pressed(ord("E"))) {
                    
                    // Se for consumível, gasta o item sumindo com ele da mão
                    if (consumivel) {
                        Obj_inventory.item_segurando = noone;
                    }
                    
                    // Executa o evento que abre a passagem secreta
                    event_user(0);
                    
                    // Limpa o teclado para não ativar nada por acidente nas linhas abaixo
                    io_clear(); 
                }
            }
        }
    }
}

// Executa o evento pai se houver alguma lógica genérica lá
event_inherited();