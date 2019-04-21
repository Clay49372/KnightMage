
cx = mouse_x
cy = mouse_y

gridx = floor(cx/global.GridSize)
gridy = floor(cy/global.GridSize)

if(gridx <0 || gridy <0 || gridx >= room_width/global.GridSize || gridy >= room_height/global.GridSize)
{
	 hoverNode = noone
}
else
{
	hoverNode = map[gridx,gridy]
}
//Player one people

if(mouse_check_button(mb_right))
{
	if(selectedPerson != noone && hoverNode.moveNode)
	{
		current = hoverNode
		path = ds_priority_create()
		ds_priority_add(path,current,current.G)
		
		while(current.parent != noone)
		{
			ds_priority_add(path, current.parent, current.parent.G)
			
			current = current.parent
		}
		do
		{
			current = ds_priority_delete_min(path)
			path_add_point(selectedPerson.path, current.x, current.y, 100)
			
		}until (ds_priority_empty(path))
		
		ds_priority_destroy(path)
		
		global.map[selectedPerson.gridx, selectedPerson.gridy].occupant = noone
		selectedPerson.gridx = gridx
		selectedPerson.gridy = gridy
		hoverNode.occupant = selectedPerson
		selectedPerson.state = "begin path"
		if(hoverNode.G > selectedPerson.move)
		{
			selectedPerson.actions -= 2
			wipe_nodes()
		}
		else
		{
			selectedPerson.actions -= 1
			wipe_nodes()
		}
		
		selectedPerson = noone
	}
	
	if(selectedPerson != noone && hoverNode.attackNode == true)
	{
		switch(selectedPerson.attack)
		{
			case "range":
				selectedPerson.act = false
				selectedPerson.actions -= 1
				selectedPerson.target = hoverNode.occupant
				selectedPerson.state = "begin attack"
				selectedPerson.attacktime = 10
				selectedPerson = noone
				wipe_nodes()
				break
			
			case "melee":
				selectedPerson.act = false
				selectedPerson.actions -= 1
				selectedPerson.target = hoverNode.occupant
				selectedPerson.state = "begin attack"
				selectedPerson.attacktime = 10
				selectedPerson = noone
				wipe_nodes()
				break
		
		}
	}
}
