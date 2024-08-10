function scr_save()
{
	SET[? "musicVolume"] =  global.volume;	
	ds_map_add(SET, "fullscreen",  SET[? "fullscreen"]);
	ds_map_add(SET, "musicVolume", global.volume);
	ds_map_secure_save(SET, "setti.dat");
}