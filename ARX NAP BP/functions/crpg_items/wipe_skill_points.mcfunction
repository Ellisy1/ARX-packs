# ЭТА ФУНКЦИЯ ЗАПУСКАЕТСЯ РУНОЙ СБРОСА ОЧКОВ ОБУЧЕНИЯ

# Определяем, есть ли вложенные очки обучения
    execute as @s[scores={strength_skill=1..}] run tag @s add allow_wipe
    execute as @s[scores={speed_skill=1..}] run tag @s add allow_wipe
    execute as @s[scores={magic_skill=1..}] run tag @s add allow_wipe

# Камера вверх
    # Есть вложенные очки обучения
        execute as @s[tag=allow_wipe, rx=-89] run tellraw @s { "rawtext": [ { "text": "§a§lВложенные очки успешно возвращены! Вы можете их заново вложить туда, куда хотите." } ] } 
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players operation @s skill_point += @s strength_skill
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players operation @s skill_point += @s magic_skill
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players operation @s skill_point += @s speed_skill
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players operation @s skill_point += @s trailblazer_skill
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players operation @s skill_point += @s might_skill

        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players set @s strength_skill 0
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players set @s magic_skill 0
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players set @s speed_skill 0
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players set @s trailblazer_skill 0
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players set @s might_skill 0

        execute as @s[tag=allow_wipe, rx=-89] at @s run playsound undemon @a ~ ~ ~
        execute as @s[tag=allow_wipe, rx=-89] run clear @s arx:wipe_skill_points 0 1
        execute as @s[tag=allow_wipe, rx=-89] run scoreboard players add @s xp_tray 500

    # Нет вложенных очков
        execute as @s[tag=!allow_wipe, rx=-89] run tellraw @s { "rawtext": [ { "text": "§6Нет очков обучения, которые можно сбросить." } ] }

# Нормальное положение камеры
    tellraw @s[rxm=-89] { "rawtext": [ { "text": "Возврат потраченных очков обучения." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [ { "text": "§8§oЕсли вы уверены, что хотите вернуть все вложенные очки обучения, поднимите камеру вертикально вверх и используйте этот предмет ещё раз." } ] } 

# Чистим
    tag @s remove allow_wipe