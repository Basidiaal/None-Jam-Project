alpha -= 0.05; // Vai sumindo aos poucos
if (alpha <= 0){
	instance_destroy();
	show_message("Sua realidade foi restaurada... mas o preço foi seu progresso.");
}// Se sumiu, deleta o objeto