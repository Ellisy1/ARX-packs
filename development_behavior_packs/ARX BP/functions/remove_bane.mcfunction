# Определяем, если ли проклятие
    tag @s[scores={dwarf_curse=1}] add cursed

# Если проклят
    execute as @s[tag=cursed] run title @s title §eПроклятие снято
    execute as @s[tag=cursed] run scoreboard players set @s dwarf_curse 0
    execute as @s[tag=cursed] run event entity @s arx:scale_curse_remove
    execute at @s[tag=cursed] run playsound undemon @a ~ ~ ~ 30

    execute as @s[tag=cursed] run scoreboard players add @s xp_tray 700
    execute as @s[tag=cursed] run clear @s arx:scroll_of_bane_removing 0 1

# Если не проклят
    tellraw @s[tag=!cursed] { "rawtext": [ { "text": "§aЯ не проклят. Мне пока не нужен этот свиток" } ] }

# Чистим
    tag @s remove cursed