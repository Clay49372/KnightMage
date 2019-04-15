if(hoverNode != noone)
{
	draw_sprite(selected, -1, gridx*global.GridSize, gridy * global.GridSize)
}


if(hoverNode != noone)
{
	
	
	text = string(gridx) + "/" + string(gridy) + " ="
	
	if(hoverNode.occupant != noone)
	{
		text += hoverNode.occupant.name
	}
	else
	{
		text += "noone"
	}
	draw_set_color(c_black)
	draw_rectangle(0,0,string_width(text), string_height(text),false)
	
	draw_set_color(c_white)
	draw_text(0,0, text)
}

if(selectedPerson != noone)
{
	text = selectedPerson.name
	
	draw_set_color(c_black)
	draw_rectangle(0,room_height,string_width(text), room_height - string_height(text),false)
	draw_set_color(c_white)
	draw_text(0,room_height - 16, text)
}