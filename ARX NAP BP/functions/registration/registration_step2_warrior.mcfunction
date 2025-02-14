function registration/separation_line

#Действия при поднятой камере
    tellraw @s[rx=-89] { "rawtext": [{ "text": "§aЗадан старт - воин!" } ] } 
    tag @s[rx=-89] add __chose_warrior_start__
    execute if entity @s[rx=-89] run function registration/transitions/to_3

#Действия в нормальной позиции
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§fВы неплохо умеете обращаться с оружием и разбираетесь в клинках. С вами ваш старый изрядно видавший виды меч. Вы запасли пару зелий регенерации, и вы очень рады, что они всё ещё не пригодились." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш старт - воин." } ] } 

tellraw @s { "rawtext": [ { "text": " " } ] }