function scr_load(_file_name)
{
	if (file_exists("setti.dat"))
	{
	    var _loaded_settings = ds_map_secure_load("setti.dat");
	    if (_loaded_settings != -1)
	    {
			SET = _loaded_settings;
	    }
	} 
	else
	{
	    ds_map_add(SET, "musicVolume", 0.5);
	    ds_map_add(SET, "fullscreen", false);
	}

	global.volume = SET[? "musicVolume"];
	window_set_fullscreen(SET[? "fullscreen"]);
}