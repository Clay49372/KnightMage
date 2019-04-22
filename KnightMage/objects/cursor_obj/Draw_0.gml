



if(selectedPerson != noone)
{
	text = selectedPerson.name + " the " + selectedPerson.class 
	texthp = "hp: " +  string(selectedPerson.hp) + "/" + string(selectedPerson.maxhp)
	texthitb = "Hit Bonus: " + string(selectedPerson.bonus)
	
	draw_set_color(c_black)
	draw_rectangle(0,0,string_width(text),string_height(text),false)
	draw_rectangle(0,16,string_width(texthp), 16+ string_height(texthp),false)
	draw_rectangle(0,32,string_width(texthitb),32 + string_height(texthitb),false)
	draw_set_color(c_white)
	draw_text(0,0, text)
	draw_text(0,16, texthp)
	draw_text(0,32, texthitb)
	
}