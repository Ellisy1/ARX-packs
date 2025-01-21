function registration/separation_line

# Действия при поднятой камере
    execute as @s[rx=-89, scores={custom_random=..500}] run function traits/get_neutral_trait
    execute as @s[rx=-89, scores={custom_random=501..}] run function traits/get_positive_trait
    execute as @s[rx=-89] run function traits/traitdata
    execute as @s[rx=-89] run tellraw @s { "rawtext": [{ "text": "§a↑↑↑ Случайная черта характера выдана!" } ] } 
    execute as @s[rx=-89] run function registration/transitions/to_4

# Действия в нормальной позиции
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§fВы получите §6черту характера§f с вероятностями: 50% - §aположительная§f, 50% - §6нейтральная§f, 0% - §cотрицательная§f. Это может как дать приятные бонусы, так и отяготить игру. Хорошо подумайте перед выбором." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aвы получите случайную черту характера." } ] } 

tellraw @s { "rawtext": [ { "text": " " } ] }