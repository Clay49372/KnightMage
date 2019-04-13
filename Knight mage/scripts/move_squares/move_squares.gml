for (i =0;i<18;i+=1)
{
	var i_x
	i_x = 32+32*i
	if(i_x >= 576)
	{
		i = 0
		row+= 32
	}
	if (mp_grid_path(global.grid, global.path,global.selected.curx,global.selected.cury,i_x,row,1))
	{
		if(path_get_length(global.path) <= global.selected.move_speed)
		{
			instance_create_layer(i_x,row,"move",move_square)
		}
	}
	if(row > 320)
	{
		row = 0
		i = 20
	}
}