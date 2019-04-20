/// @description Insert description here
// You can write your code in this editor
if(status != "miss")
{
	target.hp -= DamageDone
	for(i = o;i < 6; i +=1)
	{
		with(instance_create_layer(target.x +16, target.y + 16,"cursor", thing_obj))
		{
			direction = random(360)
			speed = random_range(2,4)
			scale = choose(2,3)
			image_speed = .5
			
		}
	}
	with(instance_create_layer(target.x +28,target.y + 2,"cursor",DamageNumbers))
	{
		text = "-" + string(other.damage)
		bottom = y
		
	}
}