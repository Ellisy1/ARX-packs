# ЭТА ФУНКЦИЯ ЗАПУСКАЕТСЯ ПРЕДМЕТОМ ДЛЯ ПОВЫШЕНИЯ НАВЫКА ПЕРВОПРОХОДЦА

# Если камера не поднята rxm=-89
    tellraw @s[rxm=-89] { "rawtext": [ { "text": "§d1 очко обучения§f: Возвысить §eнавык ПЕРВОПРОХОДЦА\n§eБонусы для нечетных очков:\n§e>§f +5Ũ получаемого опыта\n§e>§f +1 переносимый вес\n§e>§f +100Ũ эффективность снятия отравления\n§eБонусы для четных очков:\n§e>§f +5Ũ получаемого опыта\n§e>§f +1 переносимый вес\n§e>§f +1 скорость" } ] } 
    tellraw @s[rxm=-89] { "rawtext": [ { "text": "§7§oЕсли вы уверены, что хотите преобрести это, §6поднимите камеру вертикально вверх§7 и §6используйте этот предмет ещё раз" } ] } 

# Если камера поднята rx=-89
    # Нет невложенных очков
        execute as @s[rx=-89, scores={skill_point=..0}] run tellraw @s { "rawtext": [ { "text": "§cНедостаточно очков обучения!" } ] } 

    # Есть невложенные очки
        execute as @s[rx=-89, scores={skill_point=1..}] run title @s title §eНавык первопроходца возвышен!
        execute as @s[rx=-89, scores={skill_point=1..}] run tellraw @s { "rawtext": [ { "text": "§eНавык первопроходца возвышен!" } ] } 
        execute as @s[rx=-89, scores={skill_point=1..}] run scoreboard players add @s trailblazer_skill 1
        execute as @s[rx=-89, scores={skill_point=1..}] run clear @s arx:trailblazer_up 0 1
        execute as @s[rx=-89, scores={skill_point=1..}] run scoreboard players add @s xp_tray 100
        execute as @s[rx=-89, scores={skill_point=1..}] at @s run playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
        execute as @s[rx=-89, scores={skill_point=1..}] at @s run playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
        execute as @s[rx=-89, scores={skill_point=1..}] run scoreboard players set @s[scores={ach_three_roads=0}] ach_three_roads 1
        execute as @s[rx=-89, scores={skill_point=1..}] run scoreboard players add @s skill_point -1