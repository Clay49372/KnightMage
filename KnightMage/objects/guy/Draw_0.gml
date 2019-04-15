
if(cursor_obj.hoverNode != noone && cursor_obj.hoverNode != global.map[gridx,gridy])
{
	current = cursor_obj.hoverNode
	
	while(current.parent != noone)
	{
		draw_line_width_color(current.x +16, current.y +16, current.parent.x +16, current.parent.y +16, 4,c_lime,c_lime)
		
		current = current.parent
	}
}




draw_self()