function registration/separation_line

tag @p add self

#Действия при поднятой камере
execute @p[tag=self, rx=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aЗадан пол - мужчина!" } ] } 
scoreboard players set @p[tag=self, rx=-89] gender 1

clear @p[tag=self, rx=-89] arx:registration_step1_female
clear @p[tag=self, rx=-89] arx:registration_step1_male
tellraw @p[tag=self, rx=-89, scores={class=0}] { "rawtext": [ { "text": "§l§6Какой стартовый набор навыков вы хотите взять?" } ] }
give @p[tag=self, rx=-89, scores={class=0}] arx:registration_step2_warrior 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @p[tag=self, rx=-89, scores={class=0}] arx:registration_step2_hunter 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @p[tag=self, rx=-89, scores={class=0}] arx:registration_step2_mage 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
tellraw @p[tag=self, rx=-89, scores={class=1}] { "rawtext": [ { "text": "§l§6Хотите ли вы получить случайную черту характера?" } ] }
give @p[tag=self, rx=-89, scores={class=1}] arx:registration_step3_agree 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
give @p[tag=self, rx=-89, scores={class=1}] arx:registration_step3_refuse 1 0 {"item_lock": { "mode": "lock_in_inventory" }}


#Действия в нормальной позиции
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fПол в Арксе не влияет на игровые механики, оставаясь делом вашего вкуса." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш пол - мужчина." } ] } 

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @p remove self