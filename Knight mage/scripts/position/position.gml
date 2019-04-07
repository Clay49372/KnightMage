///movement(sx,sy,ex,ey)
//s is start e is end
sx = argument0
sy = argument1
ex = argument2
ey = argument3

if (!mp_grid_path(global.grid,global.path,sx,sy,ex,ey,1))
{
	show_message("unable to navigate")
	return false
}
else
{
	mp_grid_path(global.grid,global.path,sx,sy,ex,ey,1)
	path_start(global.path,3,0,false)
	return true
}