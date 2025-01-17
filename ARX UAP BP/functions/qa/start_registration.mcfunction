clear @p 
give @p arx:music_volume_tuner 1 0 {"keep_on_death": {}}

scoreboard players set @s respawn_delay 0

tellraw @s { "rawtext": [ { "text": "=====" } ] }

tellraw @s[tag=rp_is_dead] { "rawtext": [ { "text": "§aПопробуем угробить ещё одного персонажа?" } ] }
tellraw @s[tag=!rp_is_dead] { "rawtext": [ { "text": "§aКак использовать предметы:\n§f> Для пк: нажмите ПКМ, держа предмет\n> Для телефона: зажмите на экране, держа предмет" } ] }
tellraw @s { "rawtext": [ { "text": "§l§6Выберите биологический пол своего персонажа:" } ] }

scoreboard players set @s class 0
scoreboard players set @s[scores={verify=!2}] verify 1

give @p arx:registration_step1_female 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @p arx:registration_step1_male 1 0 {"item_lock": { "mode": "lock_in_inventory" }}

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @s remove rp_is_dead