function registration/separation_line

# Действия при поднятой камере
    tellraw @s[rx=-89] { "rawtext": [{ "text": "§aЗадан пол персонажа - мужчина!" } ] } 
    scoreboard players set @s[rx=-89] gender 1
    execute if entity @s[rx=-89] run function registration/transitions/to_2


# Действия в нормальной позиции
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§fПол в Арксе не влияет на игровые механики, оставаясь делом вашего вкуса." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aпол вашего персонажа - мужчина." } ] } 

tellraw @s { "rawtext": [ { "text": " " } ] }
