tag @s add self
execute as @p[tag=!self, r=3, hasitem={item=arx:shackles, location=slot.armor.legs}] at @s run tag @p[tag=self] add nearest_player_has_shackles
w @s[tag=nearest_player_has_shackles] §aНезабываемый хруст!
playanimation @s[tag=nearest_player_has_shackles] animation.player.break_limb
scoreboard players set @p[tag=!self, r=3, hasitem={item=arx:shackles, location=slot.armor.legs}] ill_broken_arm 72000
damage @p[tag=!self, r=3, hasitem={item=arx:shackles, location=slot.armor.legs}] 2 suicide
execute as @s[tag=!nearest_player_has_shackles] run w @s §6Чтобы сломать руку игроку в кандалах, сначала надо подойти к нему.
tag @s remove nearest_player_has_shackles
tag @s remove self