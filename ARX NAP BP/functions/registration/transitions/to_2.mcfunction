# Переход на 2 этап регистрации

clear @s arx:registration_step1_female
clear @s arx:registration_step1_male

give @s arx:registration_step2_warrior 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @s arx:registration_step2_hunter 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @s arx:registration_step2_mage 1 0 {"item_lock": { "mode": "lock_in_inventory" }}

tellraw @s { "rawtext": [ { "text": "§6Какой старт вы хотите взять?" } ] }