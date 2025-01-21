# Переход на 2 этап регистрации

clear @s arx:registration_step3_agree
clear @s arx:registration_step3_refuse

give @s arx:registration_step4_rerun 1 0 {"item_lock": { "mode": "lock_in_inventory" }}

tellraw @s { "rawtext": [ { "text": "§l§6Перебрасывайте показатели вкусов, пока они вам не понравятся!\n§r§o§eКомфортно играть можно с любым набором, так что не переживайте, что выберете что-то плохое." } ] }

function food/set_zero_tastes