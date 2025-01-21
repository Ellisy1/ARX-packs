function registration/separation_line   

# Действия при поднятой камере
    tellraw @s[rx=-89] { "rawtext": [{ "text": "§aСлучайная черта характера проигнорирована!" } ] } 
    execute if entity @s[rx=-89] run function registration/transitions/to_4


# Действия в нормальной позиции
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§fВы проигнорируете получение случайной черты характера." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aвы отказываетесь от случайной черты характера." } ] } 

tellraw @s { "rawtext": [ { "text": " " } ] }