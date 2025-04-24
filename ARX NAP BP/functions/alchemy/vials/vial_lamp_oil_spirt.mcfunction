tag @s[scores={lamp_oil=..99999}] add allow_fill_up
scoreboard players add @s[tag=allow_fill_up] lamp_oil 25000
tellraw @s[tag=allow_fill_up] { "rawtext": [ { "text": "§aДобавлено 25% к топливу лампы." } ] }
clear @s[tag=allow_fill_up] arx:vial_lamp_oil_spirt 0 1
give @s[tag=allow_fill_up] arx:vial
scoreboard players add @s[tag=allow_fill_up] xp_tray 5
tellraw @s[tag=!allow_fill_up] { "rawtext": [ { "text": "§cЛампа уже заполнена на 100%" } ] }
tag @s remove allow_fill_up