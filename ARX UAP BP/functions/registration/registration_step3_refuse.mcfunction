function registration/separation_line

tag @p add self

#Действия при поднятой камере
execute @p[tag=self, rx=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aСлучайная черта характера проигнорирована!" } ] } 

clear @p[tag=self, rx=-89] arx:registration_step3_agree
clear @p[tag=self, rx=-89] arx:registration_step3_refuse
tellraw @p[tag=self, rx=-89] { "rawtext": [ { "text": "§l§6Перебрасывайте показатели вашего вкуса, пока они вам не понравятся!" } ] }
give @p[tag=self, rx=-89] arx:registration_step4_rerun 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
execute @s[rx=-89] ~ ~ ~ function food/set_tastes


#Действия в нормальной позиции
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fВы проигнорируете получение случайной черты характера." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aвы отказываетесь от случайной черты характера." } ] } 

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @p remove self