tag @p add self

#Дроп
give @p[tag=self, scores={sk_a_13=1}] arx:big_leech_skin 1

#Если нет навыков
tellraw @p[tag=self, scores={gender=1, sk_a_13=0}] { "rawtext": [ { "text": "§6Я ничего не смог достать..." } ] }
tellraw @p[tag=self, scores={gender=2, sk_a_13=0}] { "rawtext": [ { "text": "§6Я ничего не смогла достать..." } ] }

#Дропаем ОП
scoreboard players add @p xp_tray 10

#Удаляем предмет
clear @p arx:dead_big_leech 0 1

tag @p remove self