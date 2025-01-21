function registration/separation_line

#Действия при поднятой камере
    tellraw @s[rx=-89] { "rawtext": [{ "text": "§aЗадан набор навыков - воин!" } ] } 
    scoreboard players set @s[rx=-89] sk_a_1 1
    scoreboard players set @s[rx=-89] sk_a_2 1
    scoreboard players set @s[rx=-89] sk_a_3 1
    scoreboard players set @s[rx=-89] sk_a_4 1
    scoreboard players set @s[rx=-89] sk_a_5 1
    execute if entity @s[rx=-89] run function registration/transitions/to_3

#Действия в нормальной позиции
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§fНабор навыков §cВОИН§f позволяет в самом начале игры применять грубую силу и может приятно облегчить игру в перспективе, если ваш профиль - это решать конфликты путём расчленения несогласных." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш набор навыков - воин." } ] } 

tellraw @s { "rawtext": [ { "text": " " } ] }