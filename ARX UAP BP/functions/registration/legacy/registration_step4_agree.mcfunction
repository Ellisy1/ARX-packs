function registration/separation_line

tag @p add self

#Действия при поднятой камере
execute @p[tag=self, rx=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aВкусы успешно установлены!" } ] } 

clear @p[tag=self, rx=-89] arx:registration_step4_agree
clear @p[tag=self, rx=-89] arx:registration_step4_rerun
tellraw @p[tag=at_respawn_room, tag=self, rx=-89] { "rawtext": [ { "text": "§l§6Готовы ли вы? Если вы случайно ошиблись где-то в регистрации, обратитесь к модератору, чтобы перепройти её." } ] }
give @p[tag=at_respawn_room, tag=self, rx=-89] arx:registration_step5_ready 1 0 {"item_lock": { "mode": "lock_in_inventory" }}


#Действия в нормальной позиции
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fВнимательно изучите полученные вкусы." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aвы выбрали себе вкусы." } ] } 

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @p remove self