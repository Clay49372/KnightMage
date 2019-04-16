
path_clear_points(path)
state = "idle"

if(actions > 0)
{
	cursor_obj.selectedPerson = id
	PathFinding(global.map[gridx,gridy], move, actions)
	
	if(act){
		switch(attack)
		{
			
			case "range":
				rangedattack(id)
				break
			
			case "melee":
				break
		
		}
		
	}

}
else
{
	Controller.currentPerson = noone
}