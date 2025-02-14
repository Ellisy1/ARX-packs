clear @s 
give @s arx:music_volume_tuner 1 0 {"keep_on_death": {}}

scoreboard players set @s respawn_delay 0

tellraw @s[tag=rp_is_dead] { "rawtext": [ { "text": "§aПопробуем угробить ещё одного персонажа?" } ] }

tellraw @s[tag=!rp_is_dead] { "rawtext": [ { "text": "§bДобро пожаловать в Аркс!" } ] }
tellraw @s[tag=!rp_is_dead] { "rawtext": [ { "text": "§6==========" } ] }
tellraw @s[tag=!rp_is_dead] { "rawtext": [ { "text": "§aАркс - РП сервер, здесь вы играете §lза своего персонажа§r§a. Сейчас вам предстоит его настроить! Не переживайте, это несложно." } ] }
tellraw @s[tag=!rp_is_dead] { "rawtext": [ { "text": "§6==========" } ] }
tellraw @s[tag=!rp_is_dead] { "rawtext": [ { "text": "§aКак использовать предметы:\n§f> §eДля пк:§f нажмите ПКМ, держа предмет\n> §eДля телефона:§f зажмите на экране, держа предмет" } ] }
tellraw @s { "rawtext": [ { "text": "§l§6Выберите пол своего персонажа:" } ] }

scoreboard players set @s class 0
scoreboard players set @s[scores={verify=!2}] verify 1

give @s arx:registration_step1_female 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @s arx:registration_step1_male 1 0 {"item_lock": { "mode": "lock_in_inventory" }}

tellraw @s { "rawtext": [ { "text": " " } ] }

tag @s remove rp_is_dead
tag @s remove __chose_mage_start__
tag @s remove __chose_hunter_start__
tag @s remove __chose_warrior_start__