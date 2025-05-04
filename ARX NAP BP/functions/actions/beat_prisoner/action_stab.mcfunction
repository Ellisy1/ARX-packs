tag @s add self
execute as @p[tag=!self, r=3, hasitem={item=arx:shackles, location=slot.armor.legs}] at @s run tag @p[tag=self] add nearest_player_has_shackles
playanimation @s[tag=nearest_player_has_shackles] animation.player.stab
scoreboard players add @p[tag=!self, r=3, hasitem={item=arx:shackles, location=slot.armor.legs}] stress 1000
damage @p[tag=!self, r=3, hasitem={item=arx:shackles, location=slot.armor.legs}] 1 entity_attack entity @s
tellraw @p[tag=!self, r=3, hasitem={item=arx:shackles, location=slot.armor.legs}] { "rawtext": [ { "text": "§6Меня больно бьют!" } ] }
execute as @s[tag=!nearest_player_has_shackles] run tellraw @s { "rawtext": [ { "text": "§6Чтобы избить игрока в кандалах, сначала надо подойти к нему." } ] }
tag @s remove nearest_player_has_shackles
tag @s remove self