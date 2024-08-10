draw_set_halign(fa_center);
draw_set_font(ftn_menu);

for (var _i = 0; _i < array_length(menu[sub_menu]); ++_i)
{
    draw_set_color(c_white);
    
    if _i == index 
    {
        draw_set_color(c_red);
    }
    if is_array(menu[sub_menu][_i])
    {
        var _menu_arr = menu[sub_menu][_i];
        
        var _map_arr = SET[? _menu_arr[1]];
        
        if is_array(_map_arr)
        {
            var _limits_arr = _map_arr[1];
            
            if is_real(_limits_arr[0])
            {
                var _str = _menu_arr[0] + string(_map_arr[0]);
            }
            else
            {
                var _str = _menu_arr[0] + _limits_arr[_map_arr[0]]
            }
        }
        else
        {
            var _str = _menu_arr[0] + string(_map_arr);
        }
        
        // Slider
        if (_menu_arr[0] == "Volume ")
        {
			_slider_x = room_width/2 + 55;
			
			_slider_y = room_height * 0.4 + global._gap * _i;

			draw_rectangle_color(_slider_x, _slider_y, _slider_x + _slider_width, _slider_y + _slider_height, c_gray, c_gray, c_gray, c_gray, false);

			var _fill_width = _slider_width * global.volume;
			
			if (!_select_slider)
			{
				draw_rectangle_color(_slider_x, _slider_y, _slider_x + _fill_width, _slider_y + _slider_height, c_blue, c_blue, c_blue, c_blue, false);
			}
			else
			{
				draw_rectangle_color(_slider_x, _slider_y, _slider_x + _fill_width, _slider_y + _slider_height, c_red, c_red, c_red, c_red, false);
			}
			
			var _volume_text = string(global.volume * 100);

			_str = "Volume "+_volume_text;
			
			draw_text(room_width/2, room_height * 0.4 + global._gap * _i, _str);

        }
		else if(_menu_arr[0] == "Tela Cheia ")
		{
			if(SET[? "fullscreen"] == true)
			{
				_str = "Tela cheia: Ligada";
			}
			else
			{
				_str = "Tela cheia: Desligada";
			}
			
			draw_text(room_width/2, room_height * 0.4 + global._gap * _i, _str);
		}
		
    }
    else
    {
        var _str = menu[sub_menu][_i];
        draw_text(room_width/2, room_height * 0.4 + global._gap * _i, _str);
    }
}
