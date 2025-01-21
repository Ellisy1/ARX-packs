function registration/separation_line

# Действия при поднятой камере
    tellraw @s[rx=-89] { "rawtext": [{ "text": "§aЗадан набор навыков - маг!" } ] } 
    scoreboard players set @s[rx=-89] sk_a_21 1
    scoreboard players set @s[rx=-89] sk_a_22 1
    scoreboard players set @s[rx=-89] sk_a_23 1
    scoreboard players set @s[rx=-89] sk_a_24 1
    scoreboard players set @s[rx=-89] sk_a_25 1
    scoreboard players set @s[rx=-89] mp 100
    execute if entity @s[rx=-89] run function registration/transitions/to_3

# Действия в нормальной позиции
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§fНабор навыков §bМАГ§f позволяет в самом начале игры начать постигать искусство магии. Конечно, на старте игры на мощные заклинания рассчитывать не стоит. Да и на слабые не стоит. Удачи." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш набор навыков - маг." } ] } 

tellraw @s { "rawtext": [ { "text": " " } ] }