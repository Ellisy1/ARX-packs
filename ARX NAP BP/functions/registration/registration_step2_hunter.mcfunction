function registration/separation_line

# Действия при поднятой камере
    tellraw @s[rx=-89] { "rawtext": [{ "text": "§aЗадан набор навыков - охотник!" } ] } 
    scoreboard players set @s[rx=-89] sk_a_11 1
    scoreboard players set @s[rx=-89] sk_a_12 1
    scoreboard players set @s[rx=-89] sk_a_13 1
    scoreboard players set @s[rx=-89] sk_a_14 1
    scoreboard players set @s[rx=-89] sk_a_20 1
    execute if entity @s[rx=-89] run function registration/transitions/to_3

# Действия в нормальной позиции
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§fНабор навыков §aОХОТНИК§f позволяет в самом начале игры эффективно приспособиться к миру Аркса, и, кушая котлету, наблюдать, как другие умирают с голода." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш набор навыков - охотник." } ] } 

tellraw @s { "rawtext": [ { "text": " " } ] }