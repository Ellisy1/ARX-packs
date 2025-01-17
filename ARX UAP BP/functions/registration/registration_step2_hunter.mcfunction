function registration/separation_line

tag @p add self

#Действия при поднятой камере
execute @p[tag=self, rx=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aЗадан набор навыков - охотник!" } ] } 
scoreboard players set @p[tag=self, rx=-89] sk_a_11 1
scoreboard players set @p[tag=self, rx=-89] sk_a_12 1
scoreboard players set @p[tag=self, rx=-89] sk_a_13 1
scoreboard players set @p[tag=self, rx=-89] sk_a_14 1
scoreboard players set @p[tag=self, rx=-89] sk_a_20 1

clear @p[tag=self, rx=-89] arx:registration_step2_warrior
clear @p[tag=self, rx=-89] arx:registration_step2_hunter
clear @p[tag=self, rx=-89] arx:registration_step2_mage
tellraw @p[tag=self, rx=-89] { "rawtext": [ { "text": "§l§6Хотите ли вы получить случайную черту характера?" } ] }
give @p[tag=self, rx=-89] arx:registration_step3_agree 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @p[tag=self, rx=-89] arx:registration_step3_refuse 1 0 {"item_lock": { "mode": "lock_in_inventory" }}

#Действия в нормальной позиции
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fНабор навыков §aОХОТНИК§f позволяет в самом начале игры эффективно приспособиться к миру Аркса, и, кушая котлету, наблюдать, как другие умирают с голода." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш набор навыков - охотник." } ] } 

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @p remove self