pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function drawshield(val)
 sprite=000
	if (val==0) then
		sprite=002
		shieldx=heartx
		shieldy=hearty-8
		flipx=false
		flipy=false
	end
	if (val==1) then
		sprite=003
		shieldx=heartx+8
		shieldy=hearty
		flipx=false
		flipy=false
	end
	if (val==2) then
		sprite=002
		shieldx=heartx
		shieldy=hearty+8
		flipx=false
		flipy=true
	end
	if (val==3) then
		sprite=003
		shieldx=heartx-8
		shieldy=hearty
		flipx=true
		flipy=false
	end
	spr(sprite,shieldx,shieldy,1,1,flipx,flipy)
end

function moveshield()
	if (btn(0)) val=3
	if (btn(1)) val=1
	if (btn(2)) val=0
	if (btn(3)) val=2
end
