function registration/separation_line

tag @p add self

#Действия при поднятой камере
execute @p[tag=self, rx=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aСлучайная черта характера выдана!" } ] } 
execute @p[tag=self, rx=-89, scores={custom_random=..500}] ~ ~ ~ function traits/get_neutral_trait
execute @p[tag=self, rx=-89, scores={custom_random=501..}] ~ ~ ~ function traits/get_positive_trait

execute @p[tag=self, rx=-89] ~ ~ ~ function traits/traitdata
execute @s[rx=-89] ~ ~ ~ function food/set_tastes

clear @p[tag=self, rx=-89] arx:registration_step3_agree
clear @p[tag=self, rx=-89] arx:registration_step3_refuse
tellraw @p[tag=self, rx=-89] { "rawtext": [ { "text": "§l§6Перебрасывайте показатели вашего вкуса, пока они вам не понравятся!" } ] }
give @p[tag=self, rx=-89] arx:registration_step4_rerun 1 0 {"item_lock": { "mode": "lock_in_inventory" }}

#Действия в нормальной позиции
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fВы получите §6черту характера§f с вероятностями: 50% - §aположительная§f, 50% - §6нейтральная§f, 0% - §cотрицательная§f. Это может как дать приятные бонусы, так и отяготить игру. Хорошо подумайте перед выбором." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6-----\n§7§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aвы получите случайную черту характера." } ] } 

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @p remove self