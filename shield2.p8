pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
shield_sprites = {
    up = 002,
    right = 003
}
Shield = {
    new = function(s, centerx, centery)
        local new_shield = {}
        setmetatable(new_shield, s)
        s.__index = s
        s.offset = 8
        s.centerx = centerx
        s.centery = centery
        s.x = centerx
        s.y = centery - s.offset
        s.flipx = false
        s.flipy = false
        s.direction = 0
        s.sprite = shield_sprites.up

        return new_shield
    end,
    update = function(s)
        if (btn(0)) s.direction = 3
        if (btn(1)) s.direction = 1
        if (btn(2)) s.direction = 0
        if (btn(3)) s.direction = 2

        if s.direction == 0 then
            s.sprite = shield_sprites.up
            s.x = s.centerx
            s.y = s.centery - s.offset
            s.flipx = false
            s.flipy = false
        elseif s.direction == 1 then
            s.sprite = shield_sprites.right
            s.x = s.centerx + s.offset
            s.y = s.centery 
            s.flipx = false
            s.flipy = false
        elseif s.direction == 2 then
            s.sprite = shield_sprites.up
            s.x = s.centerx 
            s.y = s.centery + s.offset
            s.flipx = false
            s.flipy = true
        elseif s.direction == 3 then
            s.sprite = shield_sprites.right
            s.x = s.centerx - s.offset
            s.y = s.centery
            s.flipx = true
            s.flipy = false
        end
    end,
    draw = function(s)
        spr(s.sprite, s.x, s.y, 1, 1, s.flipx, s.flipy)
    end
}