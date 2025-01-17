function registration/separation_line

tag @p add self

#Действия при поднятой камере
execute @p[tag=self, rx=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aЗадан набор навыков - маг!" } ] } 
scoreboard players set @p[tag=self, rx=-89] sk_a_21 1
scoreboard players set @p[tag=self, rx=-89] sk_a_22 1
scoreboard players set @p[tag=self, rx=-89] sk_a_23 1
scoreboard players set @p[tag=self, rx=-89] sk_a_24 1
scoreboard players set @p[tag=self, rx=-89] sk_a_25 1
scoreboard players set @p[tag=self, rx=-89] mp 100

clear @p[tag=self, rx=-89] arx:registration_step2_warrior
clear @p[tag=self, rx=-89] arx:registration_step2_hunter
clear @p[tag=self, rx=-89] arx:registration_step2_mage
tellraw @p[tag=self, rx=-89] { "rawtext": [ { "text": "§l§6Хотите ли вы получить случайную черту характера?" } ] }
give @p[tag=self, rx=-89] arx:registration_step3_agree 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @p[tag=self, rx=-89] arx:registration_step3_refuse 1 0 {"item_lock": { "mode": "lock_in_inventory" }}

#Действия в нормальной позиции
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fНабор навыков §bМАГ§f позволяет в самом начале игры начать постигать искусство магии. Конечно, на старте игры на мощные заклинания рассчитывать не стоит. Да и на слабые не стоит. Удачи." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш набор навыков - маг." } ] } 

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @p remove self