// Inputs
var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _select = keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left); 
var _volume_up = keyboard_check(vk_right);
var _volume_down = keyboard_check(vk_left);
var _move = _down - _up;
var _mouse_over_index = -1;
var _mouse_y_start = room_height * 0.4;
var _option_height = 20; 
//Select Menu
if (_move != 0) {
    index += _move;
    
    var _size = array_length(menu[sub_menu]);
    
    if (index < 0) {
        index = _size - 1;
    } else if (index >= _size) {
        index = 0;
    }
    _select_slider = false;
}

for (var _i = 0; _i < array_length(menu[sub_menu]); ++_i) {
    var _y = _mouse_y_start + global._gap * _i;
    if (mouse_y >= _y && mouse_y < _y + _option_height) {
        _mouse_over_index = _i;
    }
}


if (_mouse_over_index != -1) {
    index = _mouse_over_index;
}

if (_select) {
    switch (sub_menu) {
        case MAIN:
            switch (index) {
                case 0:
                    // StartGame
					scr_save();
                    room_goto(_next_room_index);
                    break;
                case 1:
                    // Settings
                    sub_menu = SETTINGS;
                    index = 0;
                    break;
                case 2:
                    // End Game
                    scr_save();
                    game_end();
                    break;
            }
            break;
        case SETTINGS:
            switch (index) {
                case 0:
                    // Select Music slider
                    _select_slider = true;
                    break;
                case 1:
                    // Fullscreen
                    SET[?"fullscreen"] = !SET[?"fullscreen"];
                    window_set_fullscreen(SET[?"fullscreen"]);
                    break;
                case 2:
                    // Back
                    sub_menu = MAIN;
                    index = 1;
                    _select_slider = false;
                    break;
            }
    }
}

//Slider
if (_select_slider)
{
    if (point_in_rectangle(mouse_x, mouse_y, _slider_x, _slider_y, _slider_x + _slider_width, _slider_y + _slider_height)) {
        if (mouse_check_button_pressed(mb_left)) {
            _slider_dragging = true;
        } else if (mouse_check_button_released(mb_left)) {
            _slider_dragging = false;
        }
  
        if (_slider_dragging) {
            var _mouse_pos = clamp(mouse_x - _slider_x, 0, _slider_width);
            global.volume = _mouse_pos / _slider_width;
			audio_sound_gain(global.music, global.volume, 0);
        }
    }

    if (_volume_up)
	{
        global.volume += 0.01;
        global.volume = clamp(global.volume, 0, 1);
		audio_sound_gain(global.music, global.volume, 0);
    } else if (_volume_down)
	{
        global.volume -= 0.01;
        global.volume = clamp(global.volume, 0, 1);
		audio_sound_gain(global.music, global.volume, 0);
    }
}