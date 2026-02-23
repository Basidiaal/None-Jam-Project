// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Scr_funcoes(){

}

enum menu_actions
{
	run_method,
	load_menu
}

enum menus_list
{
    main,
	options
}

//Define allign
//@function define_align(vertical,horizontal);
function define_align(_ver,_hor)
{
	draw_set_halign(_hor);
	draw_set_valign(_ver);
}