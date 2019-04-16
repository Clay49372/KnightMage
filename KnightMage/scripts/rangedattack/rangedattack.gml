
person = argument0

with(guy)
{
	temp = other.person
	
	if(team != temp.team)
	{
		if(point_distance(x + 16, y + 16, temp.x + 16, temp.y + 16) <= temp.AttackRange)
		{
			if(collision_line(x +16, y +16,temp.x +16,temp.y +16,guy,false,false))
			{
				global.map[gridx, gridy].attackNode = true
				global.map[gridx, gridy].color = c_red
			
			}
		}
	}
	
}