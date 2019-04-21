

y -= vspeed
vspeed -= gravity
if(y >= bottom)
{
	y = bottom
	gravity = 0
	fade = true
}
if(fade == true)
{
	alpha -= .1
}


