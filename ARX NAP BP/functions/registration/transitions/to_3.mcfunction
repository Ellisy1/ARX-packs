# Переход на 2 этап регистрации

clear @s arx:registration_step2_warrior
clear @s arx:registration_step2_hunter
clear @s arx:registration_step2_mage

give @s arx:registration_step3_agree 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @s arx:registration_step3_refuse 1 0 {"item_lock": { "mode": "lock_in_inventory" }}

tellraw @s { "rawtext": [ { "text": "§l§6Хотите ли вы получить случайную черту характера?" } ] }