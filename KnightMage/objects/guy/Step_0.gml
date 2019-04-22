
if(hp <= 0)
{
	map[gridx,gridy].occupant = noone
	instance_destroy()
}

switch(state)
{
	case "begin path":
		path_start(path, moveSpeed, 0,true)
		state = "moving"
		break
		
	case"begin attack":
		attacktime -= 1
		if(attacktime <= 0)
		{
			state = "attack"
		}
		break
		
	case"attack":
		attackroll = irandom_range(1,20) + bonus
		if(attackroll >= target.defense)
		{
			attackStatus = "hit"
		}
		else
		{
			attackStatus = "miss"
		}
		tempdamage = 0
		if(attackStatus != "miss")
		{
			tempdamage = irandom_range(1,maxdamage) + damagebonus
				
		}
		//switch for different types of attack
		switch(attack)
		{

			
			case "range":
				audio_play_sound(magic_sound,1,0)
				attackdirection = point_direction(x+16, y+16,target.x +16,target.y +16)
			
				beginx = x + 16 + lengthdir_x(30, attackdirection)
				beginy = y + 16 + lengthdir_y( 30, attackdirection)
			
				with(instance_create_layer(beginx,beginy,"cursor",MagicBall_obj))
				{
					target = other.target
					status = other.attackStatus
					DamageDone = other.tempdamage
					path_add_point(movement, other.beginx,other.beginy, 100)
					if(status != "miss")
					{
						path_add_point(movement, target.x + 16, target.y +16, 100)
						audio_play_sound(Hurt_sound,1,0)
					}
					else
					{
						path_add_point(movement, target.x + random_range(30, 60)* choose(-1,1), target.y + random_range(30, 60)* choose(-1,1),100)
					}
					path_start(movement,speed,true,true)
					
				}
				state = "end attack"
				attacktime = 30
				break
			
			
			
			
			case "melee":
				audio_play_sound(melee_sound,1,0)
				if(attackStatus != "miss")
				{
					for(i = 0; i <6; i +=1)
					{
						with(instance_create_layer(target.x +16, target.y + 16,"cursor", thing_obj))
						{
							direction = irandom(360)
							speed = choose(2,4)
							scale = choose(2,3)
							image_speed = .5

						}
					}
					//done damage
					target.hp -= tempdamage
					
					
					with(instance_create_layer(target.x + 28, target.y + 2,"cursor", DamageNumbers))
					{
						text = "-" + string(other.tempdamage)
						bottom = y
						audio_play_sound(Hurt_sound,1,0)
					}
				}
				else
				{
					with(instance_create_layer(target.x + 28, target.y + 2,"cursor", DamageNumbers))
					{
						text = "miss"
						bottom = y
					}
				}
				
				state = "end attack"
				
				attacktime = 10
				break
			
			
		}
		break
		
	case"end attack":
		attacktime -=1
		if(attacktime <=0)
		{
			if(actions > 0)
			{
				cursor_obj.selectedPerson = id
				PathFinding(map[gridx,gridy], move,actions)
			}
			else
			{
				Controller.currentPerson = noone
			}
			state = "idle"
		}
		break

}