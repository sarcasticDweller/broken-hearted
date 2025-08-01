pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-->8
--enemies
function factor() return ((points/10*0.02)+1) end
function spawnenemies()
	ticker+=factor()
	if (ticker>20) then
	 ticker=0
	 spval=flr(rnd(3))
	 if (spval==0) then
	 	vert=18
	 	hori=19
	 end
	 if (spval==1) then
	 	vert=34
	 	hori=34
	 end
	 if (spval==2) then
			vert=50
			hori=51
	 end
	 apple=flr(rnd(30))
	 if (apple==0) then
	 	vert=35
	 	hori=35
	 end
	 foo=flr(rnd(4))
	 if (foo==0) then
	 	startx=heartx
	 	starty=cornery
	 	sprite=vert
	 	flipx=false
	 	flipy=true
	 end
	 if (foo==1) then
	 	startx=heartx
	 	starty=gameheight
	 	sprite=vert
	 	flipx=false
	 	flipy=false
	 end
	 if (foo==2) then
	 	startx=cornerx
	 	starty=hearty
	 	sprite=hori
	 	flipx=false
	 	flipy=false
	 end
	 if (foo==3) then
	 	startx=gamewidth
	 	starty=hearty
	 	sprite=hori
	 	flipx=true
	 	flipy=false
	 end
	 makeenemy(startx,starty,sprite,foo,flipx,flipy)
	end
end
function makeenemy(startx,starty,sprite,foo,flipx,flipy)
	add(enemies, {
		
		x=startx,
		y=starty,
		direction=sprite,
		kind=sprite,
		vel=foo,
		
		collide=function(self)
			if(collisions(self.x,self.y,8,8,heartx,hearty,8,8))
		 then
		 	del(enemies, self)
		 	if (fget(self.kind,0)) then
					sfx(2)
					points-=1
					hp-=1
				elseif (fget(self.kind,1)) then
					if (hp<3) then
						sfx(5)
						hp+=1
					else
						sfx(6)
						points-=5
					end
				end
			elseif(collisions(self.x,self.y,8,8,shieldx,shieldy,8,8))
			then
			 points+=1
			 del(enemies,self)
			 sfx(1)
			end
		end,
					
		move=function(self)
			if (self.kind==34) then
				spd=(factor()+1)/3
			elseif (self.kind==50) or
			(self.kind==51) then
				spd=factor()*1.5
			else
				spd=factor()
			end
			if (self.vel==0) self.y+=spd
			if (self.vel==1) self.y-=spd
			if (self.vel==2) self.x+=spd
			if (self.vel==3) self.x-=spd
		end,
		
		draw=function(self)
			spr(self.direction,self.x,self.y,1,1,flipx,flipy)
		end
	})
end
function clearenemies()
	for e in all(enemies) do 
		del(enemies,e) 
	end
end