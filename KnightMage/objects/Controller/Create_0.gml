
state = "initiative"

randomise()

turn = ds_list_create()

turncount = -1

turnmax = 0

currentPerson = noone

roundcount = 0

globalvar map
global.GridSize = 32

mapWidth = room_width/global.GridSize
mapHieght = room_height/global.GridSize

global.blueteam = 1

global.redteam = 2

//mmaking grid
for(i = 0; i < mapWidth; i +=1)
{
	for(ii=0; ii< mapHieght; ii+=1)
	{
		global.map[i,ii] = instance_create_layer( i *global.GridSize, ii *global.GridSize,"grid",GridNode)
	}
}
//assigning nieghbors
for(i = 0; i < mapWidth; i +=1)
{
	for(ii=0; ii< mapHieght; ii+=1)
	{
		node = global.map[i,ii]
		
		//left neighbor
		if(i >0)
		{
			ds_list_add(node.Neighbors, global.map[i -1, ii])
		}
		//right neighbor
		if(i< mapWidth - 1)
		{
			ds_list_add(node.Neighbors, global.map[i +1, ii])
		}
		// top
		if(ii >0)
		{
			ds_list_add(node.Neighbors, global.map[i, ii -1])
		}
		//bottom
		if(ii< mapHieght -1)
		{
			 ds_list_add(node.Neighbors, global.map[i, ii +1])
		}
		//top left
		if(i > 0 && ii > 0)
		{
			ds_list_add(node.Neighbors, global.map[i - 1, ii - 1])
		}
		//top right
		if(i < mapWidth -1 && ii > 0)
		{
			ds_list_add(node.Neighbors, global.map[i + 1, ii - 1])
		}
		//bottom left
		if(i > 0 && ii < mapHieght -1)
		{
			ds_list_add(node.Neighbors, global.map[i - 1, ii + 1])
		}
		//bottom vright
		if(i < mapWidth -1 && ii < mapHieght -1)
		{
			ds_list_add(node.Neighbors, global.map[i + 1, ii + 1])
		}
	}
}

instance_create_layer(x,y,"cursor",cursor_obj)

//Team 1
with(instance_create_layer(5 * global.GridSize, 5* global.GridSize,"Instances",guy1))
{
	gridx = 5
	gridy = 5
	name = "guy1"
	global.map[gridx,gridy].occupant = id
}
with(instance_create_layer(20 * global.GridSize, 8* global.GridSize,"Instances",guy2))
{
	gridx = 20
	gridy = 8
	name = "guy2"
	global.map[gridx,gridy].occupant = id
}
with(instance_create_layer(5 * global.GridSize, 10* global.GridSize,"Instances",guy3))
{
	gridx = 5
	gridy = 10
	name = "guy3"
	global.map[gridx,gridy].occupant = id
}
with(instance_create_layer(5 * global.GridSize, 12* global.GridSize,"Instances",guy4))
{
	gridx = 5
	gridy = 12
	name = "guy4"
	global.map[gridx,gridy].occupant = id
}


//team 2
with(instance_create_layer(30 * global.GridSize, 5* global.GridSize,"Instances",bguy1))
{
	gridx = 30
	gridy = 5
	name = "bguy1"
	global.map[gridx,gridy].occupant = id
}
with(instance_create_layer(30 * global.GridSize, 8* global.GridSize,"Instances",bguy2))
{
	gridx = 30
	gridy = 8
	name = "bguy2"
	global.map[gridx,gridy].occupant = id
}
with(instance_create_layer(30 * global.GridSize, 10* global.GridSize,"Instances",bguy3))
{
	gridx = 30
	gridy = 10
	name = "bguy3"
	global.map[gridx,gridy].occupant = id
}
with(instance_create_layer(30 * global.GridSize, 12* global.GridSize,"Instances",bguy4))
{
	gridx = 30
	gridy = 12
	name = "bguy4"
	global.map[gridx,gridy].occupant = id
}