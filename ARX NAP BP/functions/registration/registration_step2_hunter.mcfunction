function registration/separation_line

# Действия при поднятой камере
    tellraw @s[rx=-89] { "rawtext": [{ "text": "§aЗадан старт - охотник!" } ] } 
    tag @s[rx=-89] add __chose_hunter_start__
    execute if entity @s[rx=-89] run function registration/transitions/to_3

# Действия в нормальной позиции
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§fВы в прошлом много охотились, добывая мясо, и несмотря на то, что навык вы заметно растеряли, старый лук и несколько стрел у вас есть. Вы взяли с собой еду и старое кольцо." } ] } 
    tellraw @s[rxm=-89] { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш старт - охотник." } ] } 

tellraw @s { "rawtext": [ { "text": " " } ] }