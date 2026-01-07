execute as @s[scores={c_demon=0}] at @s run tellraw @s { "rawtext": [ { "text": "§cКажется, эта книга мне сейчас не нужна" } ] }
title @s[scores={c_demon=1}] subtitle §e§lогромное облегчение
title @s[scores={c_demon=1}] title §e§lвы чувствуете
execute as @s[scores={c_demon=1}] at @s run playsound undemon @a ~ ~ ~ 30
clear @s[scores={c_demon=1}] arx:undemon_book 0 1
scoreboard players set @s[scores={c_demon=1}] c_demon 0