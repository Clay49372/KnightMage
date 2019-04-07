if (instance_position(mouse_x,mouse_y,par_player) && mouse_check_button_pressed(mb_left))
{
	player = instance_nearest(mouse_x,mouse_y,par_player)
	global.selected = player

}

if (global.selected != 0 && mouse_check_button_pressed(mb_right))
{
	global.moving = true

	with(global.selected)
	{
		position(x,y, mouse_x-(mouse_x%32),mouse_y-(mouse_y%32))
	}
}
if (global.moving == true)
{
	with(global.selected == -1)
	{
		curx = x
		cury = y
		global.moving = false
	}
}
