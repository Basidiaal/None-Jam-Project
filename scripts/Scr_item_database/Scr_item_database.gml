// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Scr_item_database(){
function get_item_data(_name) {
    switch(_name) {
        case "Chave Egípcia":
            return {
                nome: "Chave Egípcia",
                descricao: "Abre portas seladas por Anúbis.",
                tipo: "puzzle",
                acao: function() { /* Lógica para abrir porta */ }
            };
        case "Virus.exe":
            return {
                nome: "Virus.exe",
                descricao: "Interfere com a taxa de quadros do jogo.",
                tipo: "meta",
                acao: function() { room_speed = 10; alarm[0] = 60; } // Exemplo meta
            };
    }
}
}