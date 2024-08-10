#macro MAIN		0
#macro SETTINGS		1

global.dsm_settings = ds_map_create();
#macro SET		global.dsm_settings

scr_load("setti.dat");

menu[MAIN][0] = "Jogar";
menu[MAIN][1] = "Configuracoes";
menu[MAIN][2] = "Sair";

menu[SETTINGS][0] = ["Volume ", "musicVolume"];
menu[SETTINGS][1] = ["Tela Cheia ", "fullscreen"];
menu[SETTINGS][2] = "Voltar";

_next_room_index = 1

index = 0;
sub_menu = 0;
_select_slider = false;

_slider_x = 100;
_slider_y = 200;
_slider_width = 200;
_slider_height = 20;
global._gap = 40;

_slider_dragging = false;

if(_show_only_back_bt)
{
	_next_room_index = 0
	menu[MAIN] = [menu[MAIN][0]];
	menu[MAIN][0] = "Voltar";
}





