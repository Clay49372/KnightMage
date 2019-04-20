
if(cursor_obj.selectedPerson == id)
{
	if(cursor_obj.hoverNode != noone)
	{
		tempNode = cursor_obj.hoverNode
		if(tempNode.moveNode == true)
		{
		
			current = tempNode
	
			while(current.parent != noone)
			{
				draw_line_width_color(current.x +16, current.y +16, current.parent.x +16, current.parent.y +16, 4,c_lime,c_lime)
		
				current = current.parent
			}
	
	
		}
				if(tempNode.attackNode == true)
		{
			switch(attack)
			{
				
			case "range":
			draw_line_width_color(x + 16, y + 16, tempNode.x +16, tempNode.y + 16, 4, c_purple,c_purple)
			break
			
			}
	}

		}
	
}




draw_self()