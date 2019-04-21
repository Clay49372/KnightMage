
person = argument0

with(guy)
{
	if(team != other.person.team)
	{
		tempx = abs(gridx -other.person.gridx)
		tempy = abs(gridy - other.person.gridy)
		
		if(tempx <= 1 && tempy <= 1)
		{
			map[gridx,gridy].attackNode = true
			map[gridx,gridy].color = c_red
		}
		
	}
	
}