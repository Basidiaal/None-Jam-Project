// Bloqueia a coleta enquanto o puzzle não estiver resolvido
if (!global.puzzle_resolvido) {
    exit;
}

// Delega toda a lógica de coleta, animação e inventário ao pai
event_inherited();