
path_clear_points(path)
state = "idle"

if(actions > 0)
{
	cursor_obj.selectedPerson = id
	PathFinding(global.map[gridx,gridy], move, actions)
	
	if(act == true){
		switch(attack)
		{
			
			case "range":
				rangedattack(id)
				break
			
			case "melee":
				meleeAttack(id)
				break
		
		}
		
	}

}
else
{
	Controller.currentPerson = noone
}