function registration/separation_line

# Действия при поднятой камере
    tellraw @s[rx=-89] { "rawtext": [{ "text": "§aЗадан старт - маг!" } ] } 
    tag @s[rx=-89] add __chose_mage_start__
    execute if entity @s[rx=-89] run function registration/transitions/to_3

# Действия в нормальной позиции
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§fВо время своих похождений вы узнали несколько заклинаний и записали их в книжку, которую всегда носите с собой. Ваш посох уже строват, да и руны не в лучшем виде, а волшебная палочка доживает свои последние дни." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш старт - маг." } ] } 

tellraw @s { "rawtext": [ { "text": " " } ] }