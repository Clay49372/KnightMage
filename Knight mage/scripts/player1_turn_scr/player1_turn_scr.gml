if (instance_position(mouse_x,mouse_y,par_player) && mouse_check_button_pressed(mb_left))
{
	player = instance_nearest(mouse_x,mouse_y,par_player)
	global.selected = player

	move_squares()
}

if (global.selected != 0 && mouse_check_button_pressed(mb_right) && instance_position(mouse_x, mouse_y,move_square))
{
	global.moving = true

	with(global.selected)
	{
		position(x,y, mouse_x-(mouse_x%32),mouse_y-(mouse_y%32))
	}
}

