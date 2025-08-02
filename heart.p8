pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
heart_sprites = {
    max_hp = 001,
    two_thirds_hp = 017,
    one_third_hp = 033,
    dead = 049
}

Heart = {
    new = function(s, x, y, hp)
        local new_heart = {}
        setmetatable(new_heart, s)
        s.__index = s

        s.x = x
        s.y = y
        s.hp = hp
        s.max_hp = hp
        s.sprite = heart_sprites.max_hp

        return new_heart
    end,
    update = function(s)
        if s.hp == s.max_hp then 
            s.sprite = heart_sprites.max_hp
            return
        end
        if (s.hp <= s.max_hp / 3 * 2) s.sprite = heart_sprites.two_thirds_hp
        if (s.hp <= s.max_hp / 3) s.sprite = heart_sprites.one_third_hp
        if (s.hp <= 0) s.sprite = heart_sprites.dead
    end,
    draw = function(s)
        spr(s.sprite, s.x, s.y)
    end
    take_dmg = function(s, amt)
        s.hp -= amt
    end
}