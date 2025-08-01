pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function drawmap()
	c=011
	heartx=cornerx+((gamewidth-cornerx)/2)-4
	hearty=cornery+((gameheight-cornery)/2)-4
	rect(cornerx,cornery,gamewidth,gameheight,3)
	drawheart()
end
function drawheart()
	sprite=001
	if (hp==2) sprite=017
	if (hp==1) sprite=033
	if (hp<=0) sprite=049
	spr(sprite,heartx,hearty)
end