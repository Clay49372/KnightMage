
wipe_nodes()

list = ds_priority_create()
clist = ds_list_create()
start = argument0
range = argument1 * argument2
var current 
var neighbor 
var temp 
var cost 

ds_priority_add(list, start, start.G)

while(ds_priority_size(list) > 0)
{
	current = ds_priority_delete_min(list)
	
	ds_list_add(clist, current)
	
	for(i = 0; i< ds_list_size(current.Neighbors); i +=1)
	{
		neighbor = ds_list_find_value(current.Neighbors, i)
		//can put restrictions on the pathfinding here to move a person around the a wall or another person
		if(ds_list_find_index(clist, neighbor)<0 && neighbor.cost + current.G <= range && neighbor.passable && neighbor.occupant == noone)
		{
			if(ds_priority_find_priority(list,neighbor) == 0 || ds_priority_find_priority(list,neighbor) == undefined)
			{
				cost = 1
				neighbor.parent = current
				
				if(neighbor.gridx != current.gridx && neighbor.gridy != current.gridy)
				{
					cost = 1.5
				}
				
				neighbor.G = current.G + (neighbor.cost * cost)
				ds_priority_add(list, neighbor,neighbor.G)
				
			}
			else
			{
				cost = 1
				
				if(neighbor.gridx != current.gridx && neighbor.gridy != current.gridy)
				{
					cost = 1.5
				}
				temp = current.G + (neighbor.cost * cost)
				if(temp < neighbor.G)
				{
					neighbor.parent = current
					neighbor.G = temp
					ds_priority_change_priority(list,neighbor,neighbor.G)
				}
			}
		}
	}
} 

with(GridNode)
{
	G = floor(G)
}
ds_priority_destroy(list)

for(i =0; i < ds_list_size(clist); i+=1)
{
	current = ds_list_find_value(clist, i)
	current.moveNode = true
	
	Move_nodes(current, argument1, argument2)
}
start.move = false

ds_list_destroy(clist)