if (instance_position(mouse_x,mouse_y,par_player) && mouse_check_button_pressed(mb_left))
{
	player = instance_nearest(mouse_x,mouse_y,par_player)
	global.selected = player
	
}

if (global.selected != 0 && mouse_check_button_pressed(mb_right))
{
	with(global.selected)
	{
		script0(x,y, round(mouse_x/32)*32,round(mouse_y/32)*32)
	}
}
