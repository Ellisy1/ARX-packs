clear @p 
give @p arx:music_volume_tuner 1 0 {"keep_on_death": {}}

scoreboard players set @s respawn_delay 0

tellraw @s { "rawtext": [ { "text": "=====" } ] }

tellraw @s[tag=rp_is_dead] { "rawtext": [ { "text": "§aПопробуем угробить ещё одного персонажа?" } ] }
tellraw @s[tag=!rp_is_dead] { "rawtext": [ { "text": "§aВам разрешена регистрация на Арксе! §dУбедитесь, что вы полностью ознакомлены с правилами Аркса, находящимися на дискорд-сервере Dragon Lair." } ] }
tellraw @s { "rawtext": [ { "text": "§l§4Вам назначен особый старт за призрака! Если вы этого не просили, обратитесь к управляющим." } ] }
tellraw @s { "rawtext": [ { "text": "§l§6Выберите биологический пол персонажа-призрака:" } ] }

scoreboard players set @p[tag=self, rx=-89] sk_a_21 1
scoreboard players set @p[tag=self, rx=-89] sk_a_22 1
scoreboard players set @p[tag=self, rx=-89] sk_a_23 1
scoreboard players set @p[tag=self, rx=-89] sk_a_24 1
scoreboard players set @p[tag=self, rx=-89] sk_a_25 1

scoreboard players set @s class 1
scoreboard players set @s[scores={verify=!2}] verify 1

give @p arx:registration_step1_female 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @p arx:registration_step1_male 1 0 {"item_lock": { "mode": "lock_in_inventory" }}

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @s remove rp_is_dead