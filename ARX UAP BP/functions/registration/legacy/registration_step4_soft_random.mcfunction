tag @p add self

#Действия при поднятой камере
execute @p[tag=self, rx=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aЗадан вкус - мягкий случайный!" } ] } 
execute @p[tag=self, rx=-89] ~ ~ ~ function food/presets/soft_random

clear @p[tag=self, rx=-89] arx:registration_step4_fish_eater
clear @p[tag=self, rx=-89] arx:registration_step4_meat_eater
clear @p[tag=self, rx=-89] arx:registration_step4_neutral
clear @p[tag=self, rx=-89] arx:registration_step4_random
clear @p[tag=self, rx=-89] arx:registration_step4_soft_random
clear @p[tag=self, rx=-89] arx:registration_step4_sweet_tooth
tellraw @p[tag=self, rx=-89] { "rawtext": [ { "text": "§l§6Готовы ли вы? Если вы случайно ошиблись где-то в регистрации, обратитесь к модератору, чтобы перепройти её." } ] }
give @p[tag=self, rx=-89] arx:registration_step5_ready

#Действия в нормальной позиции
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fВсе вкусы вашего персонажа будут случайно выбраны в диапазоне от -50 до 50." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш вкус - мягкий случайный." } ] } 

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @p remove self