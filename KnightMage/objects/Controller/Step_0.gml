
if(!instance_exists(guy1)&&!instance_exists(guy2)&&!instance_exists(guy3)&&!instance_exists(guy4))
{
	room_goto(4)
}
if(!instance_exists(bguy1)&&!instance_exists(bguy2)&&!instance_exists(bguy3)&&!instance_exists(bguy4))
{
	room_goto(3)
}


switch(state)
{

	case "initiative":
	temppr = ds_priority_create()
	with(guy)
	{
		initiativeRoll = irandom_range(1,20) + initiative
		
		ds_priority_add(other.temppr, id, initiativeRoll)
		
	}
	while(ds_priority_size(temppr) > 0)
	{
		ds_list_add(turn, ds_priority_delete_max(temppr))
	}
	turnmax = ds_list_size(turn)
	ds_priority_destroy(temppr)
	
	state = "start"
	break
	
	
	
	
	case "start":
	if(currentPerson == noone)
	{
		turncount +=1
		if(turncount >= turnmax)
		{
			turncount = 0
			roundcount += 1
		}
		
		currentPerson = ds_list_find_value(turn, turncount)
		
		if(instance_exists(currentPerson))
		{
			
			currentPerson.actions = 2
			currentPerson.act = true
		
			cursor_obj.selectedPerson = currentPerson
			PathFinding(global.map[currentPerson.gridx,currentPerson.gridy],currentPerson.move, currentPerson.actions)
		
			switch(currentPerson.attack)
			{
			
				case "range":
					rangedattack(currentPerson)
					break
				
				case "melee":
					meleeAttack(currentPerson)
					break
			
			}
		}
		else
		{
			currentPerson = noone	
		}
		
	}

	
	
	
}