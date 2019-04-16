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
	text = selectedPerson.name + " the " + selectedPerson.class 
	texthp = "hp: " +  string(selectedPerson.hp) + "/" + string(selectedPerson.maxhp)
	texthitb = "Hit Bonus: " + string(selectedPerson.bonus)
	
	draw_set_color(c_black)
	draw_rectangle(0,room_height - 34,string_width(text), room_height - 34 - string_height(text),false)
	draw_rectangle(0,room_height - 18,string_width(texthp), room_height - 18 - string_height(texthp),false)
	draw_rectangle(0,room_height - 2,string_width(texthitb), room_height - 2 - string_height(texthitb),false)
	draw_set_color(c_white)
	draw_text(0,room_height - 34 - string_height(text), text)
	draw_text(0,room_height - 18 - string_height(texthp), texthp)
	draw_text(0,room_height - 2 - string_height(texthitb), texthitb)
	
}