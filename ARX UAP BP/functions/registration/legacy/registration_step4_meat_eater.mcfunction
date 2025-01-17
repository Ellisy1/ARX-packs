tag @p add self

#Действия при поднятой камере
execute @p[tag=self, rx=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aЗадан вкус - любитель мяса!" } ] } 
execute @p[tag=self, rx=-89] ~ ~ ~ function food/presets/meat_eater

clear @p[tag=self, rx=-89] arx:registration_step4_fish_eater
clear @p[tag=self, rx=-89] arx:registration_step4_meat_eater
clear @p[tag=self, rx=-89] arx:registration_step4_neutral
clear @p[tag=self, rx=-89] arx:registration_step4_random
clear @p[tag=self, rx=-89] arx:registration_step4_soft_random
clear @p[tag=self, rx=-89] arx:registration_step4_sweet_tooth
tellraw @p[tag=self, rx=-89] { "rawtext": [ { "text": "§l§6Готовы ли вы? Если вы случайно ошиблись где-то в регистрации, обратитесь к модератору, чтобы перепройти её." } ] }
give @p[tag=self, rx=-89] arx:registration_step5_ready

#Действия в нормальной позиции
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§fВаш персонаж будет гораздо больше любить мясо, чем что-либо ещё." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы подтвердить, что §l§aваш вкус - любитель мяса." } ] } 

tellraw @p { "rawtext": [ { "text": " " } ] }

tag @p remove self