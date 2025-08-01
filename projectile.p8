pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
hurts_spritesets = {
    {vertical = 18, horizontal = 19},
    {vertical = 34, horizontal = 34},
    {vertical = 50, horizontal = 51},
}
apple_spritesets = {vertical = 35, horizontal = 35}

Projectile = {
    new = function(s, x, y, sprite, direction, flipx, flipy)
        local new_projectile = {}
        setmetatable(new_enemy, s)
        s.__index = s

        s.x = x 
        s.y = y 
        s.sprite = sprite
        s.direction = direction
        s.flipx = flipx
        s.flipy = flipy
        s.spd = factor()

        local hurtflag = 0
        local healflag = 1
        s.hurts = fget(s.sprite, hurtlfag)
        s.heals = fget(s.sprite, healflag)

        if (self.sprite == 34) s.spd = (factor()+1)/3
        if (self.sprite == 50 or self.sprite == 51) s.spd = factor()*1.5

        return new_projectile
    end,
    move = function(s)
        if (s.direction == 0) s.y += s.spd
        if (s.direction == 1) s.y -= s.spd
        if (s.direction == 2) s.x += s.spd
        if (s.direction == 3) s.x -= s.spd
    end,
    draw = function(s)
        spr(s.sprite, s.x, s.y, 1, 1, s.flipx, s.flipy)
    end
}


function spawn_projectile(dt) -- returns nil or Projectile
    if (dt % 20 != 0) return

    spriteset = nil
    vertical = 0 
    horizontal = 0

    spawn_apple = flr(rnd(30)) == 0
    if spawn_apple then
        spriteset = apple_spriteset
    else
        spriteset = rnd(hurt_spritesets)
    end
    vertical = spriteset.vertical
    horizontal = spriteset.horizontal

    direction = flr(rnd(4))

    if direction == 0 then
        startx = heartx
        starty = cornery
        sprite = vertical
        flipx = false
        flipy = true
    elseif direction == 1 then
        startx = heartx
        starty = gameheat
        sprite = vertical
        flipx = false
        flipy = false
    elseif direction == 2 then
        startx = cornerx
        starty = hearty
        sprite = horizontal
        flipx = false
        flipy = false
    else
        startx = gamewidth
        starty = hearty
        sprite = horizontal
        flipx = true
        flipy = false
    end
    return Projectile:new(startx, starty, sprite, direction, flipx, flipy)
end