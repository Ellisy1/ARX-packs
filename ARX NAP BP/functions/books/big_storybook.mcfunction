execute as @s[scores={custom_random=0..333}] run tellraw @s { "rawtext": [ { "text": "Вы прочитали §dполезную§f историю." } ] }
execute as @s[scores={custom_random=0..333}] run scoreboard players add @s xp_tray 100
execute as @s[scores={custom_random=0..333}] run xp 100 @s
execute at @s[scores={custom_random=0..333}] run summon minecraft:xp_orb
execute at @s[scores={custom_random=0..333}] run summon minecraft:xp_orb
execute at @s[scores={custom_random=0..333}] run summon minecraft:xp_orb

execute as @s[scores={custom_random=334..500}] run tellraw @s { "rawtext": [ { "text": "Ē Вы прочитали §aинтересную§f историю!" } ] }
execute as @s[scores={custom_random=334..500}] run scoreboard players add @s stress -1000

execute as @s[scores={custom_random=501..666}] run tellraw @s { "rawtext": [ { "text": "đ Вы прочитали §cгрустную§f историю." } ] }
execute as @s[scores={custom_random=501..666}] run scoreboard players add @s stress 1500

execute as @s[scores={custom_random=667..799}] run tellraw @s { "rawtext": [ { "text": "Вы прочитали §cстрашную§f историю!" } ] }
execute as @s[scores={custom_random=667..799}] run function traits/get_negative_trait

execute as @s[scores={custom_random=800..932}] run tellraw @s { "rawtext": [ { "text": "Вы прочитали §eпоучительную§f историю." } ] }
execute as @s[scores={custom_random=800..932}] run function traits/get_neutral_trait

execute as @s[scores={custom_random=933..1000}] run tellraw @s { "rawtext": [ { "text": "Вы прочитали §aвоодушевляющую§f историю!" } ] }
execute as @s[scores={custom_random=933..1000}] run function traits/get_positive_trait